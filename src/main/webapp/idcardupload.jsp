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
    <link rel="stylesheet" href="${ctx}/cropavatar/css/cropper.min.css">
    <link rel="stylesheet" href="${ctx}/css/font-awesome.css">
</head>
<body>
<!-- Cropping modal -->
<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog"
     tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="avatar-modal-label">编辑图片</h4>
            </div>
            <div class="modal-body">
                <!-- Upload image and data -->
                <div class="row">
                    <div class="col-md-12" style="margin-bottom: 5px">
                        <input type="file" id="inputImage" name="avatar_file" accept="image/*"
                               style="display: none">
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary" title="移动图片" onclick="setDragMode('move')">
                                <span class="fa fa-arrows"></span>
                            </button>
                            <button type="button" class="btn btn-primary" title="切割图片" onclick="setDragMode('crop')">
                                <span class="fa fa-crop"></span>
                            </button>
                        </div>

                        <div class="btn-group">
                            <button type="button" class="btn btn-primary" title="放大图片" onclick="zoom(0.1)">
                                <span class="fa fa-search-plus"></span>
                            </button>
                            <button type="button" class="btn btn-primary" title="缩小图片" onclick="zoom(-0.1)">
                                <span class="fa fa-search-minus"></span>
                            </button>
                        </div>

                        <div class="btn-group">
                            <button type="button" class="btn btn-primary" title="向左移动" onclick="move(-10,0)">
                                <span class="fa fa-arrow-left"></span>
                            </button>
                            <button type="button" class="btn btn-primary" title="向右移动" onclick="move(10,0)">
                                <span class="fa fa-arrow-right"></span>
                            </button>
                            <button type="button" class="btn btn-primary" title="向上移动" onclick="move(0,-10)">
                                <span class="fa fa-arrow-up"></span>
                            </button>
                            <button type="button" class="btn btn-primary" title="向下移动" onclick="move(0,10)">
                                <span class="fa fa-arrow-down"></span>
                            </button>
                        </div>

                        <div class="btn-group">
                            <button type="button" class="btn btn-primary" title="向左旋转" onclick="rotate(-45)">
                                <span class="fa fa-rotate-left"></span>
                            </button>
                            <button type="button" class="btn btn-primary" title="向右旋转" onclick="rotate(45)">
                                <span class="fa fa-rotate-right"></span>
                            </button>
                        </div>

                        <div class="btn-group">
                            <button type="button" class="btn btn-primary" title="水平翻转" onclick="scale('scaleX')">
                                <span class="fa fa-arrows-h"></span>
                            </button>
                            <button type="button" class="btn btn-primary" title="垂直翻转" onclick="scale('scaleY')">
                                <span class="fa fa-arrows-v"></span>
                            </button>
                            <button type="button" class="btn btn-primary" title="重置图片" onclick="reset()">
                                <span class="fa fa-refresh"></span>
                            </button>
                        </div>
                    </div>
                    <!-- Crop and preview -->
                    <div class="col-md-12">
                        <div class="img-container">
                            <img id="image" src="" alt="请导入图片" style="height: 300px;width:100%;max-width: 100%;border: 1px solid gray">
                        </div>
                    </div>
                    <div class="col-md-12" align="center">
                        <button type="button" class="btn btn-primary" style="width: 100px;margin: 20px" onclick="inputFile()">
                            <span class="fa fa-upload"></span>
                            导入图片
                        </button>
                        <button id="createCanvasButton" type="button" class="btn btn-primary" style="width: 100px;margin: 20px"
                                data-dismiss="modal" onclick="createCanvas()" disabled="disabled">
                            <span class="fa fa-picture-o"></span>
                            生成图片
                        </button>
                    </div>
                </div>
            </div>
            <!-- <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div> -->
        </div>
    </div>
</div><!-- /.modal -->

<jsp:include page="header.jsp"/>
<div class="info-content">
    <div class="info" style="padding-bottom: 0px">
        <div class="idcard_title">上传身份证</div>
        <form id="uploadidcard" action="${ctx}/upload/idcard" method="post" enctype="multipart/form-data"
              encoding="utf-8" accept-charset="utf-8" class="form-horizontal" role="form">
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
                    <div id="frontCardPic" class="col-sm-9" style="width: 320px;height: 180px;cursor: pointer"
                         data-toggle="modal" data-target="#avatar-modal" onclick="imgClick('frontCardPic','frontCard')">
                        <c:if test="${!empty frontcard}">
                            <img title="上传身份证正面照片" src="${frontcard}" alt="上传身份证正面照片">
                        </c:if>
                        <c:if test="${empty  frontcard}">
                            <img title="上传身份证正面照片" src="${ctx}/image/picstand.jpg" alt="上传身份证正面照片">
                        </c:if>
                    </div>
                    <input type="hidden" id="frontCard" name="frontCard" value="${frontcard}">
                    <span id="frontCardError" class="label label-danger">${frontCardError}</span>
                </div>
                <div class="form-group" style="margin-top: 50px">
                    <div for="backCard" class="col-sm-3 control-label must">身份证背面</div>
                    <div id="backCardPic" class="col-sm-9" style="width: 320px;height: 200px;cursor: pointer"
                         data-toggle="modal" data-target="#avatar-modal" onclick="imgClick('backCardPic','backCard')">
                        <c:if test="${!empty backcard}">
                            <img title="上传身份证背面照片" src="${backcard}" alt="上传身份证背面照片">
                        </c:if>
                        <c:if test="${empty  backcard}">
                            <img title="上传身份证背面照片" src="${ctx}/image/picstand.jpg" alt="上传身份证背面面照片" >
                        </c:if>
                    </div>
                    <input type="hidden" id="backCard" name="backCard" value="${backcard}">
                    <span id="backCardError" class="label label-danger">${backCardError}</span>
                </div>
                <div class="form-group" style="margin-top: 50px">
                    <div class="idcard_file_desc">
                        <p> 图片说明: 身份证第一上传必须上传照片，之后可以不上传照片</p>
                        <p> 图片格式: jpg/png/gif ; File format: jpg/png/gif </p>
                    </div>
                </div>
            </div>
            <div class="idcard_botton">
                <button id="submitFormButton" type="button" class="btn btn-success" onclick="submitForm()">&nbsp;&nbsp;提&nbsp;&nbsp;交&nbsp;&nbsp;</button>
                <button type="button" class="btn btn-default" style="margin-left: 10px" onclick="backHome();">&nbsp;&nbsp;退&nbsp;&nbsp;出&nbsp;&nbsp;</button>
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script type="application/javascript" src="${ctx}/js/jquery-2.1.4.min.js"></script>
<script type="application/javascript" src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
<script type="application/javascript" src="${ctx}/cropavatar/js/cropper.js"></script>
<script type="application/javascript" src="${ctx}/cropavatar/js/mycroper.js"></script>
<script type="application/javascript" src="${ctx}/js/idcard.js"></script>
</html>
