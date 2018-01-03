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
    
    <title>My JSP 'enrol.jsp' starting page</title>
    
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
			<h3 class="text-center muted">
				注册账号.
			</h3>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 class="text-center muted">
				
			</h3>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-4 column">
			
		</div>
		<div class="col-md-4 column">
			<form class="form-horizontal" role="form" method="POST" action="${pageContext.request.contextPath }/enroledit">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">账号</label>
					<div class="col-sm-10">
						<input type="text" required="" placeholder="请设置登陆的账号" name="userid" minlength="8" maxlength="32" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3"  class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input type="password" name="password" placeholder="请设置登陆的密码" class="form-control" id="inputPassword3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3"  class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-10">
						<input type="password" name="username" required="" placeholder="请输入您的姓名" minlength="2" maxlength="8" class="form-control" id="inputPassword3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3"   class="col-sm-2 control-label">简介</label>
					<div class="col-sm-10">
						<textarea rows="6" name="userintro" cols="38" placeholder="输入您的信息，让更多人认识你"></textarea>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-default">立即注册</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-4 column">
		<label for="exampleInputPassword1"><font color="red">${enrol }</font></label>
						<%
                            	request.removeAttribute("enrol");
                            %>
         <c:forEach items="${errList }" var="err">
         <label for="exampleInputPassword1"><font color="red">${err }</font></label><br>
         </c:forEach>
		<%
                            	request.removeAttribute("errList");
         %>
		</div>
	</div>
</div>
  </body>
</html>
