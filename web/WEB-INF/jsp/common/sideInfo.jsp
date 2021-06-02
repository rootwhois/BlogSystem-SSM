<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/11/21
  Time: 12:01 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<div class="widget widget-info">
    <a href="#">
        <img src="${pageContext.request.contextPath}/${userAvatar}" class="avatar">
        <h1 class="blogName">${userNickName}</h1>
        <%--        <span>这是签名</span>--%>
    </a>
</div>
<aside class="col-md-4">
    <%--    <div class="widget widget-recent-posts">--%>
    <%--        <h3 class="widget-title">最新文章</h3>--%>
    <%--        <ul>--%>
    <%--            <li>--%>
    <%--                <a href="#">Django 博客开发入门教程：前言</a>--%>
    <%--            </li>--%>
    <%--            <li>--%>
    <%--                <a href="#">Django 博客使用 Markdown 自动生成文章目录</a>--%>
    <%--            </li>--%>
    <%--            <li>--%>
    <%--                <a href="#">部署 Django 博客</a>--%>
    <%--            </li>--%>
    <%--        </ul>--%>
    <%--    </div>--%>
    <div class="widget widget-category">
        <form action="${pageContext.request.contextPath}/search/articles?type=articles" method="post"
              class="comment-form">
            <my:token></my:token>
            <div class="row">
                <div class="col-md-8">
                    <input type="text" id="id_name" name="keywords" placeholder="搜点啥..." required="required">
                </div>
                <div class="col-md-4">
                    <button id="submit" type="submit" class="comment-btn">搜索</button>
                </div>
            </div>
        </form>
    </div>
    <div class="widget widget-category">
        <h3 class="widget-title">分类</h3>
        <c:forEach items="${sorts}" var="sort">
            <label>
                <a href="${pageContext.request.contextPath}/search/articles?type=sorts&keywords=${sort.sortId}">${sort.sortName}</a><br/>
            </label>
        </c:forEach>
    </div>
    <div class="widget widget-archives">
        <h3 class="widget-title">标签</h3>
        <c:forEach items="${tags}" var="tag">
            <label>
                <a href="${pageContext.request.contextPath}/search/articles?type=tags&keywords=${tag.tagId}">${tag.tagName}</a>
            </label>
        </c:forEach>
    </div>
</aside>
