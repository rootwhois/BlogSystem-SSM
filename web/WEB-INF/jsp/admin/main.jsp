<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setTimeZone value="GMT+8"/>

<%@include file="common/include.jsp" %>

<body>
<%@include file="common/header.jsp" %>
<div class="card mb-3">
    <%--    <div style="height: 180px;overflow: hidden">--%>
    <%--        <img class="card-img-top" src="/img/82839-106.jpg" alt="Card image cap" style="height: 100%;width:100%;">--%>
    <%--    </div>--%>

    <div class="card-body">
        <h4 class="card-title">${admin.userName}</h4>
        <p class="card-text"><small class="text-muted">上次登录时间:<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                              value="${admin.userLastLoginTime}"/></small>
        </p>
        <p class="card-text"><small class="text-muted">上次登录IP:${admin.userLastLoginIp}</small></p>
        <p class="card-text"><small class="text-muted">本次登录IP:${pageContext.request.remoteAddr}</small></p>
    </div>
</div>
<div>
    <table class="table table-hover">
        <p class="text-success" style="text-align: center"> 系统统计</p>
        <thead>
        <tr>
            <th>#</th>
            <th>文章数</th>
            <th>分类数</th>
            <th>标签数</th>
            <th>评论数</th>
        </tr>
        </thead>
        <tbody>
        <tr class="table-success">
            <th scope="row">全部</th>
            <td>${articleCount}</td>
            <td>${sortCount}</td>
            <td>${tagCount}</td>
            <td>${commentCount}</td>
        </tr>
        </tbody>
    </table>
</div>

<div style="width: 50%;position: relative;left: 25%">
    <table class="table table-sm">
        <p class="text-success" style="text-align: center"> 系统信息</p>

        <tr>
            <th scope="row">服务器IP</th>
            <td>${pageContext.request.localAddr}</td>
        </tr>
        <tr>
            <th scope="row">服务器端口</th>
            <td>${pageContext.request.localPort}</td>
        </tr>
        <tr>
            <th scope="row">服务器</th>
            <td>${pageContext.servletContext.serverInfo}</td>
        </tr>

    </table>
</div>
<script>
    function fullScreen(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            area: ['70%', '70%'],
            content: url,
            maxmin: true
        });
        layer.full(index);
    }
</script>
</body>
</html>