<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="/css/common.css"/>
    <link rel="stylesheet" href="/css/index.css"/>
  <style>
    tr,td{
      border: 1px solid #bfbfbf;;
      text-align: center;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="logo">
    <div class="icon float">
      <a href="/index.jsp"><img src="/image/pic_logo.png" alt="log"/></a>
    </div>
    <div class="content float">
      <img src="/image/pic_zhongyaotongzhi.png" alt="" width="156" height="28"/>
      <div class="focus-banners">
        <ul class="focus-banner-lists"></ul>
        <a href="javascript:void(0);"  class="focus-handles next-imgs"></a>
        <span id="math" class="math"></span>
        <a href="javascript:void(0);"  class="focus-handles prev-imgs"></a>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<div class="nav">
  <ul class="info">
    <li class="title float" style="margin-left: 0;"><a href="/index.jsp" style="color: #ff6803">首页</a></li>
    <li class="title float"><a href="/idcardupload.jsp">上传身份证</a></li>
    <li class="title float"><a href="/notice/view?types=abouttaixing">关于泰兴</a></li>
    <li class="title float"><a href="/notice/view?types=contactus">联系我们</a></li>
    <li class="title float"><a href="/notice/view?types=embargo">禁运物品</a></li>
    <li class="title float"><a href="/notice/view?types=settlement">理赔标准</a></li>
    <li class="title float"><a href="/message.jsp">通知公告</a></li>
    <div class="clearfix"></div>
  </ul>
</div>
<script src="/js/jquery-2.1.4.min.js"></script>
<script src="/js/header.js"></script>
</body>
</html>
