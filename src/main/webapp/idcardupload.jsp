<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>泰兴物流</title>
    <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="css/common.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/idcard.css"/>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
    <script type="application/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="info-content">
    <div class="info" style="padding-bottom: 0px">
        <div class="idcard_title">上传身份证</div>
        <form id="uploadidcard" action="uploadIdCardInfo.htm" method="post" enctype="multipart/form-data" encoding="utf-8" accept-charset="utf-8" class="form-horizontal" role="form">
            <div class="idcard_content">
                <div class="form-group">
                    <div for="code" class="col-sm-2 control-label">运单号</div>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="code" name="code"
                               placeholder="请填写运单号码">
                    </div>
                </div>
                <div class="form-group">
                    <div for="code" class="col-sm-2 control-label must">证件类型</div>
                    <div class="col-sm-10">
                        <select id="cardType" name="cardType" class="form-control" >
                            <option value="">请选择</option>
                            <option value="0">大陆身份证</option>
                            <option value="1">大陆护照</option>
                            <option value="2">外国护照</option>
                            <option value="4">其他</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div for="idnumber" class="col-sm-2 control-label must">证件号码</div>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="idnumber" name="idnumber"
                               placeholder="请填写证件号码">
                    </div>
                </div>
                <div class="form-group">
                    <div for="name" class="col-sm-2 control-label must">姓名</div>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name"
                               placeholder="请填写姓名">
                    </div>
                </div>
                <div class="form-group">
                    <div for="phone" class="col-sm-2 control-label must">手机</div>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="phone" name="phone"
                               placeholder="请填写的手机号码">
                    </div>
                </div>
                <div class="form-group">
                    <div for="email" class="col-sm-2 control-label must">邮箱</div>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="email" name="email"
                               placeholder="请填写的邮箱地址">
                    </div>
                </div>
            </div>
            <div class="idcard_file">
                <div class="form-group">
                    <div for="frontCard" class="col-sm-3 control-label must">身份证正面</div>
                    <div class="col-sm-9">
                        <input type="file" class="form-control file" id="frontCard" name="frontCard"
                               accept="image/gif,image/jpeg,image/png">
                    </div>
                </div>
                <div class="form-group">
                    <div for="backCard" class="col-sm-3 control-label must">身份证背面</div>
                    <div class="col-sm-9">
                        <input type="file" class="form-control file" id="backCard" name="backCard"
                               accept="image/gif,image/jpeg,image/png">
                    </div>
                </div>
                <div class="form-group">
                    <div class="idcard_file_desc">
                        <p> 图片规格: &lt; 1024 Kbs ; Size: &lt; 1024 Kbs </p>
                        <p> 图片格式: jpg/png/gif ; File format: jpg/png/gif </p>
                    </div>
                </div>
            </div>
            <div class="idcard_botton">
                <button type="submit" class="btn btn-success">&nbsp;&nbsp;提&nbsp;&nbsp;交&nbsp;&nbsp;</button>
                <button type="button" class="btn btn-default" style="margin-left: 10px" onclick="backHome();">&nbsp;&nbsp;退&nbsp;&nbsp;出&nbsp;&nbsp;</button>
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="/js/jquery-2.1.4.min.js"></script>
<script src="js/idcard.js"></script>
</body>
</html>
