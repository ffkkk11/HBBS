package com.hbbs.model;

import net.sf.json.JSONObject;

import javax.persistence.*;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * Created by Me on 2016/10/26.
 */
@Entity
@Table(name = "tbl_comment")
public class Comment implements Serializable {
    @Id
    @Column(length = 36)
    private String id;

    @Column(columnDefinition = "text")
    private String content;
    private Date createDateTime;

    @ManyToOne
    private User user;

    @ManyToOne
    private Article article;

    private int agree;//赞同数

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateDateTime() {
        return createDateTime;
    }

    public void setCreateDateTime(Date createDateTime) {
        this.createDateTime = createDateTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public int getAgree() {
        return agree;
    }

    public void setAgree(int agree) {
        this.agree = agree;
    }

    public JSONObject toJSONObject() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", id);
        jsonObject.put("content",content );
        jsonObject.put("agree", agree);
        jsonObject.put("createDateTime", sdf.format(createDateTime));
        jsonObject.put("user", user.toJSONObject());
        return jsonObject;
    }
}
