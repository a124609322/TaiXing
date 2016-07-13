<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <c:if test="${waybill != null and waybill.logisticsList.size()>0}">
        <div class="wl-head">
            <ul>
                <c:if test="${waybill.isEnd == 1}">
                    <li align="center" style="height: 26px">已签收</li>
                </c:if>
                <li>
                    <div class="icon fl"><img src="/image/pic_arrivetime.png" alt="" width="30" height="30"/></div>
                    <div class="r-info fl">
                        <p align="left">泰兴单号： ${waybill.code}</p>
                        <p align="left">国内单号： ${waybill.expresscode}</p>
                    </div>
                    <div class="clearfix"></div>
                </li>
                <li>
                    <div class="icon fl" style="line-height: 38px"><img src="/image/pic_deliverytime.png" alt="" width="30" height="30"/></div>
                    <div class="r-info fl">
                        <p style="line-height: 38px">快递公司：${waybill.expresscompany}</p>
                    </div>
                    <div class="clearfix"></div>
                </li>
            </ul>
        </div>
        <div class="wl-footer">
            <ul>
                <c:forEach var="logiscs" items="${waybill.logisticsList}">
                    <li>
                        <div class="icon fl">
                            <c:if test="${logiscs.logo == 'auto' }">
                                <img src="/image/pic_delivery01.png" alt=""/>
                            </c:if>
                            <c:if test="${logiscs.logo == 'manual' }">
                                <img src="/image/pic_delivery02.png" alt=""/>
                            </c:if>
                            <c:if test="${logiscs.logo == 'api' }">
                                <img src="/image/pic_delivery03.png" alt=""/>
                            </c:if>
                            <c:if test="${logiscs.logo == 'sign' }">
                                <img src="/image/pic_delivery04.png" alt=""/>
                            </c:if>
                        </div>
                        <div class="foo-info fl">
                            <p class="infos">${logiscs.info}</p>
                            <p class="time">
                                <fmt:formatDate value="${logiscs.datetime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </p>
                            <img src="/image/pic_textbox.png" alt=""/>
                        </div>
                        <div class="clearfix"></div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        </c:if>
        <c:if test="${waybill == null}">
                <h2 align="center">未创建单号的包裹！</h2>
        </c:if>
        <c:if test="${waybill != null and waybill.logisticsList.size()<=0}">
                <h2 align="center">已创建单号但还未进行包裹更新的包裹！</h2>
        </c:if>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="/js/jquery-1.11.3.min.js"></script>
</body>
</html>
