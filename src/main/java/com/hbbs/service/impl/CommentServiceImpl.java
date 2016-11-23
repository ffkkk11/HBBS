package com.hbbs.service.impl;

import com.hbbs.dao.IBaseDao;
import com.hbbs.model.Article;
import com.hbbs.model.Comment;
import com.hbbs.model.DataPage;
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
@Service("commentService")
public class CommentServiceImpl implements ICommentService {
    private IBaseDao<Comment> commentDao;

    public IBaseDao<Comment> getCommentDao() {
        return commentDao;
    }

    @Autowired
    public void setCommentDao(IBaseDao<Comment> commentDao) {
        this.commentDao = commentDao;
    }

    public void add(Comment comment) {
        comment.setId(UUID.randomUUID().toString());
        comment.setCreateDateTime(new Date());
        commentDao.save(comment);
    }

    public void deleteById(String id) {
        Comment comment = commentDao.get(Comment.class, id.trim());
        if (comment != null) {
            commentDao.delete(comment);
        }
    }

    public void update(Comment comment) {
        commentDao.saveOrUpdate(comment);
    }

    public List<Comment> list(Comment comment, DataPage dp) {
        String hql = "from Comment c where 1=1 ";
        List<Object> values = new ArrayList<Object>();
        hql = addWhere(comment, hql, values);
        if(dp.getSort() != null && dp.getOrder() != null) {
            hql += String.format(" order by %s %s",dp.getSort(),dp.getOrder());
        }
        return commentDao.find(hql,values,dp.getIndex(),dp.getSize());
    }

    public Comment loadById(String id) {
        return commentDao.get("from Comment c where c.id = ?",new String[] {id});
    }

    public long total(Comment comment) {
        String hql = "select count(*) from Comment c where 1=1";
        List<Object> values = new ArrayList<Object>();
        hql = addWhere(comment, hql, values);
        return commentDao.count(hql,values);
    }

    private String addWhere(Comment comment,String hql,List<Object> values) {
        if (comment.getArticle() != null && comment.getArticle().getId() != null && !comment.getArticle().getId().trim().equals("")) {
            hql += " and c.article.id = ?";
            values.add(comment.getArticle().getId());
        }
        return hql;
    }
}
