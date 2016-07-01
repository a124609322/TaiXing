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
    <meta charset="UTF-8">
    <title>泰兴物流</title>
    <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/common.css"/>
    <link rel="stylesheet" href="/css/index.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="info-content">
    <div class="info">
        <h1 align="center">${notice.title}</h1>
        <%--<div class="intro">${notice.intro}</div>--%>
        ${notice.content}
    </div>
</div>

<script src="/js/jquery-2.1.4.min.js"></script>
<script>
    $(function(){
        $(" .qq-zixun").mouseover(function(){

            $(this).stop();
            $(this).css({background:"#C9112C"},500);
            $(this).animate({width:"205px",height:"52px"},500);
        });
        $(" .qq-zixun").mouseleave(function(){
            $(this).stop();
            $(this).css({background:"#d5d5d5"},500);
            $(this).animate({width:"70px",height:"52px"},500);
        });
        $(".erweima").hover(function(){
            $(".big-erwei").show();
        },function(){
            $(".big-erwei").hide();
        });
    });
</script>
<jsp:include page="footer.jsp"/>
</body>
</html>