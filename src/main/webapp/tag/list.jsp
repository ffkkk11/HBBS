<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2016/11/7
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class=""><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>标签</title>
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
                    <!-- tab切换 -->
                    <div class="nav nav-tabs aw-nav-tabs active hidden-xs">

                        <h2 class="hidden-xs">标签</h2>
                    </div>
                    <!-- end tab切换 -->

                    <!-- 话题分类 -->
                    <div class="aw-mod aw-topic-category">
                        <div class="mod-body clearfix">
                            <ul>
                                <s:iterator value="tags" var="tag">
                                    <li>
                                        <a href="/tag!show?dp.size=1000&id=<s:property value="#tag.id"/>"><s:property value="#tag.name"/></a>
                                    </li>
                                </s:iterator>

                            </ul>
                        </div>
                    </div>
                    <!-- end 话题分类 -->

                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/layout/footer.jsp"/>
</body></html>
