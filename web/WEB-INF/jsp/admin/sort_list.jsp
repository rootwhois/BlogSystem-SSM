<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="common/include.jsp" %>
<body>
<%@include file="common/header.jsp" %>

<br/>
<table class="table table-sm">
    <thead>
    <tr class="table-info">
        <th>id</th>
        <th width="25%">分类名</th>
        <th>分类下文章</th>
        <th>编辑</th>
        <th>删除</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageInfo.list}" var="sort">
        <tr>
            <th scope="row">${sort.sortId}</th>
            <td>${sort.sortName}</td>
            <td>
                <button type="button" class="btn btn-outline-info btn-sm"
                        onclick="fullScreen('《${sort.sortName}》','${pageContext.request.contextPath}/admin/sort/detail?id=${sort.sortId}')">
                    详情
                </button>
            </td>
            <td>
                <button type="button" class="btn btn-outline-primary btn-sm"
                        onclick="fullScreen('《${sort.sortName}》|编辑','${pageContext.request.contextPath}/admin/sort/edit?id=${sort.sortId}')">
                    编辑
                </button>&nbsp;&nbsp;
            </td>
            <td>
                <button type="button" class="btn btn-outline-danger btn-sm"
                        onclick="ifdelete('${sort.sortId}','${sort.sortName}') ">删除
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
                                 href="${pageContext.request.contextPath}/admin/sort/list?pageNum=1">首页</a></li>

        <li class="page-item"><c:if test="${pageInfo.hasPreviousPage }">
            <a class="page-link"
               href="${pageContext.request.contextPath}/admin/sort/list?pageNum=${pageInfo.pageNum -1}">上一页</a>
        </c:if></li>

        <c:forEach items="${pageInfo.navigatepageNums }" var="pno">
            <li class="page-item"><a class="page-link"
                                     href="${pageContext.request.contextPath}/admin/sort/list?pageNum=${pno }">${pno }</a>
            </li>
        </c:forEach>

        <li class="page-item"><c:if test="${pageInfo.hasNextPage }">
            <a class="page-link"
               href="${pageContext.request.contextPath}/admin/sort/list?pageNum=${pageInfo.pageNum +1}">下一页</a>
        </c:if></li>

        <li class="page-item"><a class="page-link"
                                 href="${pageContext.request.contextPath}/admin/sort/list?pageNum=${pageInfo.pages }">尾页</a>
        </li>
    </ul>
</nav>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
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

    function ifdelete(id, title) {
        layer.confirm('确定删除吗?', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/admin/sort/del',
                datatype: 'json',
                data: {"id": id},
                success: function (data) {
                    if (data['stateCode'] == 1) {
                        layer.msg('删除成功!', {icon: 1, time: 1000});
                        setTimeout("window.location.reload()", 1000);
                    } else {
                        layer.msg('删除失败,请检查该分类下是否有文章!', {icon: 5, time: 1000});
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
</body>
</html>