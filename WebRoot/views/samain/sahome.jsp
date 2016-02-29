<%@ page language="java" import="java.util.*" import="com.corlymeng.util.MenuTest" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/saheader.css" type="text/css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/saheader.js"></script>
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	
  </head>
  <body>
  <input id="status" type="hidden" value=“${status}”/>
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
					  <c:forEach var="menu" items="${menuTest}">
					 				
					  			  
						  <div class="list-group-item">
							  <div class="row-action-primary">
								  <img class="circle" src="http://lorempixel.com/56/56/people/4" alt="icon">
							  </div>
							  <div class="row-content">
								  <div class="action-secondary"><i class="glyphicon glyphicon-info-sign"></i></div>
								  <h4 class="list-group-item-heading"><a href="${pageContext.request.contextPath}${menu.menuPath}"> 
								  ${menu.menuName}
								 	</a></h4>
								  <p class="list-group-item-text"> ${menu.menuDescript}</p>
								  
							  </div>
						  </div>
						  <div class="list-group-separator"></div>
						  </c:forEach>
						  
						
						  
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
  