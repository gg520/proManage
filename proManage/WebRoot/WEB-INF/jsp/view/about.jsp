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
    
    <title>关于项目管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" href="<%=path %>/img/favicon.ico"> 
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- Bootstrap core CSS -->
    <link href="<%=path %>/js/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="<%=path %>/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="<%=path %>/js/ie-emulation-modes-warning.js"></script>
    <!-- Custom styles for this template -->
    <link href="<%=path %>/css/index/carousel.css" rel="stylesheet">
	

  </head>
  
  <body>
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar">/span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>

              <img src="<%=path %>/img/favicon.jpg" class="navbar-brand" width="65" height="65">
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="active"><a href="${pageContext.request.contextPath }/index">首页</a></li>
                <li><a href="${pageContext.request.contextPath }/about"">关于</a></li>
                <li><a href="javascript:void(0)">联系人</a></li>
                <c:choose>
              	<c:when test="${sessionScope.user!=null }">
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的 <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath }/admin/project/proList">项目列表</a></li>
                    <li><a href="javascript:void(0)">任务</a></li>
                    <li><a href="javascript:void(0)">管理我的项目</a></li>
                    <li role="separator" class="divider"></li>
                    <li class="dropdown-header"></li>
                     <li><a href="javascript:void(0)"></a></li>
                    <li><a href="${pageContext.request.contextPath }/quit">退出</a></li>
                   
                  </ul>
                </li> 
                </c:when>
                <c:otherwise>
                <li>
                  <a href="${pageContext.request.contextPath }/login"><font color="">登陆</font></a>
                </li>
                </c:otherwise>
                </c:choose>
                

              </ul>
              
            </div>
          </div>
        </nav>

      </div>
    </div>
    <!-- Carousel
    ================================================== -->
    
     <!-- Placed at the end of the document so the pages load faster -->
    <script src="<%=path %>/js/vendor/jquery.min.js"></script>
    <script src="<%=path %>/js/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<%=path %>/js/ie10-viewport-bug-workaround.js"></script>
    <script src="<%=path %>/js/back/offcanvas.js"></script>
    
  </body>
</html>
