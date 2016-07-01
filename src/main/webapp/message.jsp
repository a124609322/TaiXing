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
    <link rel="stylesheet" href="css/common.css"/>
    <link rel="stylesheet" href="css/index.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="message">
    <div class="n_contents">
        <!--左边图片-->
        <div class="p_left">
        </div>
        <!--右边新闻列表-->
        <div class="newList">
            <div class="title"><span>通知公告</span>/ <span class="new">NEWS</span></div>
            <ul id="List">
            </ul>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="/js/jquery-2.1.4.min.js"></script>
<script src="/js/message.js"></script>
</body>
</html>