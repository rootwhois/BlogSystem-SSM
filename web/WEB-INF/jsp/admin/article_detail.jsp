<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setTimeZone value="GMT+8"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@include file="common/include.jsp" %>
</head>
<body>
<table class="table table-striped table-sm">

    <tr class="table-active">
        <th width="15%">ID</th>
        <td>${article.articleId}</td>
    </tr>
    <tr class="table-secondary">
        <th>标题</th>
        <td>${article.articleTitle}</td>
    </tr>
    <tr class="table-success">
        <th>分类</th>
        <td>${sort.sortName}</td>
    </tr>
    <tr class="table-light">
        <th>标签</th>
        <td>${tag.tagName}</td>
    </tr>
    <tr class="table-danger">
        <th>内容</th>
        <td>${article.articleContent}</td>
    </tr>
    <tr class="table-warning">
        <th>发表时间</th>
        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${article.articleDate}"/></td>
    </tr>
    <%--    <tr class="table-info">--%>
    <%--        <th>点击量</th>--%>
    <%--        <td>${article.click}</td>--%>
    <%--    </tr>--%>

</table>

</body>
</html>