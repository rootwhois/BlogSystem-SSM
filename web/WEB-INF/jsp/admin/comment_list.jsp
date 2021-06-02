<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setTimeZone value="GMT+8"/>
<%@include file="common/include.jsp" %>
<body>
<div style="position: relative;top: 10%">
    <c:if test="${!empty succ}">
        <div class="alert alert-success" role="alert">
                ${succ}
        </div>
    </c:if>
    <c:if test="${!empty error}">
        <div class="alert alert-danger" role="alert">
                ${error}
        </div>
    </c:if>
</div>
<div class="container">
    <c:if test="${!empty pageInfo.list}">
        <table class="table">
            <thead class="thead-default">
            <tr>
                <th>流水号</th>
                <th>评论内容</th>
                <th>日期</th>
                <th>昵称</th>
                <th>邮箱</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="comment">
                <tr>
                    <th scope="row">${comment.commentId}</th>
                    <td>${comment.commentContent}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${comment.commentTime}"/></td>
                    <td>${comment.commentNickname}</td>
                    <td>${comment.commentEmail}</td>
                    <td>
                        <button type="button" class="btn btn-outline-danger btn-sm"
                                onclick="ifdelete('${comment.commentId}') ">删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        共 ${pageInfo.total } 行记录，当前是第 ${pageInfo.pageNum } 页，共
        ${pageInfo.pages }页
        <nav aria-label="Page navigation example" style="position: absolute;bottom: 10px;left: 42%">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link"
                                         href="${pageContext.request.contextPath}/admin/comment?articleId=${articleId}&pageNum=1">首页</a>
                </li>

                <li class="page-item"><c:if test="${pageInfo.hasPreviousPage }">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/admin/comment?articleId=${articleId}&pageNum=${pageInfo.pageNum -1}">上一页</a>
                </c:if></li>

                <c:forEach items="${pageInfo.navigatepageNums }" var="pno">
                    <li class="page-item"><a class="page-link"
                                             href="${pageContext.request.contextPath}/admin/comment?articleId=${articleId}&pageNum=${pno }">${pno }</a>
                    </li>
                </c:forEach>

                <li class="page-item"><c:if test="${pageInfo.hasNextPage }">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/admin/comment?articleId=${articleId}&pageNum=${pageInfo.pageNum +1}">下一页</a>
                </c:if></li>

                <li class="page-item"><a class="page-link"
                                         href="${pageContext.request.contextPath}/admin/comment?articleId=${articleId}&pageNum=${pageInfo.pages }">尾页</a>
                </li>
            </ul>
        </nav>
        <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
        <script>
            function ifdelete(commentId) {
                layer.confirm('确定删除该评论吗?', {
                    btn: ['确定', '取消'] //按钮
                }, function () {
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/admin/comment/del',
                        datatype: 'json',
                        data: {"commentId": commentId},
                        success: function (data) {
                            if (data['stateCode'] == 0) {
                                layer.msg('删除成功!', {icon: 1, time: 1000});
                                setTimeout("window.location.reload()", 1000);
                            } else {
                                layer.msg('删除失败!', {icon: 5, time: 1000});
                            }
                        },
                        error: function (data) {
                            console.log('错误...');
                        },
                    });
                }, function () {

                });
            }
        </script>
    </c:if>
    <c:if test="${empty pageInfo.list}">
        <div class="card">
            <div class="card-body">
                该文章暂无评论!
            </div>
        </div>
    </c:if>
</div>
</body>
</html>