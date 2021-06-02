<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setTimeZone value="GMT+8"/>
<html>
<%@include file="common/import.jsp" %>
<body id="single">
<%@include file="common/header.jsp" %>
<div class="content-body">
    <div class="container">
        <div class="row">
            <main class="col-md-8">
                <article class="post post-1">
                    <header class="entry-header">
                        <h1 class="entry-title">${article.articleTitle}</h1>
                        <div class="entry-meta">
                            <span class="post-category"><a href="#">${sort.sortName}</a></span>
                            <span class="post-date"><a href="#"><time class="entry-date"
                                                                      datetime="2012-11-09T23:15:57+00:00">发布时间：<fmt:formatDate
                                    pattern="yyyy-MM-dd HH:mm:ss" value="${article.articleDate}"/></time></a></span>
                            <span class="comments-link"><a href="#">${commentCount} 评论</a></span>
                            <%--                            <span class="views-count"><a href="#">588 阅读</a></span>--%>
                        </div>
                    </header>
                    <div class="entry-content clearfix">
                        ${article.articleContent}
                    </div>
                </article>
                <section class="comment-area" id="comment-area">
                    <hr>
                    <h3>发表评论</h3>
                    <form action="${pageContext.request.contextPath}/comment/submit" method="post" class="comment-form">
                        <input type="hidden" name="action" value="commitComment"/>
                        <input type="hidden" name="articleId" value="${article.articleId}"/>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="id_name">名字：</label>
                                <input type="text" id="id_name" name="name" required>
                            </div>
                            <div class="col-md-6">
                                <label for="id_email">邮箱：</label>
                                <input type="email" id="id_email" name="email" required>
                            </div>
                            <div class="col-md-12">
                                <label for="id_comment">评论：</label>
                                <textarea name="commentContent" id="id_comment" required></textarea>
                                <button id="submit" type="submit" class="comment-btn">发表</button>
                                <span>${message}</span>
                            </div>
                        </div>    <!-- row -->
                    </form>
                    <div class="comment-list-panel">
                        <h3>评论列表，共 <span>${commentCount}</span> 条评论</h3>
                        <ul class="comment-list list-unstyled">
                            <c:if test="${commentCount == 0}">
                                <li class="comment-item">
                                    <span class="text">暂无评论，快来抢沙发吧！</span>
                                </li>
                            </c:if>
                            <c:forEach items="${pageInfo.list}" var="comment">
                                <li class="comment-item">
                                    <span class="nickname">${comment.commentNickname}</span>
                                    <time class="submit-date" datetime="2012-11-09T23:15:57+00:00"><fmt:formatDate
                                            pattern="yyyy-MM-dd HH:mm:ss" value="${comment.commentTime}"/></time>
                                    <div class="text">
                                            ${comment.commentContent}
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                        共 ${pageInfo.total } 行记录，当前是第 ${pageInfo.pageNum } 页，共
                        ${pageInfo.pages }页
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a
                                        href="${pageContext.request.contextPath}/article/single?articleId=${article.articleId}&commentPageNum=1">首页</a>
                                </li>

                                <li><c:if test="${pageInfo.hasPreviousPage }">
                                    <a
                                            href="${pageContext.request.contextPath}/article/single?articleId=${article.articleId}&commentPageNum=${pageInfo.pageNum -1}">上一页</a>
                                </c:if></li>

                                <c:forEach items="${pageInfo.navigatepageNums }" var="pno">
                                    <li><a
                                            href="${pageContext.request.contextPath}/article/single?articleId=${article.articleId}&commentPageNum=${pno }">${pno }</a>
                                    </li>
                                </c:forEach>

                                <li><c:if test="${pageInfo.hasNextPage }">
                                    <a
                                            href="${pageContext.request.contextPath}/article/single?articleId=${article.articleId}&commentPageNum=${pageInfo.pageNum +1}">下一页</a>
                                </c:if></li>

                                <li><a
                                        href="${pageContext.request.contextPath}/article/single?articleId=${article.articleId}&commentPageNum=${pageInfo.pages }">尾页</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </section>
            </main>
            <%@include file="common/sideInfo.jsp" %>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("#submit").click(function () {
            var name = $("#id_name").val();
            var email = $("#id_mail").val();
            var comment = $("#id_comment").val();
            var patt = /^.{2,12}$/;
            if (!patt.test(name)) {
                alert("用户名不合法，最少2位最多12位");
                return false;
            }
            if (comment.length > 1000) {
                alert("最多只能1000字哦");
                return false;
            }
        })
    })
</script>
<%@include file="common/footer.jsp" %>
</body>
</html>
