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
    <link rel="shortcut icon" href="${ctx}/image/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/css/common.css"/>
    <link rel="stylesheet" href="${ctx}/css/index.css"/>
</head>
<body>
<jsp:include page="${ctx}/header.jsp"/>
<div class="message" style="height: 600px">
    <div style="width: 200px;height: 100px;margin:auto;padding-top: 100px">
        <img src="${ctx}/image/error.png" alt="错误">
    </div>
    <div style="color: white;font-size: 30px;margin:auto;width: 680px;padding-top: 150px">
        操作失败，请联系技术人员!等待 <span id="time">10</span> 秒 跳转到首页
    </div>
    <div style="margin:auto;width: 120px;padding-top: 20px">
        <a href="${ctx}/index.jsp" style="color: white;font-size: 20px;">点击跳转首页</a>
    </div>
</div>
<jsp:include page="${ctx}/footer.jsp"/>
<script src="${ctx}/js/jquery-2.1.4.min.js"></script>
<script src="${ctx}/js/message.js"></script>
</body>
<script type="application/javascript">
    var second =  10;
    function countSecond(){
        $("#time").html(second);
        if(second == 0){
            window.location.href="${ctx}/index.jsp";
        }
        setTimeout("countSecond()",1000)
        second--;
    }
    $(function(){
        countSecond();
    });

</script>
</html>