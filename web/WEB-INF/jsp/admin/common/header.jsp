<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/11/27
  Time: 8:30 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
            aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand text-success" href="${pageContext.request.contextPath}/admin/index">博客管理</a>

    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
                <!-- Example single danger button -->
                <div class="btn-group">
                    <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                        新建
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0);"
                           onclick="fullScreen('添加文章','${pageContext.request.contextPath}/admin/article/add')">文章</a>
                        <a class="dropdown-item" href="javascript:void(0);"
                           onclick="fullScreen('添加分类','${pageContext.request.contextPath}/admin/sort/add')">分类</a>
                        <a class="dropdown-item" href="javascript:void(0);"
                           onclick="fullScreen('添加标签','${pageContext.request.contextPath}/admin/tag/add')">标签</a>
                        <!-- <a class="dropdown-item" href="#">评论</a> -->
                    </div>
                </div>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/index">主页 </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/article/list">文章管理</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/sort/list">分类管理</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/tag/list">标签管理</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/web/edit">网站管理</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/my/edit">我的信息</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/account/edit">安全管理</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/admin/article/search"
              method="GET">
            <input class="form-control mr-sm-2" type="search" placeholder="文章标题或内容..." aria-label="Search"
                   name="keywords">
            <button class="btn btn-outline-success my-2 my-sm-0 btn-sm" type="submit">搜索</button>
        </form>

        <a class="btn btn-outline-danger btn-sm" href="${pageContext.request.contextPath}/admin/logout"
           role="button">退出</a>
    </div>
</nav>