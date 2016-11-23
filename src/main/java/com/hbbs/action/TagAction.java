package com.hbbs.action;

import com.hbbs.model.Article;
import com.hbbs.model.DataPage;
import com.hbbs.model.Tag;
import com.hbbs.service.IArticleService;
import com.hbbs.service.ITagService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
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
                @Result(name = "add",location = "/tag/add.jsp"),
                @Result(name = "list",location = "/tag/list.jsp"),
                @Result(name = "show",location = "/tag/show.jsp"),
                @Result(name = "edit",location = "/tag/edit.jsp"),
                @Result(name = "json",type = "json",params = {"root","root"}),
                @Result(location = "index.jsp")
        }
)
public class TagAction extends ActionSupport implements ModelDriven<Tag> {
    private static final Logger logger = Logger.getLogger(Tag.class);
    private ITagService tagService;
    private IArticleService articleService;
    private List<Article> articles = new ArrayList<Article>();
    private List<Tag> tags = new ArrayList<Tag>();
    private Tag tag = new Tag();
    private JSONObject root = new JSONObject();
    private boolean ajax = false;
    private DataPage dp = new DataPage();


    public Tag getTag() {
        return tag;
    }

    public void setTag(Tag tag) {
        this.tag = tag;
    }

    public Tag getModel() {
        return tag;
    }

    public ITagService getTagService() {
        return tagService;
    }

    @Autowired
    public void setTagService(ITagService tagService) {
        this.tagService = tagService;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
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

    public IArticleService getArticleService() {
        return articleService;
    }

    @Autowired
    public void setArticleService(IArticleService articleService) {
        this.articleService = articleService;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    public String list() {
        root.put("success", false);
        try {
            dp.setCount(tagService.total(tag));
            tags = tagService.list(tag, dp);
            root.put("success", true);
            root.put("msg", "标签列表查询成功");
            root.put("dp", dp);
            JSONArray ts = new JSONArray();
            for (Tag t : tags) {
                ts.add(t.toJSONObject());
            }
            root.put("tags", ts);
        } catch (Exception e) {
            root.put("msg", "标签列表查询错误");
            logger.error("标签列表查询错误");
        }
        return ajax ? "json" : "list";
    }

    public String add() {
        return "add";
    }

    public String show() {
        root.put("success", false);
        tag = tagService.loadById(tag.getId());
        if(tag == null) {
            root.put("msg", "没有找到对应的标签");
            return "json";
        }
        try {
            Article article = new Article();
            article.setTag(tag);
            dp.setCount(articleService.total(article));
            articles = articleService.list(article, dp);
            root.put("success", true);
            root.put("msg", "标签文章列表查询成功");
            root.put("dp", dp);
            JSONArray as = new JSONArray();
            for (Article a : articles) {
                as.add(a.toJSONObject());
            }
            root.put("articles", as);
        } catch (Exception e) {
            root.put("msg", "标签文章列表查询错误");
            logger.error("标签文章列表查询错误");
        }
        return ajax ? "json" : "show";
    }

    public String edit() {
        return "edit";
    }

    public String doAdd() {
        root.put("success", false);
        Tag t = tagService.loadByName(tag.getName());
        if(t != null) {
            root.put("msg", "标签已存在");
            return "json";
        }
        try {
            tagService.add(tag);
            root.put("success", true);
            root.put("msg", "标签添加成功");
        } catch (Exception e) {
            root.put("msg", "标签添加失败");
            logger.error("标签添加失败");
        }

        return ajax ? "json" : "success";
    }

    public String doDelete() {
        root.put("success", false);
        Tag t = tagService.loadById(tag.getId());
        if (t != null) {
            try {
                tagService.deleteById(tag.getId());
                root.put("success", true);
                root.put("msg", "标签删除成功");
            } catch (Exception e) {
                root.put("msg", "标签删除失败");
                logger.error("标签删除失败");
            }
        }

        return ajax ? "json" : "success";
    }

    public String doEdit() {
        root.put("success", false);
        try {
            Tag t = tagService.loadById(tag.getId());
            if (t != null && tagService.loadByName(tag.getName())==null) {
                tagService.update(tag);
                root.put("success", true);
                root.put("msg", "文章更新成功");
                root.put("tag",tag.toJSONObject() );
            }
        } catch (Exception e) {
            root.put("msg", "文章更新失败");
            logger.error("文章更新失败");
        }
        return ajax?"json":"success";
    }
}
