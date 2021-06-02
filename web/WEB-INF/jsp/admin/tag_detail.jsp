<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <td>${tag.tagId}</td>
    </tr>
    <tr class="table-secondary">
        <th>标签名</th>
        <td>${tag.tagName}</td>
    </tr>
    <c:forEach items="${articles}" var="article">
        <tr class="table-info">
            <th></th>
            <td></td>
        </tr>
        <tr class="table-light">
            <th>文章ID</th>
            <td>${article.articleId}</td>
        </tr>
        <tr class="table-danger">
            <th>标题</th>
            <td>${article.articleTitle}</td>
        </tr>
        <tr class="table-warning">
            <th>时间</th>
            <td>${article.articleDate}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>