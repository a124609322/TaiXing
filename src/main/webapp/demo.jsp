<%--
  Created by IntelliJ IDEA.
  User: a1246_000
  Date: 2016/10/8
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/cropavatar/css/cropper.min.css"/>
    <script type="application/javascript"  src="${ctx}/js/jquery-2.1.4.min.js"></script>
    <script type="application/javascript" src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
    <script type="application/javascript"  src="${ctx}/cropavatar/js/cropper.js"></script>
    <title>Title</title>
</head>
<body>
    <img id="image" src="data:image/jpeg;base64," alt="Picture" style="height: 300px;width:100%">
</body>
<script type="application/javascript">
    $("#image").cropper({
        aspectRatio: 16 / 9,
        crop: function(e) {
            // Output the result data for cropping image.
            console.log(e.x);
            console.log(e.y);
            console.log(e.width);
            console.log(e.height);
            console.log(e.rotate);
            console.log(e.scaleX);
            console.log(e.scaleY);
        }
    });
</script>
</html>
