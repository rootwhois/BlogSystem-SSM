<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setTimeZone value="GMT+8"/>

<!DOCTYPE html>
<html>
<%@include file="common/import.jsp" %>

<body>
<%@include file="common/header.jsp" %>
<div class="content-body">
    <div class="container">
        <div class="row">
            <main class="col-md-8">
                <c:forEach items="${pageInfo.list }" var="article">
                    <article class="post post-1">
                        <header class="entry-header">
                            <h1 class="entry-title">
                                <a href="${pageContext.request.contextPath}/article/single?articleId=${article.articleId}">${article.articleTitle}</a>
                            </h1>
                            <div class="entry-meta">
                                <span class="post-category"><a href="#"></a></span>
                                <span class="post-date"><a href="#"><time class="entry-date"
                                                                          datetime="2012-11-09T23:15:57+00:00"><fmt:formatDate
                                        pattern="yyyy-MM-dd HH:mm:ss" value="${article.articleDate}"/></time></a></span>
                                    <%--                                <span class="post-author"><a href="#">追梦人物</a></span>--%>
                                    <%--                                <span class="comments-link"><a href="#">4 评论</a></span>--%>
                                    <%--                                <span class="views-count"><a href="#">588 阅读</a></span>--%>
                            </div>
                        </header>
                            <%--                        <div class="entry-content clearfix">--%>
                            <%--                            ${fn:substring(article.articleContent,0,20)}--%>
                            <%--                        </div>--%>
                        <div class="read-more cl-effect-14">
                            <a href="${pageContext.request.contextPath}/article/single?articleId=${article.articleId}"
                               class="more-link">开始阅读 <span class="meta-nav">→</span></a>
                        </div>
                    </article>
                </c:forEach>
                共 ${pageInfo.total } 行记录，当前是第 ${pageInfo.pageNum } 页，共
                ${pageInfo.pages }页
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a
                                href="${pageContext.request.contextPath}/index?articleId=${article.articleId}&pageNum=1">首页</a>
                        </li>

                        <li><c:if test="${pageInfo.hasPreviousPage }">
                            <a
                                    href="${pageContext.request.contextPath}/index?pageNum=${pageInfo.pageNum -1}">上一页</a>
                        </c:if></li>

                        <c:forEach items="${pageInfo.navigatepageNums }" var="pno">
                            <li><a
                                    href="${pageContext.request.contextPath}/index?pageNum=${pno }">${pno }</a></li>
                        </c:forEach>

                        <li><c:if test="${pageInfo.hasNextPage }">
                            <a
                                    href="${pageContext.request.contextPath}/index?pageNum=${pageInfo.pageNum +1}">下一页</a>
                        </c:if></li>

                        <li><a
                                href="${pageContext.request.contextPath}/index?pageNum=${pageInfo.pages }">尾页</a></li>
                    </ul>
                </nav>
            </main>


            <%@include file="common/sideInfo.jsp" %>
        </div>
        <%@include file="common/footer.jsp" %>
    </div>
</div>

</body>
</html>
