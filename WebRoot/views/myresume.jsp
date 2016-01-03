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
  </head>
  <body>

	<%@ include file="common/header.jsp" %>
	<div class="container">
		<div class="col-md-8">
			<div class="bs-component well">
				<form:form method="post" action="user/myresume" modelAttribute="user" class="form-horizontal">
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
						        <form:input path="username" class="form-control" id="inputEmail" disabled="true"/>
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
						    <label for="highestEducation" class="col-lg-2 control-label">最高学历</label>
						    <div class="col-lg-10">
						    	<%
									Map<String, String> genders = new HashMap();
									genders.put("硕士", "硕士");
									genders.put("博士", "博士");
									genders.put("博士后", "博士后");
									
									request.setAttribute("genders", genders);
								 %>
								 <form:select path="highestEducation" items="${genders }" class="form-control"></form:select>
						    </div>
						</div>
						<div class="form-group">
						    <label for="school" class="col-lg-2 control-label">毕业学校</label>
						    <div class="col-lg-10">
						        <form:input path="school" class="form-control" placeholder="毕业学校"/>
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
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <button class="panel-title addAP btn-primary" data-toggle="modal" data-target="#addAP" data-type="article">添加文章</button>
			  </div>
			  <table class="table article">
			 	<thead>
				  	<tr>
					  	<th>文章标题</th>
					  	<th>简介</th>
				  	</tr>
			  	</thead>
			  	<c:forEach items="${articles }" var="c" >
			  	<tr>
			  		<td>${c.title }</td>
			  		<td>${c.local }</td>
			  	</tr>
			  	</c:forEach>
			  </table>
			</div>
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <button class="panel-title addAP btn-primary" data-toggle="modal" data-target="#addAP" data-type="project">添加项目</button>
			  </div>
			  <table class="table project">
			  	<tr>
			  		<th>项目标题</th>
			  		<th>简介</th>
			  	</tr>
			  	<c:forEach items="${projects }" var="c" >
			  	<tr>
			  		<td>${c.name }</td>
			  		<td>${c.intro }</td>
			  	</tr>
			  	</c:forEach>
			  </table>
			</div>
		</div>
		<div class="col-md-4">
			<div class="row">
				<a href="user/dilivery" class="col-md-6">
					<i class="mdi-content-mail"></i>
					<span>投递箱</span>
				</a>
				<a href="user/collection" class="col-md-6">
					<i class="mdi-action-grade"></i>
					<span>收藏夹</span>
				</a>
			</div>
			<div class="row" id="mr_upload">
				<c:if test="${!empty user.filepath}">
					<button type="button" class="close" data-dismiss="alert" id="mr_del">×</button>
					<a class="btn btn-block well" href="user/myresume/download" title="${user.filename }">${user.filename }</a>
				</c:if>
				<c:if test="${empty user.filepath}">
					<a href="#" class="btn btn-block well" data-toggle="modal" data-target="#uploadFileModal">上传我的附件简历</a>
				</c:if>
			</div>
			<div class="row">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>职位</th>
							<th>状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${applies }" var="a">
							<tr>
								<td class="title">${a.required.title }</td>
								<c:choose>
									<c:when test="${a.isConfirm == 1 }"><td class="success">通过</td></c:when>
									<c:when test="${a.isConfirm == 0 }"><td class="danger">未通过</td></c:when>
									<c:otherwise><td>待审核</td></c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<%@ include file="common/fooder.jsp" %>
	</div>
<div class="modal fade" id="uploadFileModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">上传个人简历</h4>
      </div>
	      <div class="modal-body">
      		<form id="uploadForm" action="user/myresume" method="post" enctype="multipart/form-data">
        		<input type="text" readonly="" class="form-control floating-label" placeholder="选择文件">
           		<input type="file" name="upload" id="inputFile" multiple="">
           	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="buttion" class="btn btn-primary" id="upload">确认</button>
	      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="addAP">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加</h4>
      </div>
	      <div class="modal-body">
	      	<form action="" class="form-horizontal">
	      		<div class="form-group">
	      			<label for="title" class="col-lg-2 control-label">标题:</label>
	      			<div class="col-lg-10">
	      				<input type="text" name="title" id="title" class="form-control"/>
	      			</div>
	      		</div>
	      		<div class="form-group">
	      			<label for="description" class="col-lg-2 control-label">简介:</label>
	      			<div class="col-lg-10">
	      				<input type="text" name="description" id="description" class="form-control"/>
	      			</div>
	      		</div>
      		</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="buttion" class="btn btn-primary submit">确认</button>
	      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/material.min.js"></script>
<script>
$(function(){
	$.material.init();
	//上传简历
	$("#upload").click(function(){
		var formData = new FormData();
		
		var data = $("#uploadForm").find("input[type=file]").get(0).files[0];
		if(data){
			formData.append("file", data);
			$.ajax({
		       url: 'user/myresume/upload',
		       data: formData,
		       processData: false,
		       contentType:false,
		       success:uploadSuccess,
		       type: 'POST'
		   	});
		}
	});
	//删除上传的简历文件
	$("#mr_upload").on("click", "#mr_del", function(){
		$.post("user/myresume/del", {_method:"DELETE"}, function(data, textStatus, req) {
			console.log(data);
			var $mr_upload = $("#mr_upload");
			$mr_upload.html(' ');
			$mr_upload.append('<a href="#" class="btn btn-block well" data-toggle="modal" data-target="#uploadFileModal">上传我的附件简历</a>');
		})
	})
	
	//添加文章或项目
	$(".addAP").click(function(){
		var _this = $(this);
		var type = _this.data('type');
		addAP(type, _this);
	});
});
function uploadSuccess(res){
	var $fileA = $('<button type="button" class="close" data-dismiss="alert" id="mr_del">×</button><a class="btn btn-block well" href="'+res.data.href
					+'" title="'+res.data.fileName+'">'+res.data.fileName
					+'</a>');
	var $mr_upload = $("#mr_upload");
	$mr_upload.find("a").remove();
	$mr_upload.append($fileA);
	$("#uploadFileModal").modal('hide');
}
function addAP(type, _this){
	$('#addAP').find('.submit').click(function(){
		var title = $("#title").val();
		var description = $("#description").val();
		$.post("user/myresume/addAP", {
			type:type, 
			title:title, 
			description:description
		} , function(data, textStatus, req) {
			_this.parent().siblings("table").append('<tr> <td>'+title+'</td> <td>'+description+'</td>');
			$('#addAP').modal('hide');
		},"json");
	});
}
</script>
  </body>
</html>
  