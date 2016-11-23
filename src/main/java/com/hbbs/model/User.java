package com.hbbs.model;

import net.sf.json.JSONObject;

import javax.persistence.*;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Me on 2016/10/26.
 */
@Entity
@Table(name = "tbl_user")
public class User implements Serializable {
    @Id
    @Column(length = 36)
    private String id;

    @Column(columnDefinition = "varchar(20)")
    private String username;

    @Column(columnDefinition = "varchar(32)")
    private String password;

    @Column(columnDefinition = "text")
    private String email;

    @Column(columnDefinition = "text")
    private String avatar;

    @ManyToOne
    private Role role;

    private String description;//描述

    private Date createDateTime;//用户创建时间


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateDateTime() {
        return createDateTime;
    }

    public void setCreateDateTime(Date createDateTime) {
        this.createDateTime = createDateTime;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public JSONObject toJSONObject() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", id);
        jsonObject.put("username", username);
        jsonObject.put("email", email);
        jsonObject.put("avatar", avatar);
        jsonObject.put("description", description);
        jsonObject.put("createDateTime", sdf.format(createDateTime) );
        jsonObject.put("role", role.toJSONObject());
        return jsonObject;
    }
}
