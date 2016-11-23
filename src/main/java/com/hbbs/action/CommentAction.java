package com.hbbs.action;

import com.hbbs.model.*;
import com.hbbs.service.IArticleService;
import com.hbbs.service.ICommentService;
import com.hbbs.service.IUserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Hua on 2016/10/30.
 */
@Namespace("/")
@ParentPackage("json-default")
@Action(
        results = {
                @Result(name = "add",location = "/comment/add.jsp"),
                @Result(name = "list",location = "/comment/list.jsp"),
                @Result(name = "edit",location = "/comment/edit.jsp"),
                @Result(name = "json",type = "json",params = {"root","root"}),
                @Result(location = "index.jsp")
        }
)
public class CommentAction extends ActionSupport implements ModelDriven<Comment> {
    private static final Logger logger = Logger.getLogger(Comment.class);
    private Comment comment = new Comment();
    private List<Comment> comments = new ArrayList<Comment>();
    private ICommentService commentService;
    private IUserService userService;
    private IArticleService articleService;
    private JSONObject root = new JSONObject();
    private boolean ajax = false;
    private DataPage dp = new DataPage();
    private String userId;
    private String articleId;

    public Comment getModel() {
        return comment;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public ICommentService getCommentService() {
        return commentService;
    }

    @Autowired
    public void setCommentService(ICommentService commentService) {
        this.commentService = commentService;
    }

    public IUserService getUserService() {
        return userService;
    }

    @Autowired
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    public IArticleService getArticleService() {
        return articleService;
    }

    @Autowired
    public void setArticleService(IArticleService articleService) {
        this.articleService = articleService;
    }

    public JSONObject getRoot() {
        return root;
    }

    public void setRoot(JSONObject root) {
        this.root = root;
    }

    public boolean isAjax() {
        return ajax;
    }

    public void setAjax(boolean ajax) {
        this.ajax = ajax;
    }

    public DataPage getDp() {
        return dp;
    }

    public void setDp(DataPage dp) {
        this.dp = dp;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public String add() {
        return "add";
    }

    public String edit() {
        return "edit";
    }

    public String list() {
        root.put("success", false);
        try {
            Article a = articleService.loadById(articleId);
            comment.setArticle(a);
            dp.setCount(commentService.total(comment));
            comments = commentService.list(comment, dp);
            root.put("success", true);
            root.put("msg", "回复列表查询成功");
            root.put("dp", dp);
            JSONArray cs = new JSONArray();
            for (Comment c : comments) {
                cs.add(c.toJSONObject());
            }
            root.put("comments", cs);
        } catch (Exception e) {
            root.put("msg", "回复列表查询错误");
            logger.error("回复列表查询错误");
        }
        return ajax?"json":"list";
    }

    public String doAdd() {
        root.put("success", false);
        Article a = articleService.loadById(articleId);
        comment.setArticle(a);
        if (comment.getArticle() == null) {
            root.put("msg", "回复添加失败,请选择回复主题");
            return "json";
        }
        try {
            if (comment.getUser() == null) {
                SessionInfo sessionInfo = (SessionInfo) ServletActionContext.getRequest().getSession().getAttribute("sessionInfo");
                if (sessionInfo != null) {
                    User u = userService.loadByUsername(sessionInfo.getLoginUsername());
                    comment.setUser(u);
                }
            }
            commentService.add(comment);
            root.put("success", true);
            root.put("msg", "回复添加成功");
        } catch (Exception e) {
            root.put("success", "回复添加失败");
            logger.error("回复添加失败");
        }
        return ajax?"json":"success";
    }

    public String doDelete() {
        root.put("success", false);
        Comment c = commentService.loadById(comment.getId());
        if (c != null) {
            try {
                commentService.deleteById(comment.getId());
                root.put("success", true);
                root.put("msg", "回复删除成功");
            } catch (Exception e) {
                root.put("msg", "回复删除失败");
                logger.error("回复删除失败");
            }
        }
        return ajax?"json":"success";

    }

    public String doEdit() {
        root.put("success", false);
        try {
            Comment c = commentService.loadById(comment.getId());
            if (c != null) {
                commentService.update(c);
                root.put("success", true);
                root.put("msg", "回复更新成功");
            }
        } catch (Exception e) {
            root.put("msg", "回复更新失败");
            logger.error("回复更新失败");
        }
        return ajax ? "json" : "success";
    }

}
