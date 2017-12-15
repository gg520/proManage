<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="icon" href="img/favicon.ico" type="image/x-icon">
	
    <!-- Bootstrap core CSS -->
    <link href="<%=path %>/js/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="<%=path %>/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=path %>/css/back/offcanvas.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="<%=path %>/js/ie-emulation-modes-warning.js"></script>
    
    <style type="text/css">
      a.user-profile{
        color: #5E6974 !important
      }
      .user-profile img{
        width:29;
        height: 29;
        border-radius: 50%;
        margin-right: 10px
      }
    </style>
  </head>

  <body>
  <nav class="navbar navbar-fixed-top navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">项目管理平台</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
           <a class="user-profile navbar-brand" href="#"><img src="<%=path %>/img/favicon.jpg" class="user-profile" style="margin-right: 0px"></a>

        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath }/index">首页</a></li>
            <li><a href="#about">关于</a></li>
            <li><a href="#contact">联系人</a></li>
          </ul>
          <form class="navbar-form navbar-left" action="#">
          <！-- 查找项目的名称 -->
            <input type="text" class="form-control" placeholder="Search Project" id="allSearch">
          </form>
          <ul class="nav navbar-nav navbar-right">
          <li><</li>
           <li class="dropdown">
                  <a href="#" class="user-profile dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    <img src="<%=path %>/img/admin/touxiang.jpg" class="user-profile" width="20" height="20"> <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">项目列表</a></li>
                    <li><a href="#">任务</a></li>
                    <li><a href="#">管理我的项目</a></li>
                    <li role="separator" class="divider"></li>
                    <li class="dropdown-header"></li>
                    <li><a href="#">帮助</a></li>
                    <li><a href="#">设置</a></li>
                    <li><a href="${pageContext.request.contextPath }/quit">退出</a></li>
                  </ul>
                </li> 
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
  </body>
</html>
