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
    
    <title>项目明细</title>
    
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
                <h2 class="panel-title">项目详细信息</h2>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>合作伙伴 <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                     
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="row">
       
                  <div class="x_content">

                    <div class="col-md-9 col-sm-9 col-xs-12">

                      <ul class="stats-overview">
                        <li>
                          <span class="name"> Estimated budget </span>
                          <span class="value text-success"> 2300 </span>
                        </li>
                        <li>
                          <span class="name"> Total amount spent </span>
                          <span class="value text-success"> 2000 </span>
                        </li>
                        <li class="hidden-phone">
                          <span class="name"> Estimated project duration </span>
                          <span class="value text-success"> 20 </span>
                        </li>
                      </ul>
                      <br />

                      <div id="mainb" style="height:350px;"></div>

                      <div>

                        <h4>近期活动</h4>

                        <!-- end of user messages -->
                        <ul class="messages">
                        <c:forEach items="${userMassages }" var="userMassage">
                        
                        <li>
                            <img src="<%=path %>/img/admin/${userMassage.userPhoto}" class="avatar" alt="Avatar">
                            <div class="message_date">
                              <h3 class="date text-info">24</h3>
                              <p class="month">May</p>
                            </div>
                            <div class="message_wrapper">
                              <h4 class="heading">${userMassage.userName}</h4>
                              <blockquote class="message">${userMassage.userIntro}</blockquote>
                              <br />
                              <p class="url">
                                <span class="fs1 text-info" aria-hidden="true" data-icon=""></span>
                                <c:choose>
                                <c:when test="${fn:length(userMassage.filePath)<=0}">
                                <a href="#"><i class="fa fa-paperclip"></i> 
                                ${userMassage.filePath}
                                 </a>
                                </c:when>
                                <c:otherwise>
                               	还没有提交数据
                                </c:otherwise>
                                </c:choose>
                              </p>
                            </div>
                          </li>
                        </c:forEach>
                        </ul>
                        <!-- end of user messages -->


                      </div>


                    </div>

                    <!-- start project-detail sidebar -->
                    <div class="col-md-3 col-sm-3 col-xs-12">

                      <section class="panel">

                        <div class="x_title">
                          <h2>项目介绍</h2>
                          <div class="clearfix"></div>
                        </div>
                        <div class="panel-body">
                          <h3 class="green"><i class="fa fa-paint-brush"></i> ${tableProject.projectname }</h3>

                          <p>${tableProject.intro }</p>
                          <br />

                          <div class="project_detail">

                            <p class="title">项目创建者</p>
                            <p>Deveint Inc</p>
                            <p class="title">项目经理</p>
                            <p>Tony Chicken</p>
                          </div>

                          <br />
                          <h5>项目最新文件</h5>
                          <ul class="list-unstyled project_files">
                            <li><a href=""><i class="fa fa-file-word-o"></i> Functional-requirements.docx</a>
                            </li>
                            <li><a href=""><i class="fa fa-file-pdf-o"></i> UAT.pdf</a>
                            </li>
                            <li><a href=""><i class="fa fa-mail-forward"></i> Email-from-flatbal.mln</a>
                            </li>
                            <li><a href=""><i class="fa fa-picture-o"></i> Logo.png</a>
                            </li>
                            <li><a href=""><i class="fa fa-file-word-o"></i> Contract-10_12_2014.docx</a>
                            </li>
                          </ul>
                          <br />

                          <!-- <div class="text-center mtop20">
                            <a href="#" class="btn btn-sm btn-primary">Add files</a>
                            <a href="#" class="btn btn-sm btn-warning">Report contact</a>
                          </div> -->
                        </div>

                      </section>

                    </div>
                    <!-- end project-detail sidebar -->

                  </div>
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
