package com.hbbs.service;

import com.hbbs.model.Article;
import com.hbbs.model.DataPage;
import com.hbbs.model.Tag;

import java.util.List;

/**
 * Created by Hua on 2016/10/29.
 */
public interface IArticleService {
    void add(Article article);

    void deleteById(String id);

    void update(Article article);

    Article loadById(String id);

    List<Article> list(Article article, DataPage dp);

    long total(Article article);
}
