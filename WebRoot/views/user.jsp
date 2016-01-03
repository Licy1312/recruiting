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

	<%@ include file="common/header.jsp" %>
	<div class="container">
		<div class="col-md-5">
			<div class="bs-component well">
				<form:form method="post" action="user/setting" modelAttribute="user" class="form-horizontal">
					<legend>修改个人信息</legend>
					<fildset>
						<div class="form-group">
							<c:if test="${message != null }">
				    			<div class="col-lg-10 col-lg-offset-2 alert alert-dismissable alert-success">
								    <button type="button" class="close" data-dismiss="alert">×</button>
								    <p>${message }</p>
								</div>
				    		</c:if>
						</div>
						<div class="form-group">
						    <label for="inputEmail" class="col-lg-2 control-label">Email</label>
						    <div class="col-lg-10">
						        <form:input path="username" class="form-control" id="inputEmail" placeholder="Email"/>
						    </div>
						</div>
						<div class="form-group">
						    <label for="inputName" class="col-lg-2 control-label">姓名</label>
						    <div class="col-lg-10">
						        <form:input path="name" class="form-control" id="inputName" placeholder="姓名"/>
						    </div>
						</div>
						<div class="form-group">
						    <label for="phone" class="col-lg-2 control-label">手机</label>
						    <div class="col-lg-10">
						        <form:input path="phone" class="form-control" placeholder="手机"/>
						    </div>
						</div>
						<div class="form-group">
						    <div class="col-lg-10 col-lg-offset-2">
						    	<form:hidden path="id"/>
						        <button type="submit" class="btn btn-primary">提交  </button>
						    </div>
						</div>
					</fildset>
				</form:form>
			</div>
		</div>
		<div class=" col-md-7">
			<table class="table table-striped table-hover well">
				<tr>
					<th>单位名</th>
					<th>职位</th>
					<th>薪水</th>
					<th>投递时间</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${applies }" var="a">
					<tr>
						<td>${a.required.department.name }</td>
						<td class="title">${a.required.title }</td>
						<td>${a.required.salary }</td>
						<td>${a.applytime }</td>
						<td class="delapply" data-id="${a.id }"><a href="javascript:;" >删除</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<%@ include file="common/fooder.jsp" %>
	</div>
</div>
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">
        <p>确认删除？</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="delapply">确认</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	<script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/material.min.js"></script>
    <script src="js/metisMenu.min.js"></script>
    <script src="js/home.js"></script>
    <script>
    $(function(){
    	var id;
    	var del;
    	$(".delapply").click(function() {
    		del = $(this);
    		var title = del.siblings(".title").html();
    		id = del.data("id");
    		var myModal = $("#myModal");
    		myModal.find("h4").html(title);
    		myModal.modal();
    	});
    	$("#delapply").click(function(){
    		
    		$.post("user/delapply", {id:id}, function(data, textStatus, req) {
    			$("#myModal").modal('hide')
    			del.parent().remove();
    		}, "json");
    	});
    });
    </script>
  </body>
</html>
  