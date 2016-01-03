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
    
    <title>My JSP 'check.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/metisMenu.min.css" />
	<link rel="stylesheet" href="css/morris.css" />
	<link rel="stylesheet" href="css/admin.css" />

  </head>
  <body>
	<div id="wrapper">
		<%@ include file="header.jsp" %>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">投递的用户</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<ul class="list-group">
					  <li class="list-group-item">用户名：${apply.user.name }</li>
					  <li class="list-group-item">邮箱：${apply.user.username }</li>
					  <li class="list-group-item">电话：${apply.user.phone }</li>
					  <li class="list-group-item">最高学历：${apply.user.highestEducation }</li>
					  <li class="list-group-item">毕业学校：${apply.user.school }</li>
					  <li class="list-group-item">简历：<a href="hr/users/download/${apply.user.id }">${apply.user.filename }</a></li>
					  <li class="list-group-item">申请的时间：${apply.applytime }</li>
					  <li class="list-group-item">申请的职位：${apply.required.title }</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<form:form action="hr/users/confirm" method="post" modelAttribute="apply">
						<%
							Map<String, String> confirm = new HashMap();
							confirm.put("1", "通过");
							confirm.put("0", "拒绝");
							
							request.setAttribute("confirm", confirm);
						 %>
						 <div class="form-group">
						 	<label for="isConfirm">是否通过</label>
						 	<form:radiobuttons path="isConfirm" items="${confirm }"/>
						 </div>
						 <div class="form-group">
							<label for="time">约谈时间</label>
							<form:input path="time" class="form-control"/>
						</div>
						<div class="form-group">
							<label for="ramark">备注</label>
							<form:input path="remark" class="form-control"/>
						</div>
						
						<input type="hidden" name="id" value="${apply.id }" />
						<button type="submit" class="btn btn-default">提交</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/metisMenu.min.js"></script>
    <script src="js/raphael-min.js"></script>
    <script src="js/morris.min.js"></script>
    <script src="js/admin.js"></script>
    <script>
    $(document).ready(function() {
	
    });
    </script>
  </body>
</html>
