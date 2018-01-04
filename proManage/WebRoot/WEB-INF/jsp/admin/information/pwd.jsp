<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pwd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="<%=path %>/js/jquery-1.11.3.min.js">
	</script>
<script>
$("document").ready(function(){
	$("#password").focus(function(){
		$("#err").html("");
	});

	$("#newpwd2").blur(function(){
		if($("#newpwd").val()!=$("#newpwd2").val())
		{	
			$("#tis").html("2次输入不一致");
			$("#submit").attr("disabled", true);
		}
	});	
	$("#newpwd2").focus(function(){
		$("#tis").html("");
		$("#submit").attr("disabled", false);
	});
});
</script>
  </head>
  
  <body>
     <jsp:include page="/menus.jsp"></jsp:include>
     <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 class="text-center">
				修改密码
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
						<li >
							 <a href="${pageContext.request.contextPath }/admin/information/base">基本信息</a>
						</li>
						<li>
							 <a href="${pageContext.request.contextPath }/admin/information/pic">头像修改</a>
						</li>
						<li class="active">
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
					<form class="form-horizontal" role="form" action="${pageContext.request.contextPath }/admin/information/changepwdedit" method="POST">
					<div class="form-group">
						<label for="exampleInputPassword1">您的账号</label>
					 	<input type="text" required="" name="userid" readonly="readonly" value="${sessionScope.user.userId }" class="form-control" id="exampleInputPassword1" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">原始密码</label>
					 	<input type="password" required="" id="password" name="password" placeholder="请输入原始密码" class="form-control" id="exampleInputPassword1" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">新密码</label>
					 	<input type="password" id="newpwd" name="newpwd" required="" placeholder="请输入新密码" class="form-control" id="exampleInputPassword1" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">再次输入</label>
					 	<input type="password" id="newpwd2" name="newpwd2" onblur="onkeup()" required="" placeholder="请再次输入新密码" class="form-control" id="exampleInputPassword1" />
						<font color="red"><label for="exampleInputPassword1" id="tis"></label><br></font>				
					</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								 <button type="submit" id="submit" class="btn btn-default">更新</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-6 column">
				<label for="exampleInputPassword1" id="err"><font color="red">${pwdError }</font></label><br>				
				
				</div>
				</div>
				
			</div>
		</div>
	</div>
</div>
<jsp:include page="/MyFooter.jsp"></jsp:include>

</body>
</html>
