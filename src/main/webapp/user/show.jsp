<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2016/10/25
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>${user.username} 的个人主页</title>
    <base href="${pageContext.request.contextPath}/" />
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
    <link href="/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/css/link.css" rel="stylesheet" type="text/css" />
    <link href="/css/icon.css" rel="stylesheet" type="text/css" />
    <link href="/css/user.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="/layout/head.jsp" />
<div class="aw-container-wrap">
    <div class="container">
        <div class="row">
            <div class="aw-content-wrap clearfix">
                <div class="col-sm-12 col-md-12 aw-main-content">
                    <!-- 用户数据内容 -->
                    <div class="aw-mod aw-user-detail-box">
                        <div class="mod-head">
                            <img src=${user.avatar} alt="${user.username}" />
                            <h1>${user.username} </h1>
                            <p class="text-color-999">${user.description}</p>
                            </p>
                        </div>
                    </div>
                    <!-- end 用户数据内容 -->

                    <div class="aw-user-center-tab">
                        <div class="tab-content">
                            <div class="tab-pane active" id="answers">
                                <!-- 文章 -->
                                <div class="aw-mod">
                                    <div class="mod-head">
                                        <h3>文章</h3>
                                    </div>
                                    <div class="mod-body">
                                        <div class="aw-profile-answer-list">
                                            <s:iterator value="articles" var="article">
                                                <div class="aw-item">
                                                    <div class="mod-head">
                                                        <h4><a href='/article!show?id=<s:property value="#article.id"/>'><s:property value="#article.title"/></a></h4>
                                                    </div>
                                                    <div class="mod-body">
                                                        <p class="aw-hide-txt"><s:property value="#article.browse"/> 次浏览  &nbsp; •  <s:property value="#article.agree"/> 赞同 &nbsp; • &nbsp; <s:date name="#article.createDateTime" /></p>
                                                    </div>
                                                </div>
                                            </s:iterator>



                                        </div>
                                    </div>
                                </div>
                                <!-- end 文章 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/layout/footer.jsp" />
</body>
</html>
