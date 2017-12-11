<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
                          <th>创建人</th>
                          <th>项目进度</th>
                          <th>权限</th>
                          <th style="width: 20%">编辑</th>
                        </tr>
                      </thead>


                      <tbody id="mytbody">
                      <c:forEach items="${projectList }" var="tableProjectCustom" >
                        <tr>
                        <td>#</td>
                          <td>
                            <a title="${tableProjectCustom.proIntro }">${tableProjectCustom.proTitle }</a>
                            <br />
                            <small>创建时间：<fmt:formatDate value="${tableProjectCustom.createDate }" pattern="yyyy-MM-dd"/></small>
                          </td>
                          <td>
                            <ul class="list-inline">
                              <li>
                                <img src="<%=path %>/img/admin/${tableProjectCustom.createPhoto }" class="avatar" alt="Avatar" title="${tableProjectCustom.createUser }">
                              </li>
                              <%-- <li>
                                <img src="<%=path %>/img/touxiang.jpg" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="<%=path %>/img/touxiang.jpg" class="avatar" alt="Avatar">
                              </li>
                              <li>
                                <img src="<%=path %>/img/touxiang.jpg" class="avatar" alt="Avatar">
                              </li> --%>
                            </ul>
                          </td>
                         
                           <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="${tableProjectCustom.rate }"></div>
                            </div>
                            <small>${tableProjectCustom.proRate } </small>
                          </td>
                          <td>
                          ${tableProjectCustom.jur }
                           <!--  <button type="button" class="btn btn-success btn-xs">成功</button> -->
                          </td>
                          <td>
                          <c:choose>
                          	<c:when test="${tableProjectCustom.jurId==2 }">
                          	 <a href="${pageContext.request.contextPath }/admin/project/projectDetail/${tableProjectCustom.proId}" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> 视图 </a>
                            <a href="${pageContext.request.contextPath }/admin/project/editPro/${tableProjectCustom.proId}" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 编辑 </a>
                          	</c:when>
                          	<c:when test="${tableProjectCustom.jurId==3 }">
                          	<a href="${pageContext.request.contextPath }/admin/project/projectDetail/${tableProjectCustom.proId}" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> 视图 </a>
                            <a href="${pageContext.request.contextPath }/admin/project/editPro/${tableProjectCustom.proId}" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 编辑 </a>
                          	<a href="javascript:dePro('${tableProjectCustom.proId}')" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 删除 </a>
                          	</c:when>
                          	<c:otherwise>
                          	<a href="${pageContext.request.contextPath }/admin/project/projectDetail/${tableProjectCustom.proId}" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> 视图 </a>
                            <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 任务 </a>
                          	</c:otherwise>
                          </c:choose>
                           
                          </td>
                        </tr>
                      </c:forEach>
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
  <script type="text/javascript">
  function dePro(proId){
	  comm={};
	  comm.projectid=proId;
	  $.ajax({
  		type:"POST",
  		url:"<%=path%>/admin/project/deProject",//获取阶段
  		contentType:"application/json;charset=utf-8",
   		data:JSON.stringify(comm),
  		dataType:"json",
  		error:function(){
  			alert("删除失败！");
  		},
  		success:function(data){
  			if(data>0){
  				alert("删除成功！");
  				window.location="<%=path%>/admin/project/proList";
  			}else{
  				alert("删除失败！");
  			}
  		}
	  });
  }
  </script>
    <script src="<%=path%>/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=path%>/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="<%=path%>/vendors/iCheck/icheck.min.js"></script>
    
<!-- FastClick -->
    <script src="<%=path%>/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<%=path%>/vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="<%=path%>/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="<%=path%>/build/js/custom.min.js"></script>
  </body>
</html>
