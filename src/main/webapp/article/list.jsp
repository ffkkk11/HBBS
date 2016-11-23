<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2016/10/25
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>WeCenter</title>
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


                    <div class="aw-mod aw-explore-list">
                        <div class="mod-body">
                            <div class="aw-common-list">

                                <s:iterator value="articles" var="article">
                                    <div class="aw-item ">
                                        <a class="aw-user-name hidden-xs"
                                           href="/user!show?username=<s:property value="#article.user.username"/>"
                                           rel="nofollow"><img src="<s:property value="#article.user.avatar"/>" alt=""/></a>
                                        <div class="aw-question-content">
                                            <h4>
                                                <a href="/article!show?id=<s:property value="#article.id"/>"><s:property
                                                        value="#article.title"/></a>
                                            </h4>
                                            <p>
                                                <a href="/user!show?username=<s:property value="#article.user.username"/>"
                                                   class="aw-user-name"><s:property value="#article.user.username"/></a>
                                                <span class="text-color-999">发表该文章 • <s:property
                                                        value="#article.browse"/> 次浏览 • <s:date
                                                        name="#article.createDateTime"/></span>
                                            </p>

                                        </div>
                                    </div>
                                </s:iterator>
                            </div>
                        </div>

                        <div class="mod-footer">
                            <div class="page-control">
                                <ul class="pagination pull-right">
                                    <s:if test="%{dp.index > 1}">
                                        <li><a href="/article!list?dp.index=1">&lt;&lt;1</a></li>
                                        <li><a href="/article!list?dp.index=<s:property value="%{dp.index-1}"/>">
                                            &lt;</a></li>
                                    </s:if>
                                    <li class="active"><a href="javascript:;"><s:property value="dp.index"/></a></li>
                                    <s:if test="%{dp.index < dp.max}">
                                        <li><a href="/article!list?dp.index=<s:property value="%{dp.index+1}"/>">
                                            &gt;</a></li>
                                        <li><a href="/article!list?dp.index=<s:property value="dp.max"/>"><s:property
                                                value="dp.max"/>&gt;&gt;</a></li>
                                    </s:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 侧边栏 -->
                <!-- end 侧边栏 -->
            </div>
        </div>
    </div>
</div>
<jsp:include page="/layout/footer.jsp"/>

</body>
</html>

