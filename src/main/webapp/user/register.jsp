<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2016/10/25
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>注册</title>
    <base href="${pageContext.request.contextPath}/" />
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
    <link href="/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/css/link.css" rel="stylesheet" type="text/css" />
    <link href="/css/register.css" rel="stylesheet" type="text/css" />
    <link href="/css/icon.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/css/jquery-3.1.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#username').blur(function () {
                $.ajax({
                    url:'/user!checkUsername?ajax=true',
                    type:'POST',
                    data:$('#username').serialize(),
                    success:function (data) {
                        if(data.success){
                            alert(data.msg);
                        }
                    }
                });
            });
            $('#email').blur(function () {
                $.ajax({
                    url:'/user!checkEmail?ajax=true',
                    type:'POST',
                    data:$('#email').serialize(),
                    success:function (data) {
                        if(data.success){
                            alert(data.msg);
                        }
                    }
                });
            });
            $('#btn').click(function () {
                $.ajax({
                    url:'/user!doRegister?ajax=true',
                    type:'POST',
                    data:$('#register_form').serialize(),
                    success:function (data) {
                        if(data.success){
                            alert(data.msg);
                            location.href = "/user!login";
                        }else{
                            alert(data.msg);
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="aw-register-box">
    <div class="mod-head">
        <a href="http://wenda.wecenter.com/"><img src="css/img/login_logo.png" alt="" /></a>
        <h1>注册新用户</h1>
    </div>
    <div class="mod-body">
        <form class="aw-register-form" action="/user!doRegister" method="post" id="register_form">

            <ul>
                <li class="alert alert-danger collapse error_message text-left">
                    <i class="icon icon-delete"></i> <em></em>
                </li>
                <li>
                    <input class="aw-register-name form-control" id="username" type="text" name="username" placeholder="用户名" tips="请输入一个 2-14 位的用户名" errortips="用户名长度不符合" value="" />
                </li>
                <li>
                    <input class="aw-register-email form-control" id="email" type="text" placeholder="邮箱" name="email" tips="请输入你常用的电子邮箱作为你的账号" value="" errortips="邮箱格式不正确" />
                </li>
                <li>
                    <input class="aw-register-pwd form-control" id="password" type="password" name="password" placeholder="密码" tips="请输入 6-16 个字符,区分大小写" errortips="密码不符合规则" />
                </li>

                <li class="aw-register-verify">
                <img id="verifyCodeImg" onclick="location='/user!register'" class="pull-right" src="/verifyCode"/>

                <input type="text" class="form-control" name="verifyCode" placeholder="验证码" />
                </li>
                <li class="last">
                    <div class="aw-register-agreement collapse">
                        <div class="aw-register-agreement-txt" id="register_agreement"></div>
                    </div>

                </li>
                <li class="clearfix">
                    <a class="btn btn-large btn-blue btn-block" id="btn">注册</a>
                </li>
            </ul>
        </form>
    </div>
    <div class="mod-footer"></div>
</div>


<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
