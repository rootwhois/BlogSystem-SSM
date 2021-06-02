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
                <div class="widget widget-archives">
                    <h3 class="widget-title">标签</h3>
                    <c:forEach items="${pageInfo.list}" var="tag">
                        <label>
                            <a href="${pageContext.request.contextPath}/search/articles?type=tags&keywords=${tag.tagId}">${tag.tagName}</a><br>
                        </label>
                    </c:forEach>
                </div>
                共 ${pageInfo.total } 行记录，当前是第 ${pageInfo.pageNum } 页，共
                ${pageInfo.pages }页
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link"
                                                 href="${pageContext.request.contextPath}/tag/list?pageNum=1">首页</a>
                        </li>

                        <li class="page-item"><c:if test="${pageInfo.hasPreviousPage }">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/tag/list?pageNum=${pageInfo.pageNum -1}">上一页</a>
                        </c:if></li>

                        <c:forEach items="${pageInfo.navigatepageNums }" var="pno">
                            <li class="page-item"><a class="page-link"
                                                     href="${pageContext.request.contextPath}/tag/list?pageNum=${pno }">${pno }</a>
                            </li>
                        </c:forEach>

                        <li class="page-item"><c:if test="${pageInfo.hasNextPage }">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/tag/list?pageNum=${pageInfo.pageNum +1}">下一页</a>
                        </c:if></li>

                        <li class="page-item"><a class="page-link"
                                                 href="${pageContext.request.contextPath}/tag/list?pageNum=${pageInfo.pages }">尾页</a>
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
