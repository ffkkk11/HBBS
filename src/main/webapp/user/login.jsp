<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2016/10/25
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <base href="${pageContext.request.contextPath}/" />
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
    <link href="/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/css/link.css" rel="stylesheet" type="text/css" />
    <link href="/css/login.css" rel="stylesheet" type="text/css" />
    <link href="/css/icon.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
    <div class="aw-login-box">
        <div class="mod-body clearfix">
            <div class="content pull-left">
                <h1 class="logo"><a href="http://www.baidu.com/"></a></h1>
                <h2>猴子请来的救兵社区</h2>
                <form id="login_form" method="post"  action="/user!doLogin">
                    <ul>
                        <li>
                            <input type="text" id="aw-login-user-name" class="form-control" placeholder="用户名" name="username" />
                        </li>
                        <li>
                            <input type="password" id="aw-login-user-password" class="form-control" placeholder="密码" name="password" />
                        </li>
                        <li class="alert alert-danger collapse error_message">
                            <i class="icon icon-delete"></i> <em></em>
                        </li>
                        <li class="last">
                            <button class="pull-right btn btn-large btn-primary">登录</button>
                            <%--<label>--%>
                                <%--<input type="checkbox" value="1" name="net_auto_login" />--%>
                                <%--记住我							</label>--%>
                            <%--<a href="http://wenda.wecenter.com/account/find_password/">&nbsp;&nbsp;忘记密码</a>--%>
                        </li>

                    </ul>
                </form>
            </div>
        </div>
        <div class="mod-footer">
            <span>还没有账号?</span>&nbsp;&nbsp;
            <a href="/register">立即注册</a>&nbsp;&nbsp;•&nbsp;&nbsp;
            <a href="/">游客访问</a>
        </div>
    </div>
</div>


<jsp:include page="/layout/footer.jsp"/>

</body>
</html>
