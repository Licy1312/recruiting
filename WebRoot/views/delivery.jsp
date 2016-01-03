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
	<table class="table">
		<tr>
			<th>状态</th>
			<th>约谈时间</th>
			<th>备注</th>
			<th>单位名</th>
			<th>职位</th>
			<th>薪水</th>
			<th>投递时间</th>
		</tr>
		<c:forEach items="${applies }" var="a">
			<tr>
				<td class="active">${a.time }</td>
				<td class="info">${a.remark }</td>
				<c:choose>
					<c:when test="${a.isConfirm == 1 }"><td class="success">通过</td></c:when>
					<c:when test="${a.isConfirm == 0 }"><td class="danger">未通过</td></c:when>
					<c:otherwise><td>待审核</td></c:otherwise>
				</c:choose>
				<td>${a.required.department.name }</td>
				<td><a href="require/${a.id }">${a.required.title }</a></td>
				<td>${a.required.salary }</td>
				<td>${a.applytime }</td>
			</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="common/fooder.jsp" %>
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
  