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
	
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/material.min.css" />
	<link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
	<div class="container">
		<div class="well bs-component">
			<form class="form-horizontal" action="register" method="post">
			    <fieldset>
			    	<div class="form-group">
			    		<legend class="col-lg-2">注册</legend>
			    		<c:if test="${errors != null }">
			    			<div class="col-lg-10 alert alert-dismissable alert-warning">
							    <button type="button" class="close" data-dismiss="alert">×</button>
							    <h4>警告!</h4>
							    <p>${errors }</p>
							</div>
			    		</c:if>
			    	</div>
			        <div class="form-group">
			            <label for="inputEmail" class="col-lg-2 control-label">邮箱</label>
			            <div class="col-lg-10">
			                <input type="text" name="email" class="form-control" id="inputEmail" placeholder="Email">
			            </div>
			        </div>
			        <div class="form-group">
			            <label for="inputPassword" class="col-lg-2 control-label">密码</label>
			            <div class="col-lg-10">
			                <input type="password" name="pwd" class="form-control" id="inputPassword" placeholder="密码">
			            </div>
			        </div>
			        <div class="form-group">
			            <label for="inputPassword2" class="col-lg-2 control-label">密码（重复）</label>
			            <div class="col-lg-10">
			                <input type="password" name="pwd1" class="form-control" id="inputPassword2" placeholder="密码">
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-lg-2 control-label"></label>
			            <div class="col-lg-10">
			                <div class="radio radio-primary">
			                    <label>
			                        <input type="radio" name="type" id="optionsRadios1" value="1" checked="">
			                       	 找工作
			                    </label>
			                </div>
			                <div class="radio radio-primary">
			                    <label>
			                        <input type="radio" name="type" id="optionsRadios2" value="2">
			                        	招人
			                    </label>
			                </div>
			            </div>
			        </div>
			        <div class="form-group">
			            <div class="col-lg-10 col-lg-offset-2">
			                <button type="submit" class="btn btn-primary">提交</button>
			                <ul class="pager pull-right">
			                	<li class="next"><a href="login">已有账号直接登陆 →</a></li>
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
  