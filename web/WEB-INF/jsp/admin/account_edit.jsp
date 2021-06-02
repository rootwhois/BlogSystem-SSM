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

</head>
<body>
<%@include file="common/header.jsp" %>
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
    <form action="${pageContext.request.contextPath}/admin/account/do">
        <input type="hidden" value="${admin.userId}" name="id">
        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="用户名"
                   value="${admin.userName}" required>
        </div>
        <div class="form-group">
            <label for="question1">问题1</label>
            <input type="text" class="form-control" id="question1" name="question1" placeholder="问题1"
                   value="${admin.question1}" required>
        </div>
        <div class="form-group">
            <label for="answer1">答案1</label>
            <input type="text" class="form-control" id="answer1" name="answer1" placeholder="答案1"
                   value="${admin.answer1}" required>
        </div>
        <div class="form-group">
            <label for="question2">问题2</label>
            <input type="text" class="form-control" id="question2" name="question2" placeholder="问题2"
                   value="${admin.question2}" required>
        </div>
        <div class="form-group">
            <label for="answer2">答案2</label>
            <input type="text" class="form-control" id="answer2" name="answer2" placeholder="答案2"
                   value="${admin.answer2}" required>
        </div>
        <div class="form-group">
            <label for="question3">问题3</label>
            <input type="text" class="form-control" id="question3" name="question3" placeholder="问题3"
                   value="${admin.question3}" required>
        </div>
        <div class="form-group">
            <label for="answer3">答案3</label>
            <input type="text" class="form-control" id="answer3" name="answer3" placeholder="答案3"
                   value="${admin.answer3}" required>
        </div>
        <div class="form-group">
            <label for="password1">密码</label>
            <input type="password" class="form-control" id="password1" name="password1" placeholder="密码">
        </div>
        <div class="form-group">
            <label for="password2">确认密码</label>
            <input type="password" class="form-control" id="password2" name="password2" placeholder="确认密码"
                   onkeyup="validate()">
        </div>
        <div id="message"></div>
        <input type="submit" value="提交" id="submit"/>
        <input type="reset" value="重置"/>
    </form>
</div>
</body>
<script type="text/javascript">
    function validate() {
        var pw1 = document.getElementById("password1").value;
        var pw2 = document.getElementById("password2").value;
        var patrn=/^(\w){6,20}$/;
        if(!patrn.exec(pw1)){
            document.getElementById("message").innerHTML = "<font color='green'>只能输入6-20个字母、数字、下划线</font>";
            document.getElementById("submit").disabled = false;
        }
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