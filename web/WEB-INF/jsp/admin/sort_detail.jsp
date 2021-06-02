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
        <td>${sort.sortId}</td>
    </tr>
    <tr class="table-secondary">
        <th>分类名</th>
        <td>${sort.sortName}</td>
    </tr>
    <c:forEach items="${pageInfo.list}" var="article">
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
共 ${pageInfo.total } 行记录，当前是第 ${pageInfo.pageNum } 页，共
${pageInfo.pages }页
<nav aria-label="Page navigation example" style="position: absolute;bottom: 10px;left: 42%">
    <ul class="pagination justify-content-center">
        <li class="page-item"><a class="page-link"
                                 href="${pageContext.request.contextPath}/admin/sort/detail?id=${id}&pageNum=1">首页</a>
        </li>

        <li class="page-item"><c:if test="${pageInfo.hasPreviousPage }">
            <a class="page-link"
               href="${pageContext.request.contextPath}/admin/sort/detail?id=${id}&pageNum=${pageInfo.pageNum -1}">上一页</a>
        </c:if></li>

        <c:forEach items="${pageInfo.navigatepageNums }" var="pno">
            <li class="page-item"><a class="page-link"
                                     href="${pageContext.request.contextPath}/admin/sort/detail?id=${id}&pageNum=${pno }">${pno }</a>
            </li>
        </c:forEach>

        <li class="page-item"><c:if test="${pageInfo.hasNextPage }">
            <a class="page-link"
               href="${pageContext.request.contextPath}/admin/sort/detail?id=${id}&pageNum=${pageInfo.pageNum +1}">下一页</a>
        </c:if></li>

        <li class="page-item"><a class="page-link"
                                 href="${pageContext.request.contextPath}/admin/sort/detail?id=${id}&pageNum=${pageInfo.pages }">尾页</a>
        </li>
    </ul>
</nav>
</body>
</html>