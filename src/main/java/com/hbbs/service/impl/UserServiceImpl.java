package com.hbbs.service.impl;

import com.hbbs.dao.IBaseDao;
import com.hbbs.model.DataPage;
import com.hbbs.model.User;
import com.hbbs.service.IUserService;
import com.hbbs.util.Encrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by Hua on 2016/10/27.
 */
@Service("userService")
public class UserServiceImpl implements IUserService {
    private IBaseDao<User> userDao;

    public IBaseDao<User> getUserDao() {
        return userDao;
    }

    @Autowired
    public void setUserDao(IBaseDao<User> userDao) {
        this.userDao = userDao;
    }

    public User login(User user) {
        return userDao.get("from User u where u.username = ? and u.password = ?",new Object[] {user.getUsername(), Encrypt.e(user.getPassword())});
    }

    public User loadByUsername(String username) {
        return userDao.get("from User u where u.username = ?",new String[]{username});
    }

    public User loadById(String id) {
        return userDao.get("from User u where u.id = ?",new String[]{id});
    }

    public User loadByEmail(String email) {
        return userDao.get("from User u where u.email = ?",new String[]{email});
    }

    public void add(User user) {
        user.setId(UUID.randomUUID().toString());
        user.setPassword(Encrypt.e(user.getPassword()));
        user.setCreateDateTime(new Date());
        userDao.save(user);
    }

    public void update(User user) {
        userDao.saveOrUpdate(user);
    }

    public void batchDelete(String ids) {
        if( ids != null) {
            for (String id : ids.split(",")) {
                deleteById(id);
            }
        }
    }

    public void deleteById(String id) {
        User u = userDao.get(User.class,id.trim());
        if (u != null) {
            userDao.delete(u);
        }
    }

    public List<User> list(User user, DataPage dp) {
        String hql = "from User u where 1=1";
        List<Object> values = new ArrayList<Object>();
        hql = addWhere(user, hql, values);
        if(dp.getSort() != null && dp.getOrder() != null) {
            hql += String.format(" order by %s %s",dp.getSort(),dp.getOrder());
        }
        return userDao.find(hql,values,dp.getIndex(),dp.getSize());
    }

    public Long total(User user) {
        String hql = "select count(*) from User u where 1=1 ";
        List<Object> values = new ArrayList<Object>();
        hql = addWhere(user, hql, values);
        return userDao.count(hql,values);
    }

    private String addWhere(User user,String hql,List<Object> values) {
        if(user.getUsername() != null && !user.getUsername().trim().equals("")) {
            hql +=" and u.username like ?";
            values.add("%%" + user.getUsername().trim() + "%%");
        }
        return hql;
    }

}
