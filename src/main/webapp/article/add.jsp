<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2016/11/7
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0034)http://wenda.wecenter.com/publish/ -->
<html class="">
<head>

    <title>文章发布</title>
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
                    url:'/article!doAdd?ajax=true',
                    type:'POST',
                    data:$('#question_form').serialize(),
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
    <div class="container aw-publish">
        <div class="row">
            <div class="aw-content-wrap clearfix">
                <div class="col-sm-12 col-md-12 aw-main-content">
                    <!-- tab 切换 -->
                    <ul class="nav nav-tabs aw-nav-tabs active">
                        <li class="active"><a>文章</a></li>
                        <h2 class="hidden-xs">发表</h2>
                    </ul>
                    <!-- end tab 切换 -->
                    <form action="/article!doAdd?ajax=true" method="post"
                          id="question_form" >
                        <input type="hidden" name="post_hash" value="dc9872584a4d64b49fc6a9bac1fc39c6">
                        <input type="hidden" name="attach_access_key" value="37e0307edc48a5f894bad72f73f661c7">
                        <input type="hidden" name="question_id" id="question_id" value="">
                        <input type="hidden" name="ask_user_id" value="">
                        <div class="aw-mod aw-mod-publish">
                            <div class="mod-body">
                                <h3>文章标题:</h3>
                                <!-- 问题标题 -->
                                <div class="aw-publish-title active">
                                    <div>
                                        <input type="text" placeholder="文章标题..." name="title"
                                               id="question_contents" value="" class="form-control">
                                    </div>
                                </div>
                                <!-- end 问题标题 -->

                                <h3>文章内容:</h3>
                                <div class="aw-mod aw-editor-box">
                                    <div class="mod-head">
                                        <div class="wmd-panel">
                                            <textarea name="content" id="textarea1"
                                                      class="wmd-input form-control autosize editor"
                                                      style="height:200px;max-height:500px;"></textarea>

                                            <!--这里引用jquery和wangEditor.js-->
                                            <script type="text/javascript">
                                                var editor = new wangEditor('textarea1');
                                                // 普通的自定义菜单
                                                editor.config.menus = ['bold', 'underline', 'italic', 'strikethrough', '|', 'quote', 'alignleft', 'aligncenter', 'alignright', '|', 'emotion', 'img', 'insertcode'];
                                                editor.create();
                                            </script>
                                        </div>
                                    </div>
                                </div>
                                <h3>添加标签:</h3>
                                <div class="aw-topic-bar active" data-type="publish">
                                    <div class="aw-edit-topic-box form-inline" style="display: block;">
                                        <input type="text" list="tags" class="form-control" id="aw_edit_topic_title" name="tagName" autocomplete="off" placeholder="创建或选择添加新话题...">
                                        <datalist id="tags">
                                            <s:iterator value="tags" var="tag">
                                                <option name="<s:property value="#tag.id"/>"><s:property value="#tag.name"/></option>
                                            </s:iterator>
                                        </datalist>
                                    </div>
                                </div>
                            </div>
                            <div class="mod-footer clearfix">
                                <a class="btn btn-large btn-success btn-publish-submit" id="btn">确认发表</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>