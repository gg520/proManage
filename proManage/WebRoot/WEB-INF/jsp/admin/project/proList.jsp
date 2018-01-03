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
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
/* Custom Styles */
    ul.nav-tabs{
        width: 140px;
        margin-top: 60px;
        border-radius: 4px;
        border: 1px solid #ddd;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
    }
    ul.nav-tabs li{
        margin: 0;
        border-top: 1px solid #ddd;
    }
    ul.nav-tabs li:first-child{
        border-top: none;
    }
    ul.nav-tabs li a{
        margin: 0;
        padding: 8px 16px;
        border-radius: 0;
    }
    ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
        color: #fff;
        background: #0088cc;
        border: 1px solid #0088cc;
    }
    ul.nav-tabs li:first-child a{
        border-radius: 4px 4px 0 0;
    }
    ul.nav-tabs li:last-child a{
        border-radius: 0 0 4px 4px;
    }
    ul.nav-tabs.affix{
        top: 30px; /* Set the top position of pinned element */
    }
</style>
  </head>
  
  <body data-spy="scroll" data-target="#myScrollspy">
   <jsp:include page="/menus.jsp"></jsp:include> <br>
       <script type="text/javascript">
       $(document).ready(function(){
    	  //获取项目列表，
    	  
			 $.ajax({
				type:"POST",
				url:"<%=path%>/admin/project/proList",
				contentType:"application/json;charset=utf-8",
				dataType:"json",
				beforeSend:function(XMLHttpRequest){
					//设置加载悬浮框
					
				},
				error:function(){
					alert("加载失败，请刷新重试！");
				},
				success:function(data){
					$(data).each(function(index,item){
						
						var row="<div class='panel panel-warning col-xs-6 col-lg-4'>"+
							"<div class='panel-heading'>"+
							"<h3 class='panel-title'><a href='Javascript:void(0)'>"+item.proTitle+"</a><small>java</small></h3>"+
							"</div>"+
							"<div class='panel-body'>";
							if(item.proIntro.length<=14){
								row=row+"<p title='"+item.proIntro+"'>"+item.proIntro+"<br><br></p></div></div>";
							}else{
								row=row+"<p title='"+item.proIntro+"'>"+item.proIntro.substring(0,27)+"...</p></div></div>";
							} 
						$("#proList").append(row); 
					});
				}
			});
       });
       
       </script>
       <div class="container">
   <div class="jumbotron">
        <h1>Hello, world!</h1>
            <p>This is an example to show the potential of an offcanvas layout pattern in Bootstrap. Try some responsive-range viewport sizes to see it in action.</p>
    </div>
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <li class="active"><a href="<%=path %>/admin/project/proList#section-1">项目列表</a></li>
                <li><a href="<%=path %>/admin/project/proList#section-2">最近活动</a></li>
            </ul>
        </div>
        <div class="col-xs-9">
	        <div class="panel panel-info">
				<div class="panel-heading">
					<h3 id="section-1" class="panel-title">项目列表</h3>
				</div>
				<div class="panel-body">
					<div id="proList">
					
						<!--<div class="panel panel-warning col-xs-6 col-lg-4">
							<div class="panel-heading">
								<h3 class="panel-title"><a href="Javascript:void(0)">测试项目</a><small>java</small></h3>
							</div>
							<div class="panel-body">
								 <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
							</div>
						</div>
						<div class="panel panel-warning col-xs-6 col-lg-4">
							<div class="panel-heading">
								<h3 class="panel-title"><a href="Javascript:void(0)">测试项目</a><small>java</small></h3>
							</div>
							<div class="panel-body">
								 <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
							</div>
						</div>
						<div class="panel panel-warning col-xs-6 col-lg-4">
							<div class="panel-heading">
								<h3 class="panel-title"><a href="Javascript:void(0)">测试项目</a><small>java</small></h3>
							</div>
							<div class="panel-body">
								 <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
							</div>
						</div>
						<div class="panel panel-warning col-xs-6 col-lg-4">
							<div class="panel-heading">
								<h3 class="panel-title"><a href="Javascript:void(0)">测试项目</a><small>java</small></h3>
							</div>
							<div class="panel-body">
								 <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
							</div>
						</div>
						<div class="panel panel-warning col-xs-6 col-lg-4">
							<div class="panel-heading">
								<h3 class="panel-title"><a href="Javascript:void(0)">测试项目</a><small>java</small></h3>
							</div>
							<div class="panel-body">
								 <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
							</div>
						</div> -->
            		</div>
				</div>
			</div>
            <div class="panel panel-info">
				<div class="panel-heading">
					<h3 id="section-2" class="panel-title">最近活动</h3>
				</div>
				<div class="panel-body">
					<p>主要描述：创建的项目，提交的数据、添加的团队（都是根据时间排序）</p>
		            <p>Vestibulum consectetur scelerisque lacus, ac fermentum lorem convallis sed. Nam odio tortor, dictum quis malesuada at, pellentesque vitae orci. Vivamus elementum, felis eu auctor lobortis, diam velit egestas lacus, quis fermentum metus ante quis urna. Sed at facilisis libero. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum bibendum blandit dolor. Nunc orci dolor, molestie nec nibh in, hendrerit tincidunt ante. Vivamus sem augue, hendrerit non sapien in, mollis ornare augue.</p>
		            <hr>
				</div>
			</div>
            
        </div>
    </div>
	<div align="right">
		<jsp:include page="/MyFooter.jsp"></jsp:include>
	</div>
    </div><!--/.container-->

    
  </body>
</html>
