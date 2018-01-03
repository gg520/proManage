<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pie.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <jsp:include page="/menus.jsp"></jsp:include>
     <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 class="text-center">
				修改头像
			</h3>
		</div>
		<div class="col-md-12 column">
			<h3 class="text-center">
			</h3>
		</div>
		<div class="col-md-12 column">
			<h3 class="text-center">
			</h3>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-6 column">
			<div class="row clearfix">
				<div class="col-md-4 column">
				</div>
				<div class="col-md-4 column">
					<ul class="nav nav-pills nav-stacked">
						<li>
							 <a href="${pageContext.request.contextPath }/admin/information/base">基本信息</a>
						</li>
						<li  class="active">
							 <a href="${pageContext.request.contextPath }/admin/information/pic">头像修改</a>
						</li>
						<li>
							 <a href="${pageContext.request.contextPath }/admin/information/pwd">密码修改</a>
						</li>
						
					</ul>
				</div>
				<div class="col-md-4 column">
				</div>
			</div>
		</div>
		<div class="col-md-6 column">
			<div class="row clearfix">
				<div class="col-md-6 column">
					<form class="form-horizontal" role="form" action="${pageContext.request.contextPath }/admin/information/changepicedit"  enctype="multipart/form-data" method="POST">
					<div class="form-group">
						<label for="exampleInputPassword1">当前头像</label><br>
						<div></div>					
					 	<img alt="用户头像" width="240" height="240" src="${sessionScope.user.userPhoto }" />
					 	<input type="file" name="photo">
					</div>  
						
					
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								 <button type="submit" class="btn btn-default">更新</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-6 column">
				<label for="exampleInputPassword1"><font color="red">${uploadError }</font></label><br>
				<%
                            	request.getSession().removeAttribute("uploadError");
                  %>
				</div>
				
			</div>
		</div>
	</div>
</div>

  </body>
</html>
