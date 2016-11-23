package com.hbbs.action;

import com.hbbs.model.*;
import com.hbbs.service.IArticleService;
import com.hbbs.service.IRoleService;
import com.hbbs.service.IUserService;
import com.hbbs.util.IpUtil;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Hua on 2016/10/27.
 */
@Namespace("/")
@ParentPackage("json-default")
@Action(
        results = {
                @Result(name = "login",location = "/user/login.jsp"),
                @Result(name = "register",location = "/user/register.jsp"),
                @Result(name = "show",location = "/user/show.jsp"),
                @Result(name = "list",location = "/user/list.jsp"),
                @Result(name = "json",type = "json",params = {"root","root"}),
                @Result(location = "index.jsp")
        }
)
public class UserAction extends ActionSupport implements ModelDriven<User>{
    private static final Logger logger = Logger.getLogger(UserAction.class);
    private IUserService userService;
    private IRoleService roleService;
    private User user = new User();
    private String verifyCode;
    private List<User> users = new ArrayList<User>();
    private JSONObject root = new JSONObject();
    private boolean ajax = false;
    private DataPage dp = new DataPage();
    private IArticleService articleService;
    private List<Article> articles = new ArrayList<Article>();

    public User getModel() {
        return user;
    }

    public IUserService getUserService() {
        return userService;
    }

    @Autowired
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    public IRoleService getRoleService() {
        return roleService;
    }

    public IArticleService getArticleService() {
        return articleService;
    }

    @Autowired
    public void setArticleService(IArticleService articleService) {
        this.articleService = articleService;
    }

    @Autowired
    public void setRoleService(IRoleService roleService) {
        this.roleService = roleService;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    public String login() {
        return "login";
    }

    public String register() {
        return "register";
    }

    public String show() {
        root.put("success", false);
        user = userService.loadByUsername(user.getUsername());
        if(user != null) {
            articles = articleService.list(new Article(),dp);
            root.put("user", user.toJSONObject());
            root.put("articles", articles);
            root.put("success", true);
        }else {
            root.put("success", false);
            root.put("msg","未找到用户");
            logger.error("未找到用户");
        }
        return ajax?"json":"show";
    }

    public String list() {
        root.put("success", false);
        try{
            dp.setCount(userService.total(user));
            users = userService.list(user,dp);
            root.put("success", true);
            root.put("msg", "用户列表查询成功");
            root.put("dp", dp);
            JSONArray us = new JSONArray();
            for (User u : users) {
                us.add(u.toJSONObject());
            }
            root.put("users", us);
        } catch (Exception e) {
            root.put("msg", "用户列表查询错误");
            logger.error("用户列表查询错误");
        }
        return ajax?"json":"list";
    }

    public String doRegister() {
        root.put("success",false);
        String v = (String) ServletActionContext.getRequest().getSession().getAttribute("verifyCode");
        if (v == null || !v.equals(verifyCode)) {
            root.put("msg","验证码错误");
            ServletActionContext.getRequest().getSession().removeAttribute("verifyCode");
            return "json";
        }
        if(userService.loadByUsername(user.getUsername()) != null) {
            root.put("msg","用户名已存在");
            return "json";
        }
        if (userService.loadByEmail(user.getEmail()) != null) {
            root.put("msg", "邮箱已存在");
            return "json";
        }
        try {
            if(user.getRole() == null) {
                Role role = roleService.loadByName("用户");
                if(role == null) {
                    role = new Role();
                    role.setName("用户");
                    roleService.add(role);
                }

                user.setRole(role);
            }

            userService.add(user);
            root.put("success", true);
            root.put("msg", "用户注册成功");
        } catch (Exception e) {
            root.put("msg", "用户注册失败");
            logger.error("用户注册失败");
        }
        return ajax?"json":"success";
    }

    public String doLogin() {
        root.put("success", false);
        if(user.getUsername() == null || user.getUsername().trim().equals("")) {
            root.put("msg", "请输入账号");
            return "json";
        }
        if (user.getPassword() == null || user.getPassword().trim().equals("")) {
            root.put("msg", "请输入密码");
            return "json";
        }
        User u = userService.login(user);
        if(u != null) {
            SessionInfo sessionInfo = new SessionInfo();
            sessionInfo.setUserId(u.getId());
            sessionInfo.setLoginUsername(u.getUsername());
            sessionInfo.setLoginPassword(u.getPassword());
            sessionInfo.setIp(IpUtil.getIpAddr(ServletActionContext.getRequest()));
            ServletActionContext.getRequest().getSession().setAttribute("sessionInfo",sessionInfo);
            if(u.getRole() != null) {
                sessionInfo.setRoleName(u.getRole().getName());
            }
            root.put("success", true);
            root.put("msg", "登陆成功");
            return "success";
        } else {
            root.put("msg", "账号密码错误");
        }
        return "json";
    }

    public String doDelete() {
        root.put("success", false);
        User u = userService.loadByUsername(user.getUsername());
        if (u != null) {
            try {
                userService.deleteById(u.getId());
                root.put("success", true);
                root.put("msg", "用户删除成功");
            }catch (Exception e) {
                root.put("msg","用户删除失败");
            }
        }else {
            root.put("msg","用户删除失败");
            logger.error("用户删除失败");
        }
        return "json";
    }

    public String doCheckUsername() {
        root.put("success",false);
        if(userService.loadByUsername(user.getUsername()) != null) {
            root.put("success", true);
            root.put("msg","用户名已存在");
        }
        return "json";
    }

    public String doCheckEmail() {
        root.put("success",false);
        if(userService.loadByEmail(user.getEmail()) != null) {
            root.put("success", true);
            root.put("msg","邮箱已存在");
        }
        return "json";
    }

    public String doLogout() {
        ServletActionContext.getRequest().getSession().invalidate();
        return "success";
    }

    public String doEdit() {
        root.put("success", false);
        try {
            User u = userService.loadByUsername(user.getUsername());
            if(u != null) {
                u.setUsername(user.getUsername());
                u.setAvatar(user.getAvatar());
                u.setEmail(user.getEmail());
                u.setDescription(user.getDescription());
                userService.update(u);
                root.put("success", true);
                root.put("msg", "用户信息更新成功");
                root.put("user", u.toJSONObject());
            }
        }catch (Exception e) {
            root.put("msg", "用户信息更新失败");
            logger.error("用户信息更新失败");
        }
        return "json";
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
