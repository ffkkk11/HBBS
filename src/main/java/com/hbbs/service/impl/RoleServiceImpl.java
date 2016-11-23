package com.hbbs.service.impl;

import com.hbbs.dao.IBaseDao;
import com.hbbs.model.DataPage;
import com.hbbs.model.Role;
import com.hbbs.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by Hua on 2016/10/29.
 */
@Service("roleService")
public class RoleServiceImpl implements IRoleService {
    private IBaseDao<Role> roleDao;

    public IBaseDao<Role> getRoleDao() {
        return roleDao;
    }

    @Autowired
    public void setRoleDao(IBaseDao<Role> roleDao) {
        this.roleDao = roleDao;
    }

    public void add(Role role) {
        role.setId(UUID.randomUUID().toString());
        roleDao.save(role);
    }

    public void deleteById(String id) {
        Role role = roleDao.get(Role.class, id.trim());
        if (role != null) {
            roleDao.delete(role);
        }
    }

    public void update(Role role) {
        roleDao.saveOrUpdate(role);
    }

    public Role loadByName(String name) {
        return roleDao.get("from Role r where r.name = ?",new String[] {name});
    }

    public Role loadById(String id) {
        return roleDao.get("from Role r where r.id = ?", new String[]{id});
    }

    public List<Role> list(Role role, DataPage dp) {
        String hql = "from Role r where 1=1";
        List<Object> values = new ArrayList<Object>();
        hql = addWhere(role, hql, values);
        if(dp.getSort() != null && dp.getOrder() != null) {
            hql += String.format(" order by %s %s",dp.getSort(),dp.getOrder());
        }
        return roleDao.find(hql,values,dp.getIndex(),dp.getSize());
    }

    public long total(Role role) {
        String hql = "select count(*) from Role r where 1=1";
        List<Object> values = new ArrayList<Object>();
        hql = addWhere(role, hql, values);
        return roleDao.count(hql,values);
    }

    private String addWhere(Role role,String hql,List<Object> values) {
        if (role.getName() != null && !role.getName().trim().equals("")) {
            hql += " and r.name like ?";
            values.add(role.getName());
        }
        return hql;
    }
}
