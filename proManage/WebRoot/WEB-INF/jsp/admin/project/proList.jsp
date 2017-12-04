<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>项目列表</title>
    
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
   <jsp:include page="/menus.jsp"></jsp:include> <br>
       
       
       
       <!-- page content -->
        <div class="right_col" role="main">
          <div style="height:40px"></div>
          <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title">项目管理</h2>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <di v class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>项目列表 <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                     <a href="${pageContext.request.contextPath }/admin/project/creatPro"><button type="button" class="btn btn btn-danger" >创建项目</button></a>&nbsp;&nbsp;&nbsp;
                     
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                   
                    <table class="table table-striped projects">
                      <thead>
                        <tr>
                        <th style="width: 1%">#</th>
                          <th style="width: 20%">项目名</th>
                          <th>团队成员</th>
                          <th>项目进度</th>
                          <th>状态</th>
                          <th style="width: 20%">编辑</th>
                        </tr>
                      </thead>


                      <tbody id="mytbody">
                      
                        <tr>
                        <td>#</td>
                          <td>
                            <a>项目管理系统</a>
                            <br />
                            <small>创建时间：2017-11-11</small>
                          </td>
                          <td>
                            <ul class="list-inline">
                              <li>
                                <img src="<%=path %>/img/touxiang.jpg" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="<%=path %>/img/touxiang.jpg" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="<%=path %>/img/touxiang.jpg" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="<%=path %>/img/touxiang.jpg" class="avatar" alt="Avatar">
                              </li>
                            </ul>
                          </td>
                          <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
                            </div>
                            <small>57% </small>
                          </td>
                          <td>
                            <button type="button" class="btn btn-success btn-xs">成功</button>
                          </td>
                          <td>
                            <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> 视图 </a>
                            <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 编辑 </a>
                            <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 删除 </a>
                          </td>
                        </tr>
                      
                     <%--  <c:forEach items="${tableProjectCustoms }" var="tableProjectCustom" >
                       
                        <tr>
                       
                       <td><a  >${tableProjectCustom.projectname }</a></td>
                         
                          <td>${tableProjectCustom.createUser }</td>
                           <td>${tableProjectCustom.createtime }</td>
                         
                          <td>${tableProjectCustom.jur }</td>
                          
                           <td>${tableProjectCustom.proRate }</td>
                          
                          <td>${tableProjectCustom.proIntro }</td>
                        </tr>
                        </c:forEach> --%>
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          
        
        <!-- /page content -->

        <!-- footer content -->
         <jsp:include page="/MyFooter.jsp"></jsp:include>
        <!-- /footer content -->
      </div>
    </div>
  <!-- jQuery -->

  
    <!-- FastClick -->
    <script src="<%=path%>//vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<%=path%>/vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="<%=path%>/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>

    <script src="<%=path%>/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=path%>/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="<%=path%>/vendors/iCheck/icheck.min.js"></script>
    

    <!-- Custom Theme Scripts -->
    <script src="<%=path%>/build/js/custom.min.js"></script>
  </body>
</html>
