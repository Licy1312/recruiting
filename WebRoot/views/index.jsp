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
		<div class="row">
			<form action="" method="get" class="clearfix">
				<div class="form-control-wrapper col-md-10" style="margin:20px;">
					<input type="text" class="form-control empty" name="keyword">
					<input type="hidden" name="major" value="${majorid }" />
					<input type="hidden" name="department" value="${departmentid }" />
					<span class="material-input"></span>
				</div>
				<button type="submit" class="btn btn-default"><i class="mdi-action-search"></i></button>
			</form>
		</div>
		<!-- 搜索 -->
		<div class="row search">
			<div class="col-md-10">
				<p>
					<span>学科:</span>
					<a href="${majorBase }&major=null" class="
						<c:if test="${majorid == -1 }">active</c:if>
					">不限</a>
					<c:forEach items="${majors}" var="child">
		   				<a href="${majorBase }&major=${child.id }" class="<c:if test="${child.id==majorid }">active</c:if>">${child.name }</a>
		   			</c:forEach>
				</p>
			</div>
			<div class="col-md-10">
				<p>
					<span>发布的单位：</span>
					<a href="${departmentBase }&department=null" class="
						<c:if test="${departmentid == -1 }">active</c:if>
					">不限</a>
					<c:forEach items="${department}" var="child">
		   				<a href="${departmentBase }&department=${child.id }" class="<c:if test="${child.id==departmentid }">active</c:if>">${child.name }</a>
		   			</c:forEach>
				</p>
			</div>
			<div class="row"></div>
		</div>
		<div class="col-md-10">
			<div class="panel panel-primary">
			    <div class="panel-heading">
			        <h3 class="panel-title">${subtitle }</h3>
			    </div>
			    <div class="panel-body">
			    	<c:forEach items="${requires }" var="r">
			        <div class="row shadow-z-1 withripple" style="padding: 16px 20px;" data-id="${r.id }">
			        	<div class="col-md-7">
			        		<div class="clearfix">
			        			<h4 class="pull-left job-title"><a href="require/${r.id }">${r.title }</a></h4>
			        		</div>
			        		<div>
			        			薪水：<span class="text-warning job-salary">${r.salary }</span>
			        		</div>
			        		<div>工作地址：<span class="job-address"> ${r.address }</span></div>
			        	</div>
			        	<div class="col-md-5">
			        		<h4 >组长：<a href="detail/${r.id }">${r.user.name }</a></h4>
			        		<p>${r.major.name }</p>
			        		<p>发布时间： ${r.startdate }</p>
			        	</div>
			        </div>
			        </c:forEach>
			    </div>
			</div>
		</div>
		<%@ include file="common/fooder.jsp" %>
	</div>
<div class="modal fade" id="myModal"  role="dialog" ria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" aria-hidden="true">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
               	<p>
        			薪水：<span class="text-warning job-salary"></span>
        		</p>
        		<p>工作地址：<span class="job-address"> </span></p>
        		<pre class="job-intro"></pre>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <c:if test="${sessionScope.loginUser != null }">
                <button id="aplly-job" type="button" class="btn btn-primary" data-id="">提交简历</button>
                <button id="aplly-job1" type="button" class="btn btn-primary disabled hidden">已经提交</button>
                </c:if>
            </div>
        </div>
    </div>
</div>
	<script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/material.min.js"></script>
    <script src="js/metisMenu.min.js"></script>
    <script src="js/home.js"></script>
  </body>
</html>
  