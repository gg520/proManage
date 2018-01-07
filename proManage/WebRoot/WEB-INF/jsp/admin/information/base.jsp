<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>My JSP 'base.jsp' starting page</title>
    
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
				修改基本信息
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
						<li class="active">
							 <a href="${pageContext.request.contextPath }/admin/information/base">基本信息</a>
						</li>
						<li>
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
					<form class="form-horizontal" role="form" action="${pageContext.request.contextPath }/admin/information/changeinforedit" method="POST">
					<div class="form-group">
						<label for="exampleInputPassword1">您的账号</label>
					 	<input type="text" name="userid" readonly="readonly" value="${tableUser.userid }" class="form-control" id="exampleInputPassword1" />
					</div>
						<div class="form-group">
						<label for="exampleInputPassword1">您的姓名</label>
					 	<input type="text" name="username" required="" minlength="2" maxlength="8" placeholder="请输入新的姓名" value="${tableuser.username }" class="form-control" id="exampleInputPassword1" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">您的简介</label>
					 	<textarea rows="6" cols="38"  placeholder="请输入新的介绍" >${tableuser.intro }</textarea>
					</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								 <button type="submit" class="btn btn-default">更新</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-6 column">
				<label for="exampleInputPassword1"><font color="red">${status }</font></label>
				<%
                  request.getSession().removeAttribute("status");
                %>
				</div>
				
			</div>
			
		</div>
		
	</div>
	
</div>
<jsp:include page="/MyFooter.jsp"></jsp:include>
<script src="<%=path %>/js/dist/js/bootstrap.min.js"></script>
	<script src="<%=path %>/js/ie10-viewport-bug-workaround.js"></script>
    <script src="<%=path %>/js/back/offcanvas.js"></script>
  </body>
</html>
