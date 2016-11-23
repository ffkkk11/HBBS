package com.hbbs.action;

import com.hbbs.model.Article;
import com.hbbs.model.DataPage;
import com.hbbs.model.Role;
import com.hbbs.service.IRoleService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Hua on 2016/10/30.
 */
@Namespace("/")
@ParentPackage("json-default")
@Action(
        results = {
                @Result(name = "add",location = "/role/add.jsp"),
                @Result(name = "list",location = "/role/list.jsp"),
                @Result(name = "show",location = "/role/show.jsp"),
                @Result(name = "edit",location = "/role/edit.jsp"),
                @Result(name = "json",type = "json",params = {"root","root"}),
                @Result(location = "index.jsp")
        }
)
public class RoleAction extends ActionSupport implements ModelDriven<Role> {
    private static final Logger logger = Logger.getLogger(Article.class);
    private Role role = new Role();
    private List<Role> roles = new ArrayList<Role>();
    private IRoleService roleService;
    private JSONObject root = new JSONObject();
    private boolean ajax = false;
    private DataPage dp = new DataPage();


    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Role getModel() {
        return role;
    }

    public IRoleService getRoleService() {
        return roleService;
    }

    @Autowired
    public void setRoleService(IRoleService roleService) {
        this.roleService = roleService;
    }

    public JSONObject getRoot() {
        return root;
    }

    public void setRoot(JSONObject root) {
        this.root = root;
    }

    public boolean isAjax() {
        return ajax;
    }

    public void setAjax(boolean ajax) {
        this.ajax = ajax;
    }

    public DataPage getDp() {
        return dp;
    }

    public void setDp(DataPage dp) {
        this.dp = dp;
    }

    public String add() {
        return "add";
    }

    public String list() {
        root.put("success", false);
        try {
            dp.setCount(roleService.total(role));
            roles = roleService.list(role, dp);
            root.put("success", true);
            root.put("msg", "角色列表查询成功");
            root.put("dp", dp);
            JSONArray rs = new JSONArray();
            for (Role r : roles) {
                rs.add(r.toJSONObject());
            }
            root.put("roles", rs);
        } catch (Exception e) {
            root.put("msg", "角色列表查询错误");
            logger.error("角色列表查询错误");
        }
        return ajax ? "json" : "list";
    }

    public String edit() {
        return "edit";
    }

    public String doAdd() {
        root.put("success", false);
        Role r = roleService.loadByName(role.getName());
        if (r != null) {
            root.put("msg", "角色已存在");
            return "json";
        }
        try {
            roleService.add(role);
            root.put("success", true);
            root.put("msg", "角色添加成功");
        } catch (Exception e) {
            root.put("msg", "角色添加失败");
            logger.error("角色添加失败");
        }
        return ajax ? "json" : "success";
    }

    public String doDelete() {
        root.put("success", false);
        Role r = roleService.loadById(role.getId());
        if (r != null) {
            try {
                roleService.deleteById(role.getId());
                root.put("success", true);
                root.put("msg", "角色删除成功");
            } catch (Exception e) {
                root.put("msg", "角色删除失败");
                logger.error("角色删除失败");
            }
        }
        return ajax ? "json" : "success";
    }

    public String doEdit() {
        root.put("success", false);
        try {
            Role r = roleService.loadById(role.getId());
            if (r != null && roleService.loadByName(role.getName())==null) {
                roleService.update(role);
                root.put("success", true);
                root.put("msg", "角色更新成功");
                root.put("role",role.toJSONObject() );
            }
        } catch (Exception e) {
            root.put("msg", "角色更新失败");
            logger.error("角色更新失败");
        }
        return ajax?"json":"success";
    }
}
