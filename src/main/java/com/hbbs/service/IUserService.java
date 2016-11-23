package com.hbbs.service;

import com.hbbs.model.DataPage;
import com.hbbs.model.User;

import java.util.List;

/**
 * Created by Hua on 2016/10/27.
 */
public interface IUserService {
    User login(User user);

    void add(User user);

    void update(User user);

    void deleteById(String id);

    void batchDelete(String ids);

    User loadByUsername(String username);

    User loadByEmail(String email);

    User loadById(String id);

    List<User> list(User user, DataPage dp);

    Long total(User user);

}
