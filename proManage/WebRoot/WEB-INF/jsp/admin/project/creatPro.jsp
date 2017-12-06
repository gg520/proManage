<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>创建项目</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- <link rel="icon" href="img/favicon.ico" type="image/x-icon"> -->

  </head>
  
  <body>
    <jsp:include page="/menus.jsp"></jsp:include> <br>
         <script type="text/javascript">
         $(document).ready(function(){
        	 alert("dfsdfsdf");
         });
         $(document).ready(function(){
        	 alert("dasd");
        	<%--  $.ajax({
        		type:"POST",
        		url:"<%=path%>/admin/project/proRateList",//获取阶段
        		dataType:"json",
        		error:function(){
        			alert("数据加载失败，请刷新重试！");
        		},
        		success:function(data){
        			$(data).each(function(index,item){
        				var row="<option value='"+item.rateid+"'>"+item.ratename+"</option>";
        				$("#proRate").append(row);
        			});
        		}
        	 }); --%>
         });
         </script>
        <!-- page content -->
        <div class="right_col" role="main">
          <div style="height:40px"></div>
          <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title">项目管理</h2>
            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>创建项目</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      
                   	<button type="button" class="btn btn btn-primary" onclick="javascript:history.back(-1)">返回</button>&nbsp;&nbsp;&nbsp;
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form class="form-horizontal form-label-left" novalidate action="${pageContext.request.contextPath }/admin/project/creatPro" method="post" >

                      <div align="center">
                      <label id="label"><font color="#FF0000">${sessionScope.error }</font></label>
						 <%
						 request.getSession().removeAttribute("error");
						 %>
						 <label id="label"><font color="#FF0000">${sessionScope.success }</font></label>
						 <%
						 request.getSession().removeAttribute("success");
						 %>
						 </div>
					<div class="item form-group">
                        <label for="title" class="control-label col-md-3">项目名称：</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="title" type="text" name="proTitle" data-validate-length="0,40" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="content" class="control-label col-md-3 col-sm-3 col-xs-12">项目说明：</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <textarea id="content" required="required" class="form-control" name="proIntro" data-parsley-trigger="keyup" 
                          data-parsley-minlength="20" data-parsley-maxlength="100"
                            data-parsley-validation-threshold="10"></textarea>
                        </div>
                      </div>
                      
                      <!-- 添加阶段任务完成人、以及任务，可以选择
                      
                      1. 阶段显示：
                       -->
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">进度： </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control" id="proRate" name="proRate">
                        <option value="0">初始阶段</option>
                        </select>
                        </div>
                       </div>
                       <!-- 进度选择后，需要安排任务，以及添加项目成员 
                       2. 添加成员
                       3. 添加任务
                       -->
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-success">创建</button>
                        </div>
                      </div>

                    </form>
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
    
    <script type="text/javascript">
    //进度选择事件
    $("select#proRate").change(function(){
    	var proRate=$(this).val();
    	if(proRate==0||proRate==4){
    		//刚创建阶段或者是已经完成
    		//不添加人员和任务
    		alert("sdfdsf");
    	}else{
    		//选择了阶段，添加人员和任务
    		
    	}
    });
    
    </script>
    
       <!-- jQuery -->
    <script src="<%=path%>/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=path%>/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="<%=path%>/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<%=path%>/vendors/nprogress/nprogress.js"></script>
    <!-- jQuery Smart Wizard -->
    <script src="<%=path%>/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="<%=path%>/build/js/custom.min.js"></script>
    <!-- validator -->
    <script src="<%=path%>/vendors/validator/validator.js"></script>
    
    
  </body>
</html>
