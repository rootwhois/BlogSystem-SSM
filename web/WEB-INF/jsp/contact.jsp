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
                <h1 class="page-title">Contact</h1>
                <article class="post">
                    <div class="entry-content clearfix">
                        <form action="#" method="post" class="contact-form">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <my:token></my:token>
                                    <input type="text" id="name" name="name" placeholder="Name" required>
                                    <input type="email" id="email" name="email" placeholder="Email" required>
                                    <textarea id="message" name="message" rows="7" placeholder="Your Message"
                                              required></textarea>
                                    <button id="submit" class="btn-send btn-5 btn-5b ion-ios-paperplane"><span>Drop Me a Line</span>
                                    </button>
                                </div>
                            </div>    <!-- row -->
                        </form>
                    </div>
                </article>
            </main>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("#submit").click(function () {
            var name = $("#name").val();
            var email = $("#email").val();
            var message = $("#message").val();
            var patt = /^.{2,12}$/;
            if (!patt.test(name)) {
                alert("用户名不合法，最少2位最多12位");
                return false;
            }
            if (message.length > 1000) {
                alert("最多只能1000字哦");
                return false;
            }
        })
    })
</script>
<%@include file="common/footer.jsp" %>
</body>
</html>
