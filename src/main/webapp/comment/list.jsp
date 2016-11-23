<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2016/11/6
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="aw-mod aw-question-comment">
    <div class="mod-head">
        <ul class="nav nav-tabs aw-nav-tabs active">
            <h2 class="hidden-xs"><s:property value="dp.count"/> 个回复</h2>
        </ul>
    </div>
    <div class="mod-body aw-feed-list">
        <s:iterator value="comments" var="comment">
            <div class="aw-item" uninterested_count="1" force_fold="0" id="<s:property value="#comment.id"/> ">
                <div class="mod-head">
                    <!-- 用户头像 -->
                    <a class="aw-user-img aw-border-radius-5" href="<s:property value="#comment.user.avatar"/>" data-id="19754"><img src="<s:property value="#comment.user.avatar"/>" alt=""></a>
                    <!-- end 用户头像 -->
                    <div class="title">
                        <p>
                            <a class="aw-user-name" href="/user!show?username=<s:property value="#comment.user.username"/>"><s:property value="#comment.user.username"/></a>
                            - <span class="text-color-999"><s:property value="#comment.user.description"/></span>
                        </p>
                    </div>
                </div>
                <div class="mod-body clearfix">
                    <!-- 评论内容 -->
                    <div class="markitup-box"><s:property value="#comment.content" escape="false"/></div>
                    <!-- end 评论内容 -->
                </div>
                <div class="mod-footer">
                    <!-- 社交操作 -->
                    <div class="meta clearfix">
                        <span class="text-color-999 pull-right"><s:date name="#comment.createDateTime"/></span>


                    </div>
                    <!-- end 社交操作 -->
                </div>
            </div>
        </s:iterator>


    </div>
    <div class="mod-footer">
        <div class="aw-load-more-content collapse" id="load_uninterested_answers">
            <span class="text-color-999 aw-alert-box text-color-999" href="javascript:;" tabindex="-1" onclick="AWS.alert('被折叠的回复是被你或者被大多数用户认为没有帮助的回复');">为什么被折叠?</span>
            <a href="javascript:;" class="aw-load-more-content"><span class="hide_answers_count">0</span> 个回复被折叠</a>
        </div>

        <div class="collapse aw-feed-list" id="uninterested_answers_list"></div>
    </div>

</div>