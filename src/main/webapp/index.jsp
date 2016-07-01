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
    <meta name="renderer" content="webkit">
    <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="css/common.css"/>
    <link rel="stylesheet" href="css/index.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div  class="focus-banner">
    <ul class="focus-banner-list">

    </ul>
    <a href="javascript:;" class="focus-handle next-img"></a>
    <a href="javascript:;" class="focus-handle prev-img"></a>
</div>
<div class="search">
    <form action="/waybill/view.html" method="get">
        <input class="searchs float" type="search" placeholder="请输入快递单号进行查询" name="code" autocomplete="off"/>
        <input type="submit" class="sub float" value="去找找"/>
        <div class="clearfix"></div>
    </form>
</div>
<div class="contents"></div>
<div class="jiekou">
    <ul>
    </ul>
</div>
<jsp:include page="/footer.jsp"/>
<script src="/js/jquery-2.1.4.min.js"></script>
<script src="/js/index.js"></script>
</body>
</html>
