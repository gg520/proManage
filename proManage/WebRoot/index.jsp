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
	<!-- Bootstrap core CSS -->
    <link href="<%=path %>/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="<%=path %>/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="<%=path %>/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="<%=path %>/css/index/carousel.css" rel="stylesheet">
	
  </head>
  
  <body>
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar">/span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>

              <img src="../../assets/img/favicon.jpg" class="navbar-brand" width="65" height="65">
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="active"><a href="index.html">首页</a></li>
                <li><a href="#about">关于</a></li>
                <li><a href="#contact">联系人</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的 <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">项目列表</a></li>
                    <li><a href="#">任务</a></li>
                    <li><a href="#">管理我的项目</a></li>
                    <li role="separator" class="divider"></li>
                    <li class="dropdown-header">Nav header</li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">退出</a></li>
                  </ul>
                </li> 
                <li>
                  <a href="${pageContext.request.contextPath }/login"><font color="">登陆</font></a>
                </li>

              </ul>
              
            </div>
          </div>
        </nav>

      </div>
    </div>
    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="../../assets/img/image.png" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>加入我们</h1>
              <p>本系统是一个受你工作方式启发的开发平台。从开源到商业，您可以托管和审查代码，管理项目，并与其他数百万开发人员一起构建软件，为了令你的项目被管理的更加方便、快捷，欢迎加入我们。</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">注册</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="../../assets/img/image (1).png" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>管理项目</h1>
              <p>在这里你可以发布自己的项目，管理自己的项目，也可以邀请更多的开发人员一起管理一个项目，构建更大的开发区间，让你的项目更加的健壮。</p>
               <p><a class="btn btn-lg btn-primary" href="#" role="button">查看更多</a></p> 
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="../../assets/img/image (2).png" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>浏览信息</h1>
              <p>在这里你的项目将会被更多的人发现，你也可以浏览更多的项目，从而巩固的项目，发现经验，获取经验。</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">查看更多</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="../../assets/img/TB1lDi3OVXXXXagXVXXXXXXXXXX-600-386.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>注册</h2>
          <p>本系统是一个受你工作方式启发的开发平台。从开源到商业，您可以托管和审查代码，管理项目，并与其他数百万开发人员一起构建软件，为了令你的项目被管理的更加方便、快捷，欢迎加入我们。</p>
          <p><a class="btn btn-default" href="#" role="button">详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="../../assets/img/TB1BHC2OVXXXXavXVXXXXXXXXXX-600-772.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>项目管理</h2>
          <p>在这里你可以发布自己的项目，管理自己的项目，也可以邀请更多的开发人员一起管理一个项目，构建更大的开发区间，让你的项目更加的健壮。</p>
          <p><a class="btn btn-default" href="#" role="button">详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="../../assets/img/TB1lDi3OVXXXXagXVXXXXXXXXXX-600-386.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>项目查询</h2>
          <p>在这里你的项目将会被更多的人发现，你也可以浏览更多的项目，从而巩固的项目，发现经验，获取经验。</p>
          <p><a class="btn btn-default" href="#" role="button">详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
      <!-- START THE FEATURETTES -->
      <hr class="featurette-divider">
      <!-- FOOTER -->
      <footer>
        <p>&copy; 2017 中原工学院实训团队 &middot; <a href="#">隐私</a> &middot; <a href="#">条款</a></p>
      </footer>
    </div><!-- /.container -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<%=path %>/js/vendor/jquery.min.js"></script>
    <!-- bootstrap -->
    <script src="<%=path %>/dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="<%=path %>/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<%=path %>/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
