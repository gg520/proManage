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
         //任务生成id信息的数据
         var task_num_id=20150804;
         //添加用户的id
         var body_num_id=20171206;
         $(document).ready(function(){
        	
        	 $.ajax({
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
        	 });
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
                       <div class="form-group">
                       <label class='control-label col-md-3 col-sm-3 col-xs-12'> </label>
                       <div align="left"><font color='#FF0000'>根据账号查询</font></div>
                       </div>
                       <label id="user_rate_task"  class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">项目经理：
                       </label>
                      <div class="col-md-6 col-sm-6 col-xs-12" >
                       <!-- <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">进度： </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control" id="proRate" name="proRate">
                        
                        </select>
                        </div>
                       </div> -->
                        <!-- 保存任务 -->
                       <!--  <input type="hidden" id="doc_teskList" name="doc_teskList">
                        <input type="hidden" id="code_teskList" name="code_teskList"> -->
                        <!-- 保存用户 -->
                        <input type="hidden" id="userList" name="userList">
                       <div id="task" >
                        
                       </div>
                       <!-- 人员添加 -->
						<!-- <div class='form-group'> -->
			             
				           <!-- <label class='control-label col-md-3 col-sm-3 col-xs-12'>项目经理： </label> -->
				            <div class='col-md-6 col-sm-6 col-xs-12'>
				           		<div class='input-group'>
				       			 <input type='text' class='form-control' id='bodyByOne'>
				       			 <span class='input-group-btn'>
				           			 <button class='btn btn-default' type='button' onclick='addBody()'>添加</button>
				        		 </span>
				    			</div><!-- /input-group -->
				            </div>
				            <font color='#FF0000' hidden='hidden' id='bodyError'>异常原因</font>
			            <!-- </div>  -->
                       
                      </div>
                       
                       </div>
                       <div id="task_user">
                       </div>
                       <!-- <span class="btn btn-default" data-toggle="tooltip"  title="默认的 Tooltip" id="de"><i class="fa fa-close" onclick="deTask()"  title="删除"></i> 默认hjghjghjghjghjghjghj的 Tooltip</span> -->
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" align="center">
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
    
    //删除用户
    function deBody(bodyId){
    	var userList=$("#userList").val();
    	var body=$("#"+bodyId).text();
    	body=body.replace("用户：","").trim();
    	if(userList.indexOf(body+";")>=0){
    		userList=userList.replace(body+";","").trim();
    		$("#userList").val(userList);
    		$("#"+bodyId).hide();
    	}else{
    		alert("删除失败");
    	}
    	
    }
    
   //添加用户
   function addBody(){
	   var body=$("#bodyByOne").val();
	   body=body.trim();
	   var userOne="${sessionScope.user.userId}";
	   /* alert(userOne); */
	   if(body==userOne){
		   $("#bodyError").text("用户已存在");
		   $("#bodyError").show();
		   return false;
	   }
	   $("#bodyError").hide();
	   if(body!=null&&body.length>0){
		   var comm={};
		   comm.userId=body;
		   //请求后台验证是否有这个用户
		   $.ajax({
       		type:"POST",
       		url:"<%=path%>/admin/user/verifyUserId",//获取阶段
       		contentType:"application/json;charset=utf-8",
       		data:JSON.stringify(comm),
       		dataType:"json",
       		error:function(){
       			alert("数据加载失败，请刷新重试！");
       		},
       		success:function(data){
       			if(data>0){
       				//用户统计界面显示
       				body_num_id++;
       				
       				//bengin
       				var userList=$("#userList").val();
        			if(userList!=null&&userList.indexOf(body+";")>=0){
        				$("#bodyError").text("用户已存在");
        				$("#bodyError").show();
        				return false;
        			}
        			if(userList!=null&&userList.length>0){
        				userList=userList+body+";";
        			}else{
        				userList=body+";";
        			}
        			
        			$("#userList").val(userList);
       				//end
       				
       				var row="<span class='btn btn-default' data-toggle='tooltip'  title='"+body+"' id='"+body_num_id+"'>"+
       		    	"<i class='fa fa-close' onclick='deBody("+body_num_id+")'  title='删除'></i> 用户："+body+"</span>";
       		    	$("#task_user").append(row);
       		    	$("#bodyByOne").val("");
       				
       			}else{
       				$("#bodyError").text("用户不存在");
       				$("#bodyError").show();
       			}
       		}
       	 });
	   }else{
		   $("#bodyError").text("输入内容不能为空");
		   $("#bodyError").show();
		   return false;
	   }
   }
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
