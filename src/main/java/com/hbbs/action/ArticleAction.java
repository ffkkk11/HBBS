package com.hbbs.action;

import com.hbbs.model.*;
import com.hbbs.service.IArticleService;
import com.hbbs.service.ICommentService;
import com.hbbs.service.ITagService;
import com.hbbs.service.IUserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
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
                @Result(name = "add",location = "/article/add.jsp"),
                @Result(name = "list",location = "/article/list.jsp"),
                @Result(name = "show",location = "/article/show.jsp"),
                @Result(name = "edit",location = "/article/edit.jsp"),
                @Result(name = "json",type = "json",params = {"root","root"}),
                @Result(location = "index.jsp")
        }
)
public class ArticleAction extends ActionSupport implements ModelDriven<Article> {
    private static final Logger logger = Logger.getLogger(Article.class);
    private IArticleService articleService;
    private IUserService userService;
    private ITagService tagService;
    private ICommentService commentService;
    private Article article = new Article();
    private List<Article> articles = new ArrayList<Article>();
    private List<Comment> comments = new ArrayList<Comment>();
    private List<Tag> tags = new ArrayList<Tag>();
    private JSONObject root = new JSONObject();
    private boolean ajax = false;
    private DataPage dp = new DataPage();
    private String tagName;

    public Article getModel() {
        return article;
    }

    public IArticleService getArticleService() {
        return articleService;
    }

    @Autowired
    public void setArticleService(IArticleService articleService) {
        this.articleService = articleService;
    }

    public IUserService getUserService() {
        return userService;
    }

    @Autowired
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    public ITagService getTagService() {
        return tagService;
    }

    @Autowired
    public void setTagService(ITagService tagService) {
        this.tagService = tagService;
    }

    public ICommentService getCommentService() {
        return commentService;
    }

    @Autowired
    public void setCommentService(ICommentService commentService) {
        this.commentService = commentService;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
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

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public String add() {
        dp.setSize(1000);
        tags = tagService.list(new Tag(), dp);
        return "add";
    }

    public String show() {
        root.put("success", false);
        try {
            article = articleService.loadById(article.getId());
            article.setBrowse(article.getBrowse()+1);
            articleService.update(article);
            root.put("success", true);
            root.put("msg", "文章内容查询成功");
            root.put("article", article.toJSONObject());
            JSONArray cs = new JSONArray();
        } catch (Exception e) {
            root.put("msg", "文章内容查询错误");
            logger.error("文章内容查询错误");
        }
        return ajax?"json":"show";
    }

    public String edit() {
        return "edit";
    }

    public String list() {
        root.put("success", false);
        try {
            dp.setCount(articleService.total(article));
            articles = articleService.list(article, dp);
            root.put("success", true);
            root.put("msg", "文章列表查询成功");
            root.put("dp", dp);
            JSONArray as = new JSONArray();
            for(Article a : articles) {
                as.add(a.toJSONObject());
            }
            root.put("articles", as);
        } catch (Exception e) {
            root.put("msg", "文章列表查询错误");
            logger.error("文章列表查询错误");
        }
        return ajax?"json":"list";
    }

    public String doAdd() {
        root.put("success", false);
        Tag t ;
        if(tagName == null || tagName.trim().equals("")) {
            root.put("msg", "请选择标签");
            return "json";
        }
        t = tagService.loadByName(tagName.trim());

        if (t == null) {
            t = new Tag();
            t.setName(tagName.trim());
            tagService.add(t);
            t = tagService.loadByName(tagName.trim());
        }

        article.setTag(t);
        if(article.getTag() == null) {
            root.put("msg","文章添加失败，请选择标签");
            return "json";
        }
        try {
            SessionInfo sessionInfo =(SessionInfo) ServletActionContext.getRequest().getSession().getAttribute("sessionInfo");
            if (sessionInfo != null) {
                User u = userService.loadByUsername(sessionInfo.getLoginUsername());
                article.setUser(u);
            }
            if(article.getUser() == null) {
                root.put("msg", "文章添加失败，请登陆");
                return "json";
            }
            articleService.add(article);
            root.put("success", true);
            root.put("msg", "文章添加成功");
        } catch (Exception e) {
            root.put("msg", "文章添加失败");
            logger.error("文章添加失败");
        }
        return ajax?"json":"success";
    }

    public String doEdit() {
        root.put("success", false);
        try {
            Article a = articleService.loadById(article.getId());
            if (a != null) {
                a.setContent(article.getContent());
                a.setTitle(article.getTitle());
                articleService.update(a);
                root.put("success", true);
                root.put("msg", "文章更新成功");
                root.put("article",a.toJSONObject() );
            }
        } catch (Exception e) {
            root.put("msg", "文章更新失败");
            logger.error("文章更新失败");
        }
        return ajax?"json":"success";
    }

    public String doDelete() {
        root.put("success", false);
        Article a = articleService.loadById(article.getId());
        if(a != null) {
            try {
                //删除关联的回复
                Comment comment = new Comment();
                comment.setArticle(a);
                DataPage dataPage = new DataPage();
                dataPage.setSize((int)commentService.total(comment));
                List<Comment> comments = commentService.list(comment, dataPage);
                for (Comment c : comments) {
                    commentService.deleteById(c.getId());
                }
                articleService.deleteById(article.getId());
                root.put("success", true);
                root.put("msg", "文章删除成功");
            } catch (Exception e) {
                root.put("msg", "文章删除失败");
                logger.error("文章删除失败");
            }
        }
        return ajax?"json":"success";
    }
}
