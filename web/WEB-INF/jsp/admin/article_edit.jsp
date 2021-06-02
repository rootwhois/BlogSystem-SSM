<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap4.0.min.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.slim.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap4.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
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
    <form action="${pageContext.request.contextPath}/admin/article/edit/do" method="post" enctype="multipart/form-data">
        <input type="hidden" value="${article.articleId}" name="id">
        <div class="form-group">
            <label for="title">文章标题</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="文章标题"
                   value="${article.articleTitle}" required>
        </div>
        <div class="form-group">
            <label for="sorts">分类</label>
            <select class="form-control" id="sorts" name="sortId">
                <c:forEach items="${sorts}" var="sort1">
                    <option value="${sort1.sortId}"
                            <c:if test="${article.articleSortId eq sort1.sortId}">selected="selected"</c:if>>${sort1.sortName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="tags">标签</label>
            <select class="form-control" id="tags" name="tagId">
                <c:forEach items="${tags}" var="tag1">
                    <option value="${tag1.tagId}"
                            <c:if test="${article.articleTagId eq tag1.tagId}">selected="selected"</c:if>>${tag1.tagName}</option>
                </c:forEach>
            </select>
        </div>
        <%--        <div class="form-group">--%>
        <%--            <label for="desci">简介</label>--%>
        <%--            <textarea class="form-control" id="desci" rows="3" name="desci" placeholder="简介">${article.desci}</textarea>--%>
        <%--        </div>--%>
        <div id="cont" style="display: none">${article.articleContent}</div>
        <div class="form-group">
            <label for="editor">内容</label>
            <script id="editor" type="text/plain" name="content" style="width:1024px;height:500px;">
            </script>
        </div>
        <input type="submit"/>
        <c:if test="${not empty article.articleId}">
            <input type="reset" value="重置"/>
        </c:if>
    </form>

    <script>
        $(function () {
            var ue = UE.getEditor('editor');
            ue.ready(function () {
                ue.setContent($("#cont").html());
            });
        });

    </script>
</div>
</body>
</html>