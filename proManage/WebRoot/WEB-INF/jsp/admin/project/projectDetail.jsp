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

  </head>
  
  <body>
  <jsp:include page="/menus.jsp"></jsp:include> <br>
  <script type="text/javascript">
  
  $(document).ready(function(){//模态框动态填充数据
		$("#myfile_upload").on("show.bs.modal", function (event) {
	  			var button = $(event.relatedTarget);
	  			var myfile_taskid = button.data("myfile_taskid");
	  			var taskname = button.data("myfile_taskname");
	  			
	  			var modal = $(this);
	  			modal.find("#myfile_taskid").val(myfile_taskid);
	  			modal.find("#myfile_taskname").val(taskname);
		});
		$("#taskfile_down").on("show.bs.modal", function (event) {
	  			var button = $(event.relatedTarget);
	  			var file_taskid = button.data("taskid");
	  			var file_taskname = button.data("taskname") ;
	  			var modal = $(this);
	  			modal.find("#file_taskid").val(file_taskid);
	  			modal.find("#file_taskname").val(file_taskname);
		});
		$("#exampleModal3").on("show.bs.modal", function (event) {
	  			var button = $(event.relatedTarget);
	  			var filename = button.data("whatever") ;
	  			var fileid = button.data("fileid") ;
	  			var modal = $(this);
	  			modal.find("#recipient-name3").val(filename);
	  			modal.find("#file_id").val(fileid);
		});
		//新版本发布的模态框
		$("#newversion").on("show.bs.modal", function (event) {
	  			var button = $(event.relatedTarget);
	  			var proname = button.data("proname") ;
	  			var proid = button.data("proid") ;
	  			var modal = $(this);
	  			modal.find("#version_proname").val(proname);
	  			modal.find("#version_proid").val(proid);
		});
		
	
			

	 //项目版本信息
	 var comm={};
	 comm.projectid="${tableProject.projectid }";
	 //项目的统计信息 ，生成图形显示
	 $.ajax({
		 type:"POST",
			url:"<%=path%>/admin/project/proVersion",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(comm),
			dataType:"json",
			beforeSend:function(XMLHttpRequest){
				//设置加载悬浮框
				
			},
			error:function(){
				alert("加载失败，请刷新重试！");
			},
			success:function(data){
				if(data!=null&&data.length>0){
					$("#home_w").hide();
					var row="";
					$(data).each(function(index,item){
						row="<hr>"+
							"<div class='media-left'><a><i class='glyphicon glyphicon-list-alt'></i><a></div>"+
							"<div class='media-body'><h4 class='media-heading'><a>"+item.versionName+"</a><span class='pull-right'><small>"+item.ctime+"</small></span></h4><span>"+item.intro+"</span></div>"+
							"<div class='media-right'><a href='${pageContext.request.contextPath}/admin/project/download3/"+item.fileId+"'><button type='button' class='btn btn-primary'>下载</button></a></div>";
	
						//时间
						//项目版本
						//项目说明
						//项目进度
						//项目
						$("#pro_txt").append(row);
					});
					
					
				}else{
					$("#home_w").shhow();
				}
			}
	 });
	 var comm1={};
 	comm1.projectId="${tableProject.projectid }";
	 //设置权限信息
	 $.ajax({
 		type:"POST",
			url:"<%=path%>/admin/project/getJur",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(comm1),
			dataType:"json",
			beforeSend:function(XMLHttpRequest){
				//设置加载悬浮框
			},
			error:function(){
				alert("加载失败，请刷新重试！");
			},
			success:function(data){
				
				
				if(data.jurId>1){
					//设置权限为可以添加人员
					$("#add_show").show(); 
					$("#task_list").show();
					$("#task_add").show();
					$("#edit_pro_intro_btn").show();
					$("#file_need_list").show();
					$("#pub_new_version").show();
				}else{
					$("#add_show").hide();
					$("#task_list").hide();
					$("#task_add").hide();
					$("#edit_pro_intro_btn").hide();
					$("#file_need_list").hide();
					$("#pub_new_version").hide();
				}
			}
 	});
	
  });
  function edit_intro(){
	  $("#intro_inform").hide();
	  $("#edit_intro").show();
	  }
  function edit_intro_submit(){
	  var comm={};
	  comm.intro=$("#pro_intro").val();
	  comm.projectid="${tableProject.projectid }";
	  $.ajax({
			 type:"POST",
				url:"<%=path%>/admin/project/editProIntro",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(comm),
				dataType:"json",
				beforeSend:function(XMLHttpRequest){
					//设置加载悬浮框
				},
				error:function(){
					alert("加载失败，请刷新重试！");
				},
				success:function(data){
					if(data>0){
						$("#pro_intro_show").text(comm.intro);
						$("#intro_inform").show();
						$("#edit_intro").hide();
					}else{
						alert("加载失败，请刷新重试！");
					}
				}
		 });
  }
  
  function download_file(path,name){
	  alert(path);
	  alert(name);
  }
  </script>
  	<div class="container">
  		<div>
  		<h4><i class="glyphicon glyphicon-list-alt"></i><strong > <a href="${pageContext.request.contextPath }/admin/project/proList">${sessionScope.user.userName }</a>&nbsp;/&nbsp;<a>${tableProject.projectname }</a></strong></h4>
  		</div>
  		<ul id="myTab" class="nav nav-tabs">
			<li class="active">
				<a href="#home" data-toggle="tab">
					代码
				</a>
			</li>
			<li><a href="#team" data-toggle="tab" onclick="teamInform()">团队</a></li>
			<li><a href="#task" data-toggle="tab" onclick="taskInform()">任务</a></li>
			<li><a href="#file" data-toggle="tab" onclick="fileInform()">文件</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="home">
			<!-- 线束项目信息和项目的版本，以及项目提交记录 -->
				 <div class="alert alert-warning" role="alert" id="home_w">
			        暂时还没有任何提交数据
			        <button type="button" class="close" aria-hidden="true" onclick="qxon('home_w')">&times;</button>
			      </div>
			      <div class="row" id="intro_inform">
			      <br>
				      <div class="col-md-9">
				      
				      	<p id="pro_intro_show">${tableProject.intro }</p>
				      </div>
				      <div align="right"><button type="button" class="btn btn-default" onclick="edit_intro()" id="edit_pro_intro_btn">编辑</button><button type="button" id="pub_new_version" class="btn btn-default" data-toggle="modal" data-target="#newversion" data-proid="${tableProject.projectid }" data-proname="${tableProject.projectname }">新的版本</button></div>
			      </div>
			      <div class="row" id="edit_intro" hidden="hidden">
			      	<button type="button" class="close" aria-hidden="true" title="取消" onclick="qxon_edit('edit_intro')">&times;</button>
				      <div class="col-lg-12">
						<div class="input-group">
							<input type="text" class="form-control" value="${tableProject.intro }" id="pro_intro">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" onclick="edit_intro_submit()">
									保存
								</button>
							</span>
						</div><!-- /input-group -->
					</div><!-- /.col-lg-6 -->
			      </div>
			      
			      <div id="pro_txt">
			      </div>
			      
			</div>
			<div class="tab-pane fade" id="team">
			<!-- 团队成员 -->
				<div class="alert alert-warning" role="alert" id="team_w">
			        暂时没有团队参与
			        <button type="button" class="close" aria-hidden="true" onclick="qxon('team_w')">&times;</button>
			    </div>
			    <br>
			    <div class="row">
			        <div class="col-lg-6">
			        <div class="alert alert-danger" role="alert" id="check_user_inform"></div>
						<div class="input-group" id="add_show">
							<input type="text" class="form-control" id="user_id" onkeyup="check_user()">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" onclick="addPerson()">
									添加
								</button>
							</span>
						</div><!-- /input-group -->
					</div><!-- /.col-lg-6 -->
		        </div>
		        <br>
		        <div class="row" id="userList">
		        
		        </div>
		        
			</div>
			<div class="tab-pane fade" id="task">
			<!-- 任务 -->
				<div class="alert alert-warning" role="alert" id="task_w">
			        暂时还没有任务
			        <button type="button" class="close" aria-hidden="true" onclick="qxon('task_w')">&times;</button>
			    </div>
			    <br>
				    <div class="row" id="task_add">
			            <div class="col-lg-6">
				            <div class="input-group">
				            	
								<input type="text" class="form-control" name="taskTitle" id="taskTitle" placeholder="任务名">
								<div class="input-group-btn">
									<select name="uid" id="idsel" class="form-control" style="
										width:80px;
										padding:3px 10px;
										border-top-right-radius: 5px;
										border-bottom-right-radius: 5px;
										appearance:none;
										-moz-appearance:none;
										-webkit-appearance:none;
										background:url(img/arrow.jpg) no-repeat right center;
										background-color: #eee;
										background-size:20%;
										">
										<option value="-1">完成人</option>
									</select>
								</div>
							</div>
						</div>
			            <div class="col-lg-6">
							<div class="input-group" id="add_show">
								<input type="text" class="form-control" id="task_intro" name="taskIntro" placeholder="任务说明">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" onclick="submitTask()">
										添加
									</button>
								</span>
							</div><!-- /input-group -->
						</div><!-- /.col-lg-6 -->
						</form>
			        </div><!-- /.row -->
		        
		        <br>
		        
		         <div class="panel panel-info"id="task_list">
					<div class="panel-heading">
						<h3 id="section-2" class="panel-title">任务列表</h3>
					</div>
					<div class="panel-body" id="task_list_inform">
					</div>
				</div>
				<div class="panel panel-info" id="my_task_title">
					<div class="panel-heading">
						<h3 id="section-2" class="panel-title">我的任务</h3>
					</div>
					<div class="panel-body" id="my_task">
						
					</div>
				</div>
			</div>
	<!-- 文件管理  start   -->		
	<div class="tab-pane fade" id="file">
			<!-- 任务 -->
				<div class="alert alert-warning" role="alert" id="file_need">
			        暂时还没有文件
			        <button type="button" class="close" aria-hidden="true" onclick="qxon('file_w')">&times;</button>
			    </div>
			    <br>
				   

		         <div class="panel panel-info"id="file_need_list">
					<div class="panel-heading">
						<h3 id="section-2" class="panel-title">文件列表</h3>
					</div>
					<div class="panel-body" id="file_list_inform">
					</div>
				</div>
				<div class="panel panel-info" id="my_file_title">
					<div class="panel-heading">
						<h3 id="section-2" class="panel-title">我的文件</h3>
					</div>
					<div class="panel-body" id="my_file">
						
					</div>
				</div>
			</div>
			
	<!-- 文件管理    end -->			
	<!-- 上传模态框start -->	
	<div class="modal fade" id="myfile_upload" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">上传文件</h4>
      </div>
      <div class="modal-body">
        <form action="" id="upform" enctype="multipart/form-data"  method="POST">
          <div class="form-group">
            
            <input type="hidden" class="form-control" readonly="readonly" name="taskid" id="myfile_taskid">
          </div>
          <div class="form-group">
            <label for="myfile_taskname" class="control-label">任务名</label>
            <input type="text" class="form-control" readonly="readonly"  id="myfile_taskname">
          </div>
          <div class="form-group">
            <label  class="control-label">选择文件</label>
            <input type="file" class="form-control"  name="file" id="upfile">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">文件简介:</label>
            <textarea class="form-control" name="intro" id="message-text"></textarea>
          </div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" id="filesubmit" class="btn btn-primary">确认上传</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- 上传模态框end -->	
