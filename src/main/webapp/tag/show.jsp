<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2016/11/7
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!-- saved from url=(0035)http://wenda.wecenter.com/topic/bug -->
<html class="">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <meta name="renderer" content="webkit">
    <title><s:property value="tag.name"/></title>
    <base href="${pageContext.request.contextPath}/"/>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css"/>
    <link href="/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="/css/link.css" rel="stylesheet" type="text/css"/>
    <link href="/css/icon.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<jsp:include page="/layout/head.jsp"/>
<div class="aw-container-wrap">
    <div class="container">
        <div class="row">
            <div class="aw-content-wrap clearfix">
                <div class="col-sm-12 col-md-12 aw-main-content">
                    <div class="aw-mod aw-topic-detail-title">
                        <div class="mod-body">
                            <h1 class="pull-left"><s:property value="tag.name"/></h1>
                            <div class="aw-topic-operate text-color-999">
                            </div>
                        </div>
                    </div>

                    <div class="aw-mod aw-topic-list-mod">

                        <div class="mod-head">

                            <div class="tabbable">
                                <div class="nav-tabs"></div>
                            </div>

                        </div>

                        <div class="mod-body">
                            <!-- tab 切换内容 -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="all">
                                    <!-- 推荐问题 -->
                                    <!-- end 推荐问题 -->
                                    <div class="aw-mod">
                                        <div class="mod-body">
                                            <s:iterator value="articles" var="article">
                                                <div class="aw-common-list" id="c_all_list">
                                                    <div class="aw-item " data-topic-id="5,">
                                                        <a class="aw-user-name hidden-xs" data-id="30731"
                                                           href="/user!show?username=<s:property value="#article.user.username"/>"
                                                           rel="nofollow"><img
                                                                src="<s:property value="#article.user.avatar"/>" alt=""></a>
                                                        <div class="aw-question-content">
                                                            <h4>
                                                                <a href="/article!show?id=<s:property value="#article.id"/>"><s:property value="#article.title"/></a>
                                                            </h4>

                                                            <p>
                                                                <a href="/user!show?username=<s:property value="#article.user.username"/>"
                                                                   class="aw-user-name" data-id="8618"><s:property value="#article.user.username"/></a> <span
                                                                    class="text-color-999">发表该文章 • <s:property
                                                                    value="#article.browse"/> 次浏览 • <s:date
                                                                    name="#article.createDateTime"/></span>
                                                            </p>

                                                        </div>
                                                    </div>
                                                </div>
                                            </s:iterator>
                                        </div>


                                    </div>
                                </div>

                            </div>
                            <!-- end tab 切换内容 -->


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>