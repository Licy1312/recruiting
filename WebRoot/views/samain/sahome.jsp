<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>${title}</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/material.min.css" type="text/css"/>
	<link rel="stylesheet" href="css/metisMenu.min.css" type="text/css"/>
  </head>
  <body>
  <div class="container">
	   <%@ include file="../common/saheader.jsp" %> 
	  <div class="bs-docs-section">
		  <div class="row">
			  <div class="col-md-12"><h2>项目导航</h2></div>
		  </div>
		  <div class="row">
			  <div class="col-md-6">
				  <div class="bs-component">
					  <div class="list-group">
						  <div class="list-group-item">
							  <div class="row-action-primary">
								  <img class="circle" src="http://lorempixel.com/56/56/people/4" alt="icon">
							  </div>
							  <div class="row-content">
								  <div class="action-secondary"><i class="glyphicon glyphicon-info-sign"></i></div>
								  <h4 class="list-group-item-heading"><a href="${pageContext.request.contextPath}/">人员招聘分组</a></h4>

								  <p class="list-group-item-text">人员招聘分组：介绍。。。。</p>
							  </div>
						  </div>
						  <div class="list-group-separator"></div>
						  <div class="list-group-item">
							  <div class="row-action-primary">
								  <img class="circle" src="http://lorempixel.com/56/56/people/5" alt="icon">
							  </div>
							  <div class="row-content">
								  <div class="action-secondary"><i class="glyphicon glyphicon-info-sign"></i></div>
								  <h4 class="list-group-item-heading"><a href="">材料展示</a></h4>

								  <p class="list-group-item-text">材料展示：介绍。。。。。</p>
							  </div>
						  </div>

						  <div class="list-group-separator"></div>
						  <div class="list-group-item">
							  <div class="row-action-primary">
								  <img class="circle" src="http://lorempixel.com/56/56/people/4" alt="icon">
							  </div>
							  <div class="row-content">
								  <div class="action-secondary"><i class="glyphicon glyphicon-info-sign"></i></div>
								  <h4 class="list-group-item-heading"><a href="">设备统计分析</a></h4>

								  <p class="list-group-item-text">设备统计分析：介绍</p>
							  </div>
						  </div>
						  <div class="list-group-separator"></div>
					  </div>
					  <div id="source-button" class="btn btn-primary btn-xs" style="display: none;">&lt; &gt;</div></div>
			  </div>
			  <div class="col-md-6">
				  <div class="bs-component">
					  <div class="list-group">
						  <div class="list-group-item">
							  <div class="row-action-primary">
								  <img class="circle" src="http://lorempixel.com/56/56/people/3" alt="icon">
							  </div>
							  <div class="row-content">
								  <div class="action-secondary"><i class="glyphicon glyphicon-info-sign"></i></div>
								  <h4 class="list-group-item-heading"><a href="">新闻发布</a></h4>

								  <p class="list-group-item-text">新闻发布新闻发布新闻发布新闻发布.</p>
							  </div>
						  </div>
						  <div class="list-group-separator"></div>
						  <div class="list-group-item">
							  <div class="row-action-primary">
								  <img class="circle" src="http://lorempixel.com/56/56/people/2" alt="icon">
							  </div>
							  <div class="row-content">
								  <div class="action-secondary"><i class="glyphicon glyphicon-info-sign"></i></div>
								  <h4 class="list-group-item-heading"><a href="">聊天室</a></h4>

								  <p class="list-group-item-text">新闻发布新闻发布</p>
							  </div>
						  </div>
						  <div class="list-group-separator"></div>
						  <div class="list-group-item">
							  <div class="row-action-primary">
								  <img class="circle" src="http://lorempixel.com/56/56/people/4" alt="icon">
							  </div>
							  <div class="row-content">
								  <div class="action-secondary"><i class="glyphicon glyphicon-info-sign"></i></div>
								  <h4 class="list-group-item-heading"><a href="">权限管理</a></h4>

								  <p class="list-group-item-text">权限管理权限管理权限管理</p>
							  </div>
						  </div>
						  <div class="list-group-separator"></div>
					  </div>
				  </div>
			  </div>
		  </div>
	  </div>
	  <%@ include file="../common/fooder.jsp" %>
  </div>

	<script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/material.min.js"></script>
    <script src="js/metisMenu.min.js"></script>
    <script src="js/home.js"></script>
  </body>
</html>
  