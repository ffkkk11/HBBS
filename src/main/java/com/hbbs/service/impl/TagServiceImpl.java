package com.hbbs.service.impl;

import com.hbbs.dao.IBaseDao;
import com.hbbs.model.DataPage;
import com.hbbs.model.Tag;
import com.hbbs.service.ITagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by Hua on 2016/10/29.
 */
@Service("tagService")
public class TagServiceImpl implements ITagService {
    private IBaseDao<Tag> tagDao;

    public IBaseDao<Tag> getTagDao() {
        return tagDao;
    }

    @Autowired
    public void setTagDao(IBaseDao<Tag> tagDao) {
        this.tagDao = tagDao;
    }

    public void add(Tag tag) {
        tag.setId(UUID.randomUUID().toString());
        tagDao.save(tag);
    }

    public void deleteById(String id) {
        Tag tag = tagDao.get(Tag.class, id.trim());
        if (tag != null) {
            tagDao.delete(tag);
        }
    }

    public void update(Tag tag) {
        tagDao.saveOrUpdate(tag);
    }

    public Tag loadById(String id) {
        return tagDao.get("from Tag t where t.id = ?",new String[] {id});
    }

    public Tag loadByName(String name) {
        return tagDao.get("from Tag t where t.name = ?",new String[] {name});
    }

    public List<Tag> list(Tag tag, DataPage dp) {
        String hql = "from Tag t where 1=1 ";
        List<Object> values = new ArrayList<Object>();
        hql = addWhere(tag, hql, values);
        if(dp.getSort() != null && dp.getOrder() != null) {
            hql += String.format(" order by %s %s",dp.getSort(),dp.getOrder());
        }
        return tagDao.find(hql,values,dp.getIndex(),dp.getSize());
    }

    public long total(Tag tag) {
        String hql = "select count(*) from Tag t where 1=1 ";
        List<Object> values = new ArrayList<Object>();
        hql = addWhere(tag, hql, values);
        return tagDao.count(hql,values);
    }

    private String addWhere(Tag tag,String hql,List<Object> values) {
        if (tag.getName() != null && !tag.getName().trim().equals("")) {
            hql += " and t.name like ?";
            values.add(tag.getName());
        }
        return hql;
    }
}
