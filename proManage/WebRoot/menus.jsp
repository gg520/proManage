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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <!-- Bootstrap -->
    <link href="<%=path%>/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<%=path%>/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="<%=path%>/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="<%=path%>/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="<%=path%>/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="<%=path%>/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="<%=path%>/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<%=path%>/build/css/custom.min.css" rel="stylesheet">
    <!-- bootstrap-datetimepicker -->
    <link href="<%=path %>/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
    
    <link href="<%=path %>/vendors/cropper/dist/cropper.min.css" rel="stylesheet">
  </head>
  
  <body class="nav-md">
  
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="${pageContext.request.contextPath }/index" class="site_title"><i class="fa fa-paw"></i> <span>项目管理系统</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="<%=path %>/img/touxiang.jpg" alt="头像" class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>John Doe</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>操作</h3>
                <ul class="nav side-menu">
                  <li><a href="${pageContext.request.contextPath }/index"><i class="fa fa-home"></i> 首页 </a>
                  </li>
                 </ul>
              </div>
              <div class="menu_section">
                <h3>管理</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-sitemap"></i> 项目管理 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="#level1_1">参与的项目</a>
                        <!-- <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="javascript:void(0)">Level Two</a>
                            </li>
                            <li><a href="javascript:void(0)">Level Two</a>
                            </li>
                            
                          </ul>
                        </li> -->
                        <li><a href="javascript:void(0)">Level One</a>
                        </li>
                    </ul>
                  </li>                  
                 <li><a><i class="fa fa-home"></i> 任务管理<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="javascript:void(0)">首页1</a></li>
                      <li><a href="javascript:void(0)">首页2</a></li>
                    
                    </ul>
                  </li>
                  <li><a><i class="fa fa-home"></i> 人员管理<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="javascript:void(0)">首页1</a></li>
                      <li><a href="javascript:void(0)">首页2</a></li>
                    
                    </ul>
                  </li>
                  <li><a><i class="fa fa-home"></i> 文件管理<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="javascript:void(0)">首页1</a></li>
                      <li><a href="javascript:void(0)">首页2</a></li>
                    
                    </ul>
                  </li>
                  
                  <li><a><i class="fa fa-home"></i> 进度管理<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="javascript:void(0)">首页1</a></li>
                      <li><a href="javascript:void(0)">首页2</a></li>
                    
                    </ul>
                  </li>
                  <li><a><i class="fa fa-home"></i> 个人管理<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="javascript:void(0)">首页1</a></li>
                      <li><a href="javascript:void(0)">首页2</a></li>
                    
                    </ul>
                  </li>
                  
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <!-- /菜单下面的按钮 -->
            <div class="sidebar-footer hidden-small">
              
              <a data-toggle="tooltip" style="width: 100%" data-placement="top" title="退出" href="javascript:void(0)">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /菜单下面的按钮 -->
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="<%=path %>/img/touxiang.jpg" alt="">John Doe
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="${pageContext.request.contextPath }/login"><i class="fa fa-sign-out pull-right"></i> 退出</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">1</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="<%=path %>/img/touxiang.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    
                    
                   
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>查找更多</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->


              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

       
      </div>
    </div>
	
  </body>
</html>