<!-- 下载模态框start -->
	<div class="modal fade" id="taskfile_down" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">下载文件</h4>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath }/admin/project/download1"   method="POST">
          <div class="form-group">
           
            <input type="hidden" class="form-control" readonly="readonly" name="taskid" id="file_taskid">
          </div>
          <div class="form-group">
            <label for="file_taskname" class="control-label">任务名</label>
            <input type="text" class="form-control" readonly="readonly"  id="file_taskname">
          </div>
 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" id="filedownsubmit" class="btn btn-primary" >确认下载</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- 下载模态框end -->

<!-- 自己文件模态框start -->
<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">下载文件</h4>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath }/admin/project/download2" enctype="multipart/form-data"  method="POST">
          <div class="form-group">
            <label for="recipient-name2" class="control-label">文件名</label>
            <input type="text" class="form-control" readonly="readonly" name="filename" id="recipient-name3">
          </div>
 			<div class="form-group">
            <input type="hidden" class="form-control" readonly="readonly" name="fileid" id="file_id">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" id="myfiledownsubmit" class="btn btn-primary" >确认下载</button>
        </form>
      </div>
    </div>
  </div>
</div>
	<!-- 自己文件模态框end -->
		</div>
  	<!-- 发布新版本模态框 -->
 <div class="modal fade" id="newversion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">新版本发布</h4>
      </div>
      <div class="modal-body">
        <form id="newversion_form" action="" enctype="multipart/form-data"  method="POST">
          <div class="form-group">       
            <input type="hidden" class="form-control" readonly="readonly" name="prijectId" id="version_proid">
          </div>
          <div class="form-group">
            <label for="version_proname" class="control-label">项目名称</label>
            <input type="text" class="form-control" readonly="readonly" name="projectname" id="version_proname">
          </div>
 		  <div class="form-group">
            <label for="version_proid" class="control-label">版本名称</label>
            <input type="text" class="form-control" minlength="2" maxlength="20" name="versionName" id="version_name">
         </div>
         <div class="form-group">
            <label for="version_proid" class="control-label">版本介绍</label>
            <textarea rows="6" name="intro" id="version_intro" class="form-control"></textarea>
         </div>
        <div class="form-group">
            <label for="version_proid" class="control-label">选择文件</label>
            <input type="file" name="file" id="version_file" class="form-control">
         </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" id="myversionpub"  class="btn btn-primary" >确认发布</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- 发布新版本模态框 -->
	  	<div align="right">
			<jsp:include page="/MyFooter.jsp"></jsp:include>
		</div>
    </div><!--/.container-->
    <script type="text/javascript">
    
    function submitTask(){
    	var taskTitle=$("#taskTitle").val().trim();
    	if(taskTitle!=null&&taskTitle.length>0){
    		var comm={};
    		comm.taskname=taskTitle;
    		comm.intro=$("#task_intro").val().trim();
    		comm.userId=$("#idsel").val();
    		comm.projectId="${tableProject.projectid }";
    		$.ajax({
    			type:"POST",
    			url:"<%=path%>/admin/project/addTask",
    			contentType:"application/json;charset=utf-8",
    			data:JSON.stringify(comm),
    			dataType:"json",
    			error:function(){
    				alert("加载失败，请刷新重试！");
    			},
    			success:function(data){
    				if(data>0){
    					alert("添加成功");
    					taskInform();
    				}else{
    					alert("删除失败");
    				}
    			}
    		});
    	}else{
    		alert("任务名不能为空");
    	}
    }
    
    //删除用户
    function delUser(uid){
		var comm={};
		comm.projectId="${tableProject.projectid }";
		comm.userId=uid;
		$.ajax({
			type:"POST",
			url:"<%=path%>/admin/project/delUserByPro",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(comm),
			dataType:"json",
			error:function(){
				alert("加载失败，请刷新重试！");
			},
			success:function(data){
				if(data>0){
					$("#"+uid).hide();
				}else{
					alert("删除失败");
				}
			}
		});
		
	}
    
    function check_user(){
    	var comm={};
    	comm.userId=$("#user_id").val();
    	comm.projectId="${tableProject.projectid }";
    	//alert(comm.userId);
    	if(comm.userId==null||comm.userId.length<=0){
    		$("#check_user_inform").hide();
    	}
    	 $.ajax({
    		type:"POST",
			url:"<%=path%>/admin/user/verifyUserId",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(comm),
			dataType:"json",
			beforeSend:function(XMLHttpRequest){
				//设置加载悬浮框
			},
			error:function(){
				alert("加载失败，请刷新重试！");
			},
			success:function(data){
				$("#check_user_inform").show();
				if(data==0){
					//用户不存在
					$("#check_user_inform").text("用户不存在");
					return false;
				}else if(data==1){
					$("#check_user_inform").text("验证成功");
					return true;
				}else if(data==2){
					$("#check_user_inform").text("该用户已添加");
					return false;
				}
			}
    	});
    }
    
    function qxon(id){
    	$("#"+id).hide();
    }
    function qxon_edit(id){
    	$("#"+id).hide();
    	$("#intro_inform").show();
    }
  /**
    *获取团队信息
    *
    *
    */
    function teamInform(){
    	$("#check_user_inform").hide();
    	//获取团队信息
    	//alert("团队信息");
    	//获取权限信息
    	var comm={};
    	comm.projectId="${tableProject.projectid }";
    	//查找成员信息
    	 $.ajax({
    		type:"POST",
			url:"<%=path%>/admin/project/getTeamUser",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(comm),
			dataType:"json",
			beforeSend:function(XMLHttpRequest){
				//设置加载悬浮框
			},
			error:function(){
				alert("加载失败，请刷新重试！");
			},
			success:function(data){
				$("#userList").html("");
				if(data.length>0){
					$("#team_w").hide();
				}
				//获取用户id
				var userid="${sessionScope.user.userId }";
				var jur=0;
				$(data).each(function(index,item){
					if(userid==item.userId){
						jur=item.jurId;
					}
				});
				$(data).each(function(index,item){
					
					var row="";
					if(userid==item.userId){
						row="<div class='col-lg-2' id='"+item.userId+"'>"+
			        	"<div class='alert alert-success' role='alert'>"+
		        		item.userId+
			        	"</div>"+
						"</div>";
					}else{
						if(jur>1){
							row="<div class='col-lg-2' id='"+item.userId+"'>"+
				        	"<div class='alert alert-success' role='alert'>"+
			        		item.userId+
			        		"<button type='button' class='close' aria-hidden='true' onclick='delUser("+item.userId+")'>&times;</button>"+
				        	"</div>"+
							"</div>";
						}else{
							row="<div class='col-lg-2' id='"+item.userId+"'>"+
				        	"<div class='alert alert-success' role='alert'>"+
			        		item.userId+
				        	"</div>"+
							"</div>";
						}
						
					}
					
					$("#userList").append(row);
				});
			}
    	});
    }
    
    function addPerson(){
    	var comm={};
    	comm.userId=$("#user_id").val();
    	comm.projectId="${tableProject.projectid }";
    	if(comm.userId==null||comm.userId.length<=0){
    		$("#check_user_inform").hide();
    	}
    	 $.ajax({
    		type:"POST",
			url:"<%=path%>/admin/user/verifyUserId",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(comm),
			dataType:"json",
			beforeSend:function(XMLHttpRequest){
				//设置加载悬浮框
			},
			error:function(){
				alert("加载失败，请刷新重试！");
			},
			success:function(data){
				$("#check_user_inform").show();
				if(data==0){
					//用户不存在
					$("#check_user_inform").text("用户不存在");
				}else if(data==1){
					$("#check_user_inform").text("验证成功");
					var comm1={};
			    	comm1.projectId="${tableProject.projectid }";
			    	comm1.userId=$("#user_id").val();
			    	//查找成员信息
			    	 $.ajax({
			    		type:"POST",
						url:"<%=path%>/admin/project/addPersonByPid",
						contentType:"application/json;charset=utf-8",
						data:JSON.stringify(comm1),
						dataType:"json",
						beforeSend:function(XMLHttpRequest){
							//设置加载悬浮框
						},
						error:function(){
							alert("加载失败，请刷新重试！");
						},
						success:function(data){
							if(data>0){
								//添加成功
								var row="<div class='col-lg-2' id='"+comm.userId+"'>"+
					        	"<div class='alert alert-success' role='alert'>"+
					        	comm.userId+
				        		"<button type='button' class='close' aria-hidden='true' onclick='delUser("+comm.userId+")'>&times;</button>"+
					        	"</div>"+
								"</div>";
								$("#userList").append(row);
							}else{
								alert("添加失败");
							}
						}
			    	 });
				}else if(data==2){
					$("#check_user_inform").text("该用户已添加");
				}
			}
    	});
    }
    
	function taskInform(){
    	//获取任务信息
    	var comm={};
    	comm.projectId="${tableProject.projectid }";
    	 $.ajax({
     		type:"POST",
 			url:"<%=path%>/admin/project/taskList",
 			contentType:"application/json;charset=utf-8",
 			data:JSON.stringify(comm),
 			dataType:"json",
 			beforeSend:function(XMLHttpRequest){
 				//设置加载悬浮框
 			},
 			error:function(){
 				alert("加载失败，请刷新重试！");
 			},
 			success:function(data){
 				$("#task_list_inform").html("");
 				if(data.length>0){
 					$("#task_w").hide();
 				}else{
 					$("#task_list").hide();
 				}
 				$(data).each(function(index,item){
 					var row="";
	 					if(item.flag==0){//未完成
 	 						row="<hr><div class='media'>"+
 						    "<a class='media-left' href='javascript:void(0)'>"+
 						    "<i class='glyphicon glyphicon-list-alt'></i>"+
 						    "</a>"+
 						    "<div class='media-body'>"+
 						        "<h4 class='media-heading'><span class='badge pull-right'>未完成</span><a title='任务介绍:"+item.intro+"  责任人:"+item.username+"'>"+item.taskname+"</a></h4>"+
 						        
 							    "</div>"+
 							"</div>";
 	 					}else if(item.flag==1){
 	 						row="<hr><div class='media'>"+
 						    "<a class='media-left' href='javascript:void(0)'>"+
 						    "<i class='glyphicon glyphicon-list-alt'></i>"+
 						    "</a>"+
 						    "<div class='media-body'>"+
 						        "<h4 class='media-heading'><span class='badge pull-right'>审核中</span><a title='任务介绍:"+item.intro+"  责任人:"+item.username+"'>"+item.taskname+"</a></h4>"+
 						
 							    "</div>"+
 							"</div>";
 	 					}else if(item.flag==2){
 	 						row="<hr><div class='media'>"+
 						    "<a class='media-left' href='javascript:void(0)'>"+
 						    "<i class='glyphicon glyphicon-list-alt'></i>"+
 						    "</a>"+
 						    "<div class='media-body'>"+
 						        "<h4 class='media-heading'><span class='badge pull-right'>审核通过</span><a title='任务介绍:"+item.intro+"  责任人:"+item.username+"'>"+item.taskname+"</a></h4>"+
 						        
 							    "</div>"+
 							"</div>";
 	 					}else{
 	 						row="<hr><div class='media'>"+
 						    "<a class='media-left' href='javascript:void(0)'>"+
 						    "<i class='glyphicon glyphicon-list-alt'></i>"+
 						    "</a>"+
 						    "<div class='media-body'>"+
 						        "<h4 class='media-heading'><span class='badge pull-right'>未通过</span><a title='任务介绍:"+item.intro+"  责任人:"+item.username+"'>"+item.taskname+"</a></h4>"+
 						      
 							    "</div>"+
 							"</div>";
 	 					}
	 					$("#task_list_inform").append(row);
 				});
 			}
     	});
		//添加任务
		
		$("#idsel").html("<option value='-1'>完成人</option>");
    	//查找成员信息
    	 $.ajax({
    		type:"POST",
			url:"<%=path%>/admin/project/getTeamUser",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(comm),
			dataType:"json",
			beforeSend:function(XMLHttpRequest){
				//设置加载悬浮框
			},
			error:function(){
				alert("加载失败，请刷新重试！");
			},
			success:function(data){
				$("#userList").html("");
				if(data.length>0){
					$("#team_w").hide();
				}
				$(data).each(function(index,item){
					var row="<option value='"+item.userId+"'>"+item.userId+"</option>";
					$("#idsel").append(row);
				});
			}
    	});
    	
    	//获取自己的任务信息
    	 $.ajax({
     		type:"POST",
 			url:"<%=path%>/admin/project/myTask",
 			contentType:"application/json;charset=utf-8",
 			data:JSON.stringify(comm),
 			dataType:"json",
 			beforeSend:function(XMLHttpRequest){
 				//设置加载悬浮框
 			},
 			error:function(){
 				alert("加载失败，请刷新重试！");
 			},
 			success:function(data){
 				if(data.length==0){
 					$("#task_w").show();
 					var row1="<div class='alert alert-warning' role='alert' >"+
			        	"暂时没有任务"+
			    		"</div>";
 					$("#my_task").html(row1);
 				}else{
 					$("#my_task").html("");
 					//获取用户id
 	 				$(data).each(function(index,item){
 	 					var row="";
 	 					if(item.flag==0){//未完成
 	 						row="<hr><div class='media'>"+
 						    "<a class='media-left' href='javascript:void(0)'>"+
 						    "<i class='glyphicon glyphicon-list-alt'></i>"+
 						    "</a>"+
 						    "<div class='media-body'>"+
 						        "<h4 class='media-heading'><span class='badge pull-right'>未完成</span><a title='任务介绍:"+item.intro+"'>"+item.taskname+"</a></h4>"+
 						       
 							    "</div><button type='button' class='btn btn-primary' data-toggle='modal' data-target='#myfile_upload' data-myfile_taskname='"+item.taskname+"' data-myfile_taskid="+item.taskid+">上传文件</button>"+
 							"</div>";
 	 					}else if(item.flag==1){//审核中  不可传
 	 						row="<hr><div class='media'>"+
 						    "<a class='media-left' href='javascript:void(0)'>"+
 						    "<i class='glyphicon glyphicon-list-alt'></i>"+
 						    "</a>"+
 						    "<div class='media-body'>"+
 						        "<h4 class='media-heading'><span class='badge pull-right'>审核中</span><a title='任务介绍:"+item.intro+"'>"+item.taskname+"</a></h4>"+				    
 							    "</div>"+
 							"</div>";
 	 					}else if(item.flag==2){ //审核通过不可上传
 	 						row="<hr><div class='media'>"+
 						    "<a class='media-left' href='javascript:void(0)'>"+
 						    "<i class='glyphicon glyphicon-list-alt'></i>"+
 						    "</a>"+
 						    "<div class='media-body'>"+
 						        "<h4 class='media-heading'><span class='badge pull-right'>审核通过</span><a title='任务介绍:"+item.intro+"'>"+item.taskname+"</a></h4>"+
 						       
 							    "</div>"+
 							"</div>";
 	 					}else if(item.flag==3){   //审核不通过，重新上传
 	 						row="<hr><div class='media'>"+
 						    "<a class='media-left' href='javascript:void(0)'>"+
 						    "<i class='glyphicon glyphicon-list-alt'></i>"+
 						    "</a>"+
 						    "<div class='media-body'>"+
 						        "<h4 class='media-heading'><span class='badge pull-right'>未通过</span><a title='任务介绍:"+item.intro+"'>"+item.taskname+"</a></h4>"+
 						        
 							    "</div><button type='button' class='btn btn-primary' data-toggle='modal' data-target='#myfile_upload' date-filetaskname="+item.taskname+" data-myfile_taskid="+item.taskid+">上传文件</button>"+
 							"</div>";
 	 					}
 	 					$("#my_task").append(row);
 	 				});
 				}
 			}
     	});
    	
    }

    </script>
   
 
    <script type="text/javascript">
    //任务信息文件信息
    function fileInform(){
    //获取任务文件信息
    	var comm={};
    	comm.projectId="${tableProject.projectid }";
    	$.ajax({
    		type:"POST",
 			url:"<%=path%>/admin/project/allTaskList",
 			contentType:"application/json;charset=utf-8",
 			data:JSON.stringify(comm),
 			dataType:"json",
 			beforeSend:function(XMLHttpRequest){
 				//设置加载悬浮框
 			},
 			error:function(){
 				alert("加载失败，请刷新重试！");
 			},
 			success:function(data){
 				$("#file_list_inform").html("");
 				if(data.length>0){
 					$("#file_need").hide();
 				}else{
 					$("#file_list").hide();
 				}
 				$(data).each(function(index,item){
 					var row="";
	 					if(item.flag==0){//未完成
 	 						row="<hr><div class='media'>"+
 						    "<a class='media-left' href='javascript:void(0)'>"+
 						    "<i class='glyphicon glyphicon-list-alt'></i>"+
 						    "</a>"+
 						    "<div class='media-body'>"+
 						        "<h4 class='media-heading'><span class='badge pull-right'>未完成</span><a a title='任务介绍："+item.intro+"'>"+item.taskname+"</a></h4>"+ 
 							    "</div>"+
 							"</div>";
 	 					}else if(item.flag==1){//审核中 可以下载文件  可以进行审核
 	 						row="<hr>"+
								"<div class='media-left'><a><i class='glyphicon glyphicon-list-alt'></i><a></div>"+
								"<div class='media-body'><h4 class='media-heading'><a title='任务介绍："+item.intro+"'>"+item.taskname+"</a><span class='badge pull-right'>审核中</span></h4><div><button type='button' class='btn btn-primary' data-toggle='modal' data-target='#taskfile_down' data-taskid="+item.taskid+" data-taskname="+item.taskname+">下载</button><button id='topass' onclick='topass()' data-pass="+item.taskid+" data-flag='2' class='btn btn-primary'>通过</button><button id='nopass' onclick='nopass()' data-nopass="+item.taskid+" data-flag='3'  class='btn btn-primary'>重做</button></div></div>"+
								"<div class='media-right'></div>";
 	 					}else if(item.flag==2){// 审核通过  可以下载文件
 	 						row="<hr>"+
								"<div class='media-left'><a><i class='glyphicon glyphicon-list-alt'></i><a></div>"+
								"<div class='media-body'><h4 class='media-heading'><a title='任务介绍："+item.intro+"'>"+item.taskname+"</a><span class='badge pull-right'>审核通过</span></h4><div><button type='button' class='btn btn-primary' data-toggle='modal' data-target='#taskfile_down' data-taskid="+item.taskid+" data-taskname="+item.taskname+">下载</button></div></div>"+
								"<div class='media-right'></div>";
 	 					}else if(item.flag==3){  //审核未通过 不可下载文件
 	 						row="<hr><div class='media'>"+
 						    "<a class='media-left' href='javascript:void(0)'>"+
 						    "<i class='glyphicon glyphicon-list-alt'></i>"+
 						    "</a>"+
 						    "<div class='media-body'>"+
 						        "<h4 class='media-heading'><span class='badge pull-right'>未通过</span><a a title='任务介绍："+item.intro+"'>"+item.taskname+"</a></h4>"+
 						     
 							    "</div>"+
 							"</div>";
 	 					}
	 					$("#file_list_inform").append(row);
 				});
 			}
    	});
    	
    	//自己的文件的信息
    	$.ajax({
    		type:"POST",
 			url:"<%=path%>/admin/project/myfile",
 			contentType:"application/json;charset=utf-8",
 			data:JSON.stringify(comm),
 			dataType:"json",
 			beforeSend:function(XMLHttpRequest){
 				//设置加载悬浮框
 			},
 			error:function(){
 				alert("你还没有上传文件");
 			},
 			success:function(data){
 				$("#my_file").html("");
 				
 				$(data).each(function(index,item){
 				
 					if(item.proid==comm.projectId&&item.flag==1){
 						row="<hr><div class='media'>"+
 						    "<a class='media-left' href='javascript:void(0)'>"+
 						    "<i class='glyphicon glyphicon-list-alt'></i>"+
 						    "</a>"+
 						    "<div class='media-body'>"+
 						        "<h4 class='media-heading'><span class='badge pull-right'>审核中</span><a title='文件描述:"+item.intro+"'>"+item.filename+"</a></h4>"+ 
 							    "</div><button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal3' data-whatever="+item.filename+" data-fileid="+item.fileid+">下载文件</button>"+
 							"</div>";
 					}else if(item.proid==comm.projectId&&item.flag==2){
 						row="<hr><div class='media'>"+
 						    "<a class='media-left' href='javascript:void(0)'>"+
 						    "<i class='glyphicon glyphicon-list-alt'></i>"+
 						    "</a>"+
 						    "<div class='media-body'>"+
 						        "<h4 class='media-heading'><span class='badge pull-right'>审核通过</span><a title='文件描述:"+item.intro+"'>"+item.filename+"</a></h4>"+ 
 							    "</div><button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal3' data-whatever="+item.filename+" data-fileid="+item.fileid+">下载文件</button>"+
 							"</div>";
 					}else if(item.proid==comm.projectId&&item.flag==3){
 						row="<hr><div class='media'>"+
 						    "<a class='media-left' href='javascript:void(0)'>"+
 						    "<i class='glyphicon glyphicon-list-alt'></i>"+
 						    "</a>"+
 						    "<div class='media-body'>"+
 						        "<h4 class='media-heading'><span class='badge pull-right'>未通过</span><a title='文件描述:"+item.intro+"'>"+item.filename+"</a></h4>"+ 
 							    "</div><button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal3' data-whatever="+item.filename+" data-fileid="+item.fileid+">下载文件</button>"+
 							"</div>";
 					}else if(item.proid==comm.projectId&&item.flag==5){
 						row="";
 					}
		
 					$("#my_file").append(row);
 					
 				});
    		}
    	
    	});
  
   }
  
		$("document").ready(function(){
			//文件上传的ajax
			$("#filesubmit").click(function(){
				var filepath=$("#upfile").val();
				var arr =filepath.split(".");
				if(filepath==""){
					alert("请选择文件");
					return false;
				}else if(arr[arr.length-1]!="rar"&&arr[arr.length-1]!="zip"&&arr[arr.length-1]!="7z"){
					alert("请选择压缩文件");
					return false;
				}else{
				 	var formData = new FormData($("#upform")[0]);
				    $.ajax({    
				        contentType:"multipart/form-data",  
				        url:"<%=path%>/admin/project/upeditjson",    
				        type:"POST",  
				        data:formData,  
				        dataType:"text",
				        beforeSend:function(XMLHttpRequest){
						//设置加载悬浮框
						},
						
						async: false, //一定要加 否则函数不能回调执行
				        processData: false,  // 告诉jQuery不要去处理发送的数据  
				        contentType: false, // 告诉jQuery不要去设置Content-Type请求头 
				        error:function(){
 							alert("加载失败，请刷新重试！");
 						},  
				        success: function(data){  
				            var row="";
				            $("#file_list_inform").append(row);
				        }  
				     
				    });  
				}
			});
			//版本发布
			$("#myversionpub").click(function(){
				var filepath=$("#version_file").val();
				var arr=filepath.split(".");
				if(filepath==""){
					alert("请选择文件");
					return false;
				}else if(arr[arr.length-1]!="rar"&&arr[arr.length-1]!="zip"&&arr[arr.length-1]!="7z"){
					alert("请选择压缩文件");
					return false;
				}else{
				 	var formData2 = new FormData($("#newversion_form")[0]);
				    $.ajax({    
				        contentType:"multipart/form-data",  				        
				        url:"<%=path%>/admin/project/newversion",    
				        type:"POST",  
				        data:formData2,  
				        dataType:"text",
				        beforeSend:function(XMLHttpRequest){
						//设置加载悬浮框
						},
						
						async: false, //一定要加 否则函数不能回调执行
				        processData: false,  // 告诉jQuery不要去处理发送的数据  
				        contentType: false, // 告诉jQuery不要去设置Content-Type请求头 
				        error:function(){
 							alert("加载失败，请刷新重试！");
 						},  
				        success: function(data){  
				            var row="";
				            alert("新版本发布成功");
				        }  
				    });  
				  }
				
			});
		});
		
		
		
	</script>
	
	<script type="text/javascript">
	
	// 这个是审核文件
		function topass(){
			var comm={};
			var button = $("#topass");
			var taskid=button.data("pass");	
			var flag=button.data("flag");	
			comm.taskid=taskid;
			comm.flag=flag;
			$.ajax({
				type:"POST",
				url:"<%=path%>/admin/project/exam",
 				contentType:"application/json;charset=utf-8",
 				data:JSON.stringify(comm),
 				dataType:"text",
 				beforeSend:function(XMLHttpRequest){
 				//设置加载悬浮框
 				},
 				error:function(){
 					alert("加载失败，请刷新重试！");
 				},
 				success:function(data){
 					alert("审核完成");
 					window.location.reload();
 				}
			});
		}
		function nopass(){
			var comm={};
			var button = $("#nopass");
			var taskid=button.data("nopass");	
			var flag=button.data("flag");	
			comm.taskid=taskid;
			comm.flag=flag;
			$.ajax({
				type:"POST",
				url:"<%=path%>/admin/project/exam",
 				contentType:"application/json;charset=utf-8",
 				data:JSON.stringify(comm),
 				dataType:"text",
 				beforeSend:function(XMLHttpRequest){
 				//设置加载悬浮框
 				},
 				error:function(){
 					alert("加载失败，请刷新重试！");
 				},
 				success:function(data){
 					alert("审核完成");
 					window.location.reload();
 				}
			});
		}
	</script>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <%-- <script src="<%=path %>/js/vendor/jquery.min.js"></script> --%>
    <script src="<%=path %>/js/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<%=path %>/js/ie10-viewport-bug-workaround.js"></script>
    <script src="<%=path %>/js/back/offcanvas.js"></script>
  </body>
</html>
