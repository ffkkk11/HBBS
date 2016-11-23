package com.hbbs.model;

import net.sf.json.JSONObject;

import javax.persistence.*;
import java.io.Serializable;
import java.util.UUID;

/**
 * Created by Me on 2016/10/26.
 */
@Entity
@Table(name = "tbl_tag")
public class Tag implements Serializable {
    @Id
    @Column(length = 36)
    private String id;

    private String name;

    private String description;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public JSONObject toJSONObject() {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", id);
        jsonObject.put("name", name);
        jsonObject.put("description", description);
        return jsonObject;
    }

}
