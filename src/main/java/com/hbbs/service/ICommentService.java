package com.hbbs.service;

import com.hbbs.model.Article;
import com.hbbs.model.Comment;
import com.hbbs.model.DataPage;

import java.util.List;

/**
 * Created by Hua on 2016/10/29.
 */
public interface ICommentService {
    void add(Comment comment);

    void deleteById(String id);

    void update(Comment comment);

    List<Comment> list(Comment comment, DataPage dp);

    Comment loadById(String id);

    long total(Comment comment);
}
