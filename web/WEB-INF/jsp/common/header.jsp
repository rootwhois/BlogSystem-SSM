<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>


<div class="container">
    <header id="site-header">
        <div class="row">
            <div class="col-md-4 col-sm-5 col-xs-8">
                <div class="logo">
                    <h1><a href="${pageContext.request.contextPath}/"><b>${webName}</b></a></h1>
                </div>
            </div><!-- col-md-4 -->
            <div class="col-md-8 col-sm-7 col-xs-4">
                <nav class="main-nav" role="navigation">
                    <div class="navbar-header">
                        <button type="button" id="trigger-overlay" class="navbar-toggle">
                            <span class="ion-navicon"></span>
                        </button>
                    </div>

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="cl-effect-11"><a href="${pageContext.request.contextPath}/index" data-hover="首页">首页</a>
                            </li>
                            <%--                            <li class="cl-effect-11"><a href="${pageContext.request.contextPath}/full" data-hover="博客">博客</a></li>--%>
                            <li class="cl-effect-11"><a href="${pageContext.request.contextPath}/sort/list"
                                                        data-hover="分类">分类</a></li>
                            <li class="cl-effect-11"><a href="${pageContext.request.contextPath}/tag/list"
                                                        data-hover="标签">标签</a></li>
                            <li class="cl-effect-11"><a href="${pageContext.request.contextPath}/about" data-hover="关于">关于我</a>
                            </li>
                            <li class="cl-effect-11"><a href="${pageContext.request.contextPath}/admin"
                                                        data-hover="后台管理">后台管理</a></li>
                            <%--                            <li class="cl-effect-11"><a href="${pageContext.request.contextPath}/login" data-hover="后台管理">后台管理</a></li>--%>
                            <%--                            <li class="cl-effect-11"><a href="${pageContext.request.contextPath}/contact" data-hover="联系">联系</a></li>--%>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </nav>
            </div><!-- col-md-8 -->
        </div>
    </header>
</div>
