<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap4.0.min.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.slim.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap4.0.min.js"></script>
<%--    <%@include file="../common/import.jsp" %>--%>
<%--    <%@include file="../common/header.jsp" %>--%>
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
    <form action="${pageContext.request.contextPath}/login/reset/step2">
        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="用户名" value="" required>
        </div>
        <input type="submit" value="提交" id="submit"/>
        <input type="reset" value="重置"/>
    </form>
</div>
</body>
<script type="text/javascript">
    function validate() {
        var pw1 = document.getElementById("password1").value;
        var pw2 = document.getElementById("password2").value;
        if (pw1 == pw2) {
            document.getElementById("message").innerHTML = "<font color='green'>两次密码相同</font>";
            document.getElementById("submit").disabled = false;
        } else {
            document.getElementById("message").innerHTML = "<font color='red'>两次密码不相同</font>";
            document.getElementById("submit").disabled = true;
        }
    }
</script>
</html>