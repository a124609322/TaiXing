<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>回到登录界面</title>
	<link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body style="background-image: url('/image/pic_bg.jpg')">
  	<div id="container" align="center" style="margin-top:200px">
	    <div><h1>对不起，您还没登录或者长时间未操作，请重新登录。</h1></div>
	    <div><span id="second">5</span>秒后自动跳转</div>
	    <div><a href="<%=basePath%>admin/">如果没有自动跳转，请点击此处</a></div>
    </div>
  </body>
  <script type="text/javascript">
  	var i = 5;
    function reloadLogin(){
    	if(i == 0){
    		window.location.href = "<%=basePath%>admin/";
    		return;
    	}
    	i--;
    	var second = document.getElementById("second");
    	second.innerHTML = i;
    }
    setInterval("reloadLogin()", 1000);
  </script>
</html>
