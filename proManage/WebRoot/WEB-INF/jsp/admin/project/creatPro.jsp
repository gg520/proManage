<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>创建项目</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- <link rel="icon" href="img/favicon.ico" type="image/x-icon"> -->

  </head>
  
  <body >
   <jsp:include page="/menus.jsp"></jsp:include> <br>
   <script type="text/javascript">
   $(document).ready(function(){
	  //查看是否有问题
	  var inform="${sessionScope.createProInform }";
	  if(inform!=null&&inform.length>0){
		  var row="<div class='alert alert-danger' role='alert' id='inform_i'>"+
		  inform+
	        "<button type='button' class='close' aria-hidden='true' onclick='qxon()'>&times;</button>"+
	    "</div>";
	    $("#inform").html(row);
	  }
   });
   function qxon(){
	   $("#inform").html("");
   }
   </script>
  <div class="container">
   <div class="jumbotron">
        <h1>创建项目</h1>
            <p>项目保存项目操作中所有的文件，包括修订历史记录。</p>
    </div>
    <div class="row">
        <div class="col-xs-12">
	        <div class="panel panel-info">
				<div class="panel-heading">
					<h3 id="section-1" class="panel-title">项目列表</h3>
				</div>
				<div class="panel-body">
				 
					<!-- 项目名称 -->
					<form role="form" action="${pageContext.request.contextPath }/admin/project/creatPro" method="post">
						<br>
						<div id="inform"></div>
							
                            <%
                            	request.getSession().removeAttribute("createProInform");
                            %>
                            
                        <div class="form-group">
							<label class="col-sm-2 control-label" for="proTitle">
								项目名称
							</label>
							<div class="col-lg-3">
								<input type="text" class="form-control" id="proTitle" name="proTitle" required="required">
							</div>
						</div>
						<br>
						<br>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="proIntro">
								说明（可选）
							</label>
							<div class="col-lg-4">
								<input type="text" class="form-control" id="proIntro" name="proIntro">
							</div>
						</div>
						<br>
						<br>
						<div class="form-group">
							<button type="submit" class="btn btn-success">创建项目</button>
						</div>
						
					</form>
					
				</div>
			</div>
            
        </div>
    </div>
	<div align="right">
		<jsp:include page="/MyFooter.jsp"></jsp:include>
	</div>
    </div><!--/.container-->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <%-- <script src="<%=path %>/js/vendor/jquery.min.js"></script> --%>
    <script src="<%=path %>/js/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<%=path %>/js/ie10-viewport-bug-workaround.js"></script>
    <script src="<%=path %>/js/back/offcanvas.js"></script>
  </body>
</html>
