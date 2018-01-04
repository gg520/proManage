<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'step2.jsp' starting page</title>
    
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
				重置密码
			</h3>
		</div>
	</div>
	<div class="row clearfix">
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
				<div class="col-md-6 column">
					<ul class="nav nav-stacked nav-pills">
						<li >
							 <a >确认信息</a>
						</li>
						<li class="active">
							 <a >重置密码</a>
						</li>
											
					</ul>
				</div>
				<div class="col-md-2 column">
				</div>
			</div>
		</div>
		<div class="col-md-6 column">
			<div class="row clearfix">
				<div class="col-md-6 column">
					<form role="form" method="POST" action="${pageContext.request.contextPath }/repwd">
						<div class="form-group">
							 <label for="exampleInputEmail1">您的账号 </label>
							 <input type="text" name="userid" value="${userid }" readonly="readonly" class="form-control" id="exampleInputEmail1" />
						</div>
						<div class="form-group">
							 <label for="exampleInputPassword1">新的密码</label>
							 <input type="password" class="form-control" name="password" required="" minlength="6" placeholder="请输入新的密码" maxlength="16" id="exampleInputPassword1" />
						</div>
						
					 <button type="submit" class="btn btn-default">提交</button>
					</form>
				</div>
				<div class="col-md-6 column">
				<label for="exampleInputPassword1"><font color="red">${reset }</font></label>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/MyFooter.jsp"></jsp:include>
  </body>
</html>
