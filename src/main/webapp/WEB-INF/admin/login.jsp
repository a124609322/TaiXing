<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
	    <base href="<%=basePath%>">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>登录</title>
        <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon" />
        <link href="${ctx}/bootstrap/css/style.default.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>

    <body class="signin">
        
        
        <section>
            
            <div class="panel panel-signin" style="background-color: rgba(255, 255, 255,0.7)">
                <div class="panel-body">
                    <div class="logo text-center">
                        <img src="/image/logo.jpg" alt="Logo" with="80" height="80" >
                    </div>
                    <br />
                    <h4 class="text-center mb5">泰興物流后台管理系统</h4>
                    
                    <div class="mb30"></div>
                    
                    <form action="${ctx}admin/login" method="post">
                        <div class="input-group mb15 
                        	<c:if test="${!empty login_result }">has-error</c:if>
                        ">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input name="loginname" type="text" class="form-control " placeholder="请输入用户名登录">
                        </div><!-- input-group -->
                        <div class="input-group mb15
                        	<c:if test="${!empty login_result }">has-error</c:if>
                        ">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input name="password" type="password" class="form-control" placeholder="请输入密码">
                        </div><!-- input-group -->
                        <c:if test="${!empty login_result }">
                        	<div class="alert alert-danger">${login_result }</div>
                        </c:if>
                        <div class="clearfix">
                           <!--  <div class="pull-left">
                                <div class="ckbox ckbox-primary mt10">
                                    <input type="checkbox" id="rememberMe" name="rememberMe" value="1">
                                    <label for="rememberMe">记住登录状态</label>
                                </div>
                            </div> -->
                            <div>
                                <button type="submit" class="btn btn-success btn-block btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp; 录&nbsp;&nbsp;&nbsp;&nbsp;</button>
                            </div>
                        </div>                      
                    </form>
                    
                </div><!-- panel-body -->
            </div><!-- panel -->
            
        </section>


        <script src="${ctx}/bootstrap/js/jquery-1.11.1.min.js"></script>
        <script src="${ctx}/bootstrap/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
        <script src="${ctx}/bootstrap/js/modernizr.min.js"></script>
        <script src="${ctx}/bootstrap/js/pace.min.js"></script>
        <script src="${ctx}/bootstrap/js/retina.min.js"></script>
        <script src="${ctx}/bootstrap/js/jquery.cookies.js"></script>
        
        <script src="${ctx}/bootstrap/js/custom.js"></script>
        <script type="text/javascript">
        </script>
    </body>
</html>
