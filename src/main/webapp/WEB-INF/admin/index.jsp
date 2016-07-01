<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>泰兴物流后台管理系统</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <%--<style type="text/css">
        .ux-MultiSelect-icon { width:16px; height:16px; float:left; background-position: -1px -1px ! important; background-repeat:no-repeat ! important; }
        .ux-MultiSelect-icon-checked { background: transparent url(''/images/default/menu/checked.gif''; }
        .ux-MultiSelect-icon-unchecked { background: transparent url(/images/default/menu/unchecked.gif); }
    </style>--%>
    <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="${ctx}/Ext/packages/ext-theme-crisp/build/resources/ext-theme-crisp-all.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/font-awesome.css">

</head>

<body>
</body>
<script type="text/javascript" src="${ctx}/Ext/ext-all.js"></script>
<script type="text/javascript" src="${ctx}/Ext/packages/ext-locale/build/ext-locale-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/Ext/ux/uploadPanel/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${ctx}/Ext/vtype/vtype.js"></script>
<script type="text/javascript" src="${ctx}/app/chuandu/util/CommonMsg.js"></script>
<script type="text/javascript" src="${ctx}/app/chuandu/util/CommonUtil.js"></script>
<script type="text/javascript" src="${ctx}/app/chuandu/util/ExtCommon.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="${ctx}/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    Ext.require("app.chuandu.region.Main");
    Ext.onReady(function() {
        Ext.tip.QuickTipManager.init();
        Ext.create('ChuanduViewPort');
    });
</script>
</html>
