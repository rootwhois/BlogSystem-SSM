<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<html>
<%@include file="common/import.jsp" %>

<body id="page">
<%@include file="common/header.jsp" %>
<div class="content-body">
    <div class="container">
        <div class="row">
            <main class="col-md-12">
                <article class="post">
                    <div class="entry-content clearfix">
                        <figure class="img-responsive-center" style="text-align: center">
                            <img src="${pageContext.request.contextPath}/${userAvatar}" class="avatar">
                        </figure>
                        <h1 class="page-title">关于我</h1>
                        <p>欢迎来到${webName}，我是${userNickName}。</p>
                        <p><a href="mailto:${userEmail}">戳我给我发邮件吧！</a></p>
                    </div>
                </article>
            </main>
        </div>
    </div>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>
