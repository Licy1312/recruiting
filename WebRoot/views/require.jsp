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
		<div class="page-header">
			<h1>${require.title } </h1>
		</div>
		<div class="row">
			<div class="col-md-9">
				<a href="javascript:void(0)" 
					title="收藏该职位" 
					class="btn <c:if test="${isCollected == true }">btn-primary</c:if><c:if test="${isCollected == false }">btn-default</c:if> btn-fab btn-raised mdi-action-grade" 
					id="collection" 
					data-id="${require.id }"
					data-collected="${isCollected }" ></a>
				<div >
					<p>薪水：${require.salary } / 工作地点： ${require.address }</p>
				</div>
				<div>
					<h3 style="border-left: 7px solid #009688;">职位描述 </h3>
					<p class="lead">${require.intro }</p>
				</div>
				<div>
					<button id="aplly-job" type="button" class="btn btn-primary pull-right <c:if test="${isApplied == true }">hidden</c:if>" data-id="${require.id }">投个简历</button>
                	<button id="aplly-job1" type="button" class="btn btn-default disabled pull-right <c:if test="${isApplied != true }">hidden</c:if> ">已经投递</button>
				</div>
			</div>
			<div class=" col-md-3">
				<div class="panel-primary">
				    <div class="panel-heading">
				        <h3 class="panel-title">${require.user.name }</h3>
				    </div>
				    <div class="panel-body">
				        <p>单位地址：${require.user.username }</p>
				    </div>
				</div>
			</div>
		</div>
		
		<%@ include file="common/fooder.jsp" %>
	</div>
</div>

	<script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/material.min.js"></script>
    <script src="js/metisMenu.min.js"></script>
    <script src="js/home.js"></script>
    <script>
    $(function(){
		$("#collection").click(function(){
	    	var _this = $(this);
	    	console.log(_this.data("collected"));
	    	//是否已经收藏
	    	if(_this.data("collected") == false){
	    		$.post("user/collection",{id:_this.data("id")}, function(data){
	    			_this.data("collected", true);
	    			_this.removeClass("btn-default");
	    			_this.addClass("btn-primary");
	    		},"json")
	    	}else{
	    		$.post("user/collection", {_method:"DELETE",id:_this.data("id")}, function(data, textStatus, req) {
	    			_this.data("collected", false);
	    			_this.removeClass("btn-primary");
	    			_this.addClass("btn-default");
	    		}, 'json');
	    	}
	    	
	    });
	    
	    $("#aplly-job").click(function(){
	    	var _this = $(this);
	    	$.post("user/apply", {id:_this.data("id")},function(data){
	    		console.log(data);
	    		$("#aplly-job").addClass("hidden");
	    		$("#aplly-job1").removeClass("hidden");
	    	},"json");
	    });
    });
    </script>
  </body>
</html>
  