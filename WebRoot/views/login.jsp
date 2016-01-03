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
    
    <title>用户登陆</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/material.min.css" />
	<link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
	<div class="container">
		<div class="well bs-component">
			<form class="form-horizontal" action="login" method="post">
			    <fieldset>
			        <div class="form-group">
			    		<legend class="col-lg-2">登陆</legend>
			    		<c:if test="${errors != null }">
			    			<div class="col-lg-10 alert alert-dismissable alert-warning">
							    <button type="button" class="close" data-dismiss="alert">×</button>
							    <h4>警告!</h4>
							    <p>${errors }</p>
							</div>
			    		</c:if>
			    	</div>
			    	<div class="form-group">
						<c:if test="${messages != null }">
			    			<div class="col-lg-10 col-lg-offset-2 alert alert-dismissable alert-success">
							    <button type="button" class="close" data-dismiss="alert">×</button>
							    <p>${messages }</p>
							</div>
			    		</c:if>
					</div>
			        <div class="form-group">
			            <label for="inputEmail" class="col-lg-2 control-label">邮箱</label>
			            <div class="col-lg-10">
			                <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email">
			            </div>
			        </div>
			        <div class="form-group">
			            <label for="inputPassword" class="col-lg-2 control-label">密码</label>
			            <div class="col-lg-10">
			                <input type="password" name="pwd" class="form-control" id="inputPassword" placeholder="Password">
			            </div>
			        </div>
			        
			        <div class="form-group">
			            <div class="col-lg-10 col-lg-offset-2">
			                <button type="submit" class="btn btn-primary">提交</button>
			                <ul class="pager pull-right">
			                	<li class="next"><a href="register">注册 →</a></li>
			                </ul>
			            </div>
			        </div>
			    </fieldset>
			</form>
		</div>
		
	</div>

	<script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/material.min.js"></script>
    <script type="text/javascript">
    	$.material.init();
    </script>
  </body>
</html>
  