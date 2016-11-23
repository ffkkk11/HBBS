package com.hbbs.service.impl;

import com.hbbs.dao.IBaseDao;
import com.hbbs.model.Article;
import com.hbbs.model.Comment;
import com.hbbs.model.DataPage;
import com.hbbs.model.Tag;
import com.hbbs.service.IArticleService;
import com.hbbs.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by Hua on 2016/10/29.
 */
@Service("articleService")
public class ArticleServiceImpl implements IArticleService {
    private IBaseDao<Article> articleDao;

    public IBaseDao<Article> getArticleDao() {
        return articleDao;
    }

    @Autowired
    public void setArticleDao(IBaseDao<Article> articleDao) {
        this.articleDao = articleDao;
    }

    public void add(Article article) {
        article.setId(UUID.randomUUID().toString());
        article.setCreateDateTime(new Date());
        articleDao.save(article);
    }

    public void deleteById(String id) {
        Article article = articleDao.get(Article.class, id.trim());
        if(article != null) {
            articleDao.delete(article);
        }
    }

    public void update(Article article) {
        articleDao.saveOrUpdate(article);
    }

    public Article loadById(String id) {
        return articleDao.get(Article.class, id.trim());
    }


    public List<Article> list(Article article, DataPage dp) {
        String hql = "from Article a where 1=1";
        List<Object> values = new ArrayList<Object>();
        hql = addWhere(article, hql, values);
        if(dp.getSort() != null && dp.getOrder() != null) {
            hql += String.format(" order by %s %s",dp.getSort(),dp.getOrder());
        }
        return articleDao.find(hql,values,dp.getIndex(),dp.getSize());
    }

    public long total(Article article) {
        String hql = "select count(*) from Article a where 1=1";
        List<Object> values = new ArrayList<Object>();
        hql = addWhere(article, hql, values);
        return articleDao.count(hql, values);
    }

    private String addWhere(Article article,String hql,List<Object> values) {
        if(article.getTitle() != null && !article.getTitle().trim().equals("")) {
            hql += " and a.title like ?";
            values.add("%% " + article.getTitle().trim() + "%%");
        }
        if (article.getContent() != null && !article.getContent().trim().equals("")) {
            hql += " and a.content like ?";
            values.add("%%" + article.getContent() + "%%");
        }
        if (article.getTag() != null  && article.getTag().getId() != null && !article.getTag().getId().trim().equals("")){
            hql += " and a.tag.id = ?";
            values.add(article.getTag().getId());
        }
        return hql;
    }
}
