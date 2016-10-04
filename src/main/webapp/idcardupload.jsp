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
    <link rel="shortcut icon" href="${ctx}image/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${ctx}/css/common.css"/>
    <link rel="stylesheet" href="${ctx}/css/index.css"/>
    <link rel="stylesheet" href="${ctx}/css/idcard.css"/>
    <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css"/>
    <script src="/js/jquery-2.1.4.min.js"></script>
    <script type="application/javascript" src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${ctx}/js/idcard.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="info-content">
    <div class="info" style="padding-bottom: 0px">
        <div class="idcard_title">上传身份证</div>
        <form id="uploadidcard" action="${ctx}/upload/idcard" method="post" enctype="multipart/form-data" encoding="utf-8" accept-charset="utf-8" class="form-horizontal" role="form">
            <div class="idcard_content">
                <div class="form-group">
                    <div for="code" class="col-sm-2 control-label">运单号</div>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="waybillcode"
                               placeholder="请填写运单号码" value="${waybillcode}">
                    </div>
                </div>
                <div class="form-group">
                    <div for="code" class="col-sm-2 control-label must">证件类型</div>
                    <div class="col-sm-10">
                        <select id="cardtype" name="cardtype" class="form-control" value="${cardtype}">
                            <option value="">请选择</option>
                            <option value="0">大陆身份证</option>
                            <option value="1">大陆护照</option>
                            <option value="2">外国护照</option>
                            <option value="4">其他</option>
                        </select>
                        <span id="cardTypeError" class="label label-danger">${cardTypeError}</span>
                    </div>
                </div>
                <div class="form-group">
                    <div for="idnumber" class="col-sm-2 control-label must">证件号码</div>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="idcardnum" name="idcardnum"
                               placeholder="请填写证件号码" value="${idcardnumber}">
                        <span id="idCardNumError" class="label label-danger">${idCardNumError}</span>
                    </div>
                </div>
                <div class="form-group">
                    <div for="name" class="col-sm-2 control-label must">姓名</div>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name"
                               placeholder="请填写姓名" value="${name}">
                        <span id="nameError" class="label label-danger">${nameError}</span>
                    </div>
                </div>
                <div class="form-group">
                    <div for="phone" class="col-sm-2 control-label must">手机</div>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="phone" name="phone"
                               placeholder="请填写的手机号码" value="${phone}">
                        <span id="phoneError" class="label label-danger">${phoneError}</span>
                    </div>
                </div>
                <div class="form-group">
                    <div for="email" class="col-sm-2 control-label must">邮箱</div>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="email" name="email"
                               placeholder="请填写的邮箱地址" value="${email}">
                        <span id="emailError" class="label label-danger">${emailError}</span>
                    </div>
                </div>
            </div>
            <div class="idcard_file">
                <div class="form-group">
                    <div for="frontCard" class="col-sm-3 control-label must">身份证正面</div>
                    <div class="col-sm-9">
                        <input type="file" class="form-control file" id="frontCard" name="frontCard"
                               accept="image/gif,image/jpeg,image/png" value="${frontcard}">
                        <span id="frontCardError" class="label label-danger">${frontCardError}</span>
                    </div>
                </div>
                <div class="form-group">
                    <div for="backCard" class="col-sm-3 control-label must">身份证背面</div>
                    <div class="col-sm-9">
                        <input type="file" class="form-control file" id="backCard" name="backCard"
                               accept="image/gif,image/jpeg,image/png" value="${backcard}">
                        <span id="backCardError" class="label label-danger">${backCardError}</span>
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
                <button type="button" class="btn btn-success" onclick="submitForm()">&nbsp;&nbsp;提&nbsp;&nbsp;交&nbsp;&nbsp;</button>
                <button type="button" class="btn btn-default" style="margin-left: 10px" onclick="backHome();">&nbsp;&nbsp;退&nbsp;&nbsp;出&nbsp;&nbsp;</button>
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>
