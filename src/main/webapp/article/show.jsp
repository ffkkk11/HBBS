<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2016/11/6
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title><s:property value="article.title"/></title>

    <base href="${pageContext.request.contextPath}/"/>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css"/>
    <link href="/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="/css/link.css" rel="stylesheet" type="text/css"/>
    <link href="/css/icon.css" rel="stylesheet" type="text/css"/>

    <%-- Editor start --%>
    <link rel="stylesheet" type="text/css" href="/editor/css/wangEditor.min.css">
    <script type="text/javascript" src="/editor/js/lib/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/editor/js/wangEditor.min.js"></script>
    <%-- Editor End--%>
    <script>
        $(document).ready(function () {
           $("#btn").click(function () {
               $.ajax({
                   url:'/comment!doAdd?ajax=true',
                   type:'POST',
                   data:$('#answer_form').serialize(),
                   success:function (data) {
                       if(data.success){
                           alert(data.msg);
                           location.reload();
                       }else {
                           alert(data.msg);
                       }
                   }
               });
           });
           $("#deleteArticleBtn").click(function () {
               $.ajax({
                   url:'/article!doDelete?ajax=true&id=<s:property value="article.id"/>',
                   type:'GET',
                   success:function (data) {
                       if(data.success){
                           alert(data.msg);
                           location.href="/index.jsp";
                       }else {
                           alert(data.msg);
                       }
                   }
               });
           });
        });
    </script>
</head>
<body>

<jsp:include page="/layout/head.jsp"/>

<div class="aw-container-wrap">
    <div class="container">
        <div class="row">
            <div class="aw-content-wrap clearfix">
                <div class="col-sm-12 col-md-12 aw-main-content">
                    <!-- 话题推荐bar -->
                    <!-- 话题推荐bar -->
                    <!-- 话题bar -->
                    <div class="aw-mod aw-topic-bar" id="question_topic_editor" data-type="question" data-id="30768">
                        <div class="tag-bar clearfix">
                            <span class="topic-tag">
								<a href="/tag!show?id=<s:property value="article.tag.id"/>" class="text"><s:property
                                        value="article.tag.name"/></a>
							</span>

                        </div>
                    </div>
                    <!-- end 话题bar -->
                    <div class="aw-mod aw-question-detail aw-item">
                        <div class="mod-head">
                            <h1><s:property value="article.title" escape="false"/></h1>
                            <s:if test='%{#session.sessionInfo.roleName == "admin" || #session.sessionInfo.loginUsername == article.user.username}'>
                                <div class="operate clearfix">
                                    <a class="follow btn btn-normal btn-success pull-left " id="deleteArticleBtn"><span>删除</span></a>
                                </div>
                            </s:if>
                        </div>
                        <div class="mod-body">
                            <div class="content markitup-box">
                                <s:property value="article.content" escape="false"/>
                            </div>
                        </div>
                        <div class="mod-footer">
                            <div class="meta">
                                <span class="text-color-999"><s:date name="article.createDateTime"/></span>
                            </div>
                        </div>
                    </div>


                    <s:action name="comment!list" executeResult="true" namespace="/">
                        <s:param name="articleId" value="article.id"/>
                        <s:param name="dp.size" value="1000"/>
                        <s:param name="dp.sort" value="'createDateTime'" />
                    </s:action>
                    <!-- end 问题详细模块 -->

                    <!-- 回复编辑器 -->
                    <div class="aw-mod aw-replay-box question">
                        <a name="answer_form"></a>
                        <s:if test="%{#session.sessionInfo != null}">
                            <form action="/comment!doAdd?ajax=true" method="post" id="answer_form" class="question_answer_form">
                                <input type="hidden" name="articleId" value="<s:property value="article.id"/>">
                                <div class="mod-body">
                                    <div class="aw-mod aw-editor-box">
                                        <div class="mod-head">

                                            <div class="wmd-panel">
                                                <textarea name="content" id="textarea1" class="wmd-input form-control autosize editor" style="height:200px;max-height:500px;"></textarea>

                                                <!--这里引用jquery和wangEditor.js-->
                                                <script type="text/javascript">
                                                    var editor = new wangEditor('textarea1');
                                                    // 普通的自定义菜单
                                                    editor.config.menus = ['bold','underline','italic','strikethrough','|','quote','alignleft','aligncenter','alignright','|','emotion','img','insertcode'];
                                                    editor.create();
                                                </script>


                                            </div>
                                        </div>
                                        <div class="mod-body clearfix" id="btn">
                                            <a class="btn btn-normal btn-success pull-right btn-reply" id="btn">回复</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </s:if>
                        <s:else>
                            <p align="center">要回复问题请先<a href="/user!login">登录</a>或<a href="/user!register">注册</a></p>
                        </s:else>
                    </div>
                    <!-- end 回复编辑器 -->
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/layout/footer.jsp"/>

</body>
</html>
