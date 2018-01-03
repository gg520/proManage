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
	 <link rel="icon" href="<%=path %>/img/system/favicon.ico"> 
        <title>登陆</title>

        <!-- CSS -->
        <link href="<%=path %>/js/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%=path %>/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
        <link href="<%=path %>/css/login/form-elements.css" rel="stylesheet">
        <link href="<%=path %>/css/login/style.css" rel="stylesheet">
  </head>
   <body class="login">
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">项目管理</span>
                <span class="icon-bar">/span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <img src="<%=path %>/img/system/favicon.jpg" class="navbar-brand" width="80" height="70">
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="#first"><a href="index.html">首页</a></li>
                <li><a href="${pageContext.request.contextPath }/about">关于</a></li>
                <li><a href="#contact">联系人</a></li>
                <li class="active"><a href="javascript:void(0)">登录</a></li>
              </ul>
              
            </div>
          </div>
        </nav>

      </div>
    </div>

        <!-- Top content -->
        <div class="top-content">
            
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>项目管理</strong> 登陆</h1>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                            <div class="form-top">
                                <div class="form-top-left">
                                    <h3>登陆我们的网站</h3>
                                    <p>请输入您的用户名和密码:</p>
                                </div>
                                <div class="form-top-right">
                                    <i class="fa fa-lock"></i>
                                </div>
                            </div>
                            <label id="label"><font color="#FF0000">${sessionScope.loginMassage }</font></label>
                            <%
                            	request.getSession().removeAttribute("loginMassage");
                            %>
                            
                            <div class="form-bottom">
                                <form role="form" action="${pageContext.request.contextPath }/login" method="post" class="login-form">
                                    <div class="form-group">
                                        <label class="sr-only" for="userid">账号</label>
                                        <input type="text" name="userid" placeholder="Username..." class="form-username form-control" id="userid" required="required">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="password">密码</label>
                                        <input type="password" name="password" placeholder="Password..." class="form-password form-control" id="password" required="required">
                                    </div>
                                    <button type="submit" class="btn">登录</button>
                                </form>
                                <span >
                                    <a href="javascript:void(0)">忘记密码</a>
                                </span>
                                <span>
                                    <a href="javascript:void(0)">免费注册</a>
                                </span>
                            </div>
                        </div>
                    </div>
                   
            </div>
            <jsp:include page="/MyFooter.jsp"></jsp:include>
        </div>


        <!-- Javascript -->
        <script src="<%=path %>/js/vendor/jquery.min.js"></script>
        <script src="<%=path %>/js/dist/js/bootstrap.min.js"></script>       
        <script src="<%=path %>/js/login/jquery.backstretch.min.js"></script>
        <%-- <script src="<%=path %>/js/login/scripts.js"></script> --%>
        <script type="text/javascript">
        jQuery(document).ready(function() {
        	
            /*
                Fullscreen background
            */
            $.backstretch("<%=path%>/img/1.jpg");
            
            /*
                Form validation
            */
            $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
            	$(this).removeClass('input-error');
            });
            
            $('.login-form').on('submit', function(e) {
            	
            	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
            		if( $(this).val() == "" ) {
            			e.preventDefault();
            			$(this).addClass('input-error');
            		}
            		else {
            			$(this).removeClass('input-error');
            		}
            	});
            	
            });
            
            
        });
        </script>
    </body>
 
</html>
