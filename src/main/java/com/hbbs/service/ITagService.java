package com.hbbs.service;

import com.hbbs.model.DataPage;
import com.hbbs.model.Tag;

import java.util.List;

/**
 * Created by Hua on 2016/10/29.
 */
public interface ITagService {
    void add(Tag tag);

    void deleteById(String id);

    void update(Tag tag);

    Tag loadById(String id);

    Tag loadByName(String name);

    List<Tag> list(Tag tag, DataPage dp);

    long total(Tag tag);

}
