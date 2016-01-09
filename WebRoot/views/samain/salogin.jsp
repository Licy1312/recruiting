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
	<script type="text/javascript">
		var flag=false;
        function checkForm(){
            if (flag==true){
                return false;
            }
            flag=true;
            document.form.submit();
      }
	</script>
  </head>
  <body>
	<div class="container">
		<div class="well bs-component">
			<div style="margin-left: 360px; width: 500px;">
				<h3>欢迎登陆2015级硕士SA课程展示平台</h3>
			</div>
			<form class="form-horizontal" action="salogin" method="post" style="margin-left: 300px;width: 500px;">
			    <fieldset>
			        <div class="form-group">
			    		
			    		<c:if test="${errors != null }">
			    			<div class="col-lg-10 alert alert-dismissable alert-warning" style="margin-left: 50px; width: 480px;">
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
			            <label for="inputEmail" class="col-lg-2 control-label">学&nbsp;号：</label>
			            <div class="col-lg-10">
			                <input type="text" name="email" class="form-control" id="inputEmail" placeholder="Username">
			            </div>
			        </div>
			        <div class="form-group">
			            <label for="inputPassword" class="col-lg-2 control-label">密&nbsp;码：</label>
			            <div class="col-lg-10">
			                <input type="password" name="pwd" class="form-control" id="inputPassword" placeholder="Password">
			            </div>
			        </div>
			        
			        <div class="form-group">
			            <div class="col-lg-10 col-lg-offset-2">
			            	<button type="reset" class="btn btn-primary">取消</button>
			                <button type="submit" class="btn btn-primary" onclick=checkForm()>登陆</button>
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
  