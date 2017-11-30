<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    <jsp:include page="/menus.jsp"></jsp:include> <br> 
     <!-- jQuery -->
    <script src="<%=path%>/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=path%>/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="<%=path%>/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<%=path%>/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="<%=path%>/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="<%=path%>/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="<%=path%>/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="<%=path%>/vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="<%=path%>/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="<%=path%>/vendors/Flot/jquery.flot.js"></script>
    <script src="<%=path%>/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="<%=path%>/vendors/Flot/jquery.flot.time.js"></script>
    <script src="<%=path%>/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="<%=path%>/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="<%=path%>/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="<%=path%>/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="<%=path%>/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="<%=path%>/vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="<%=path%>/vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="<%=path%>/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="<%=path%>/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="<%=path%>/vendors/moment/min/moment.min.js"></script>
    <script src="<%=path%>/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="<%=path%>/build/js/custom.min.js"></script>
          
    <script src="<%=path %>/js/scroll.js" type="text/javascript"></script>
  </body>
</html>
