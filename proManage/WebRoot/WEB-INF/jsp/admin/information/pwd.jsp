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
					 	<input type="password" required=""  name="password" placeholder="请输入原始密码" class="form-control" id="exampleInputPassword1" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">新密码</label>
					 	<input type="password" name="newpwd" required="" placeholder="请输入新密码" class="form-control" id="exampleInputPassword1" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">再次输入</label>
					 	<input type="password" name="newpwd2"  required="" placeholder="请再次输入新密码" class="form-control" id="exampleInputPassword1" />
					</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								 <button type="submit" class="btn btn-default">更新</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-6 column">
				<label for="exampleInputPassword1"><font color="red">${pwdError }</font></label><br>
				<%
                    request.getSession().removeAttribute("pwdError");
                  %>
				</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

</body>
</html>
