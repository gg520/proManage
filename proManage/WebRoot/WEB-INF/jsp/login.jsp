<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="icon" href="img/favicon.ico" type="image/x-icon">

<!-- Bootstrap -->
    <link href="<%=path%>/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<%=path%>/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="<%=path%>/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="<%=path%>/vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<%=path%>/build/css/custom.min.css" rel="stylesheet">
  </head>
   <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form action="${pageContext.request.contextPath }/login" method="post">
              <h1>登录</h1>
              <div>
              <%-- <%=basePath%><br> --%>
              <%-- <%=path%>/vendors/animate.css/animate.min.css<br> --%>
             <label id="label" ><font color="#FF0000">${sessionScope.loginError }</font></label>
				 <%
				   request.getSession().removeAttribute("loginError");
				 %>
				 </div>
				 <div>
                <input type="text" class="form-control" placeholder="Username" required="" name="userid"/>
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required="" name="password"/>
              </div>
              <div>
               <input type="submit" class="btn btn-default submit"value="登录"/>
               <input type="button" class="btn btn-default submit"value="注册"/>
               <!-- 功能未实现 -->
                <a class="reset_pass" href="#">忘记密码？</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
               

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> 项目管理和版本控制平台</h1>
                  <p>Copyright 中原工学院2017年实训团队 </p>
                </div>
              </div>
            </form>
          </section>
        </div>

      </div>
    </div>
  </body>
 
</html>
