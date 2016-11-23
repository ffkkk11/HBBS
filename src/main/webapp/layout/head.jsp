<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2016/10/25
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="aw-top-menu-wrap">
    <div class="container">
        <!-- logo -->
        <div class="aw-logo hidden-xs">
            <a href="/"></a>
        </div>
        <div class="aw-top-nav navbar">
            <nav role="navigation" class="collapse navbar-collapse bs-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/article!list">发现</a></li>
                    <li><a href="/tag!list?dp.size=1000" >标签</a></li>
                    <li><a href="/article!list?dp.sort=browse" >最多浏览</a></li>
                    <li><a href="/article!list?dp.sort=createDateTime" >最新帖子</a></li>
                </ul>
            </nav>
        </div>
        <!-- end 导航 -->
        <!-- 用户栏 -->
        <div class="aw-user-nav">
            <s:if test="%{#session.sessionInfo == null }">
                <!-- 登陆&注册栏 -->
                <a class="login btn btn-normal btn-primary" href="/user!login">登录</a>
                <a class="register btn btn-normal btn-success" href="/user!register">注册</a>
                <!-- end 登陆&注册栏 -->
            </s:if>
            <s:else>
                <!-- 用户栏 -->
                <nav role="navigation" class="collapse navbar-collapse bs-navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="/user!show?username=<s:property value="#session.sessionInfo.loginUsername"/>"><s:property value="#session.sessionInfo.loginUsername"/></a></li>
                        <li><a href="/article!add">发表</a></li>
                        <li><a href="/user!doLogout">注销</a></li>
                    </ul>
                </nav>
                <!-- end 用户栏 -->
            </s:else>

        </div>
    </div>
</div>

