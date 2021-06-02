<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page pageEncoding="utf-8" %>
<html>
<%@include file="common/import.jsp" %>
<body>
<%@include file="common/header.jsp" %>
<div class="content-body">
    <div class="container">
        <div class="row">
            <main class="col-md-12">
                <div class="widget widget-recent-posts">
                    <h3 class="widget-title">共找到 ${pageInfo.total } 条搜索结果：</h3>
                    <ul>
                        <c:forEach items="${pageInfo.list }" var="article">
                            <li>
                                <a href="${pageContext.request.contextPath}/article/single?articleId=${article.articleId}">${article.articleTitle}</a><br>
                                    <%--                                <p>${fn:substring(article.articleContent,0,200)}</p>--%>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                共 ${pageInfo.total } 行记录，当前是第 ${pageInfo.pageNum } 页，共
                ${pageInfo.pages }页
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a
                                href="${pageContext.request.contextPath}/search/articles?type=${type }&keywords=${keywords }&pageNum=1">首页</a>
                        </li>

                        <li><c:if test="${pageInfo.hasPreviousPage }">
                            <a
                                    href="${pageContext.request.contextPath}/search/articles?type=${type }&keywords=${keywords }&pageNum=${pageInfo.pageNum -1}">上一页</a>
                        </c:if></li>

                        <c:forEach items="${pageInfo.navigatepageNums }" var="pno">
                            <li><a
                                    href="${pageContext.request.contextPath}/search/articles?type=${type }&keywords=${keywords }&pageNum=${pno }">${pno }</a>
                            </li>
                        </c:forEach>

                        <li><c:if test="${pageInfo.hasNextPage }">
                            <a
                                    href="${pageContext.request.contextPath}/search/articles?type=${type }&keywords=${keywords }&pageNum=${pageInfo.pageNum +1}">下一页</a>
                        </c:if></li>

                        <li><a
                                href="${pageContext.request.contextPath}/search/articles?type=${type }&keywords=${keywords }&pageNum=${pageInfo.pages }">尾页</a>
                        </li>
                    </ul>
                </nav>
            </main>
        </div>
    </div>
</div>
<%@include file="common/footer.jsp" %>

</body>
</html>
