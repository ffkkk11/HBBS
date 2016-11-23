package com.hbbs.service;

import com.hbbs.model.DataPage;
import com.hbbs.model.Role;

import java.util.List;

/**
 * Created by Hua on 2016/10/29.
 */
public interface IRoleService {
    void add(Role role);

    void deleteById(String id);

    void update(Role role);

    Role loadByName(String name);

    Role loadById(String id);

    List<Role> list(Role role, DataPage dp);

    long total(Role role);
}
