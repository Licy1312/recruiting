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
                    <h1 class="page-header">用户管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
            	<div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        	<i class="fa fa-users"></i>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form:form action="hr/setting" method="post" modelAttribute="department" class="form-horizontal">
                            	<div class="form-group">
									<c:if test="${message != null }">
						    			<div class="col-lg-9 col-lg-offset-2 alert alert-dismissable alert-success">
										    <button type="button" class="close" data-dismiss="alert">×</button>
										    <p>${message }</p>
										</div>
						    		</c:if>
								</div>
                            	<div class="form-group">
                            		<label for="name" class="col-lg-2 control-label">名字：</label>
                            		<div class="col-lg-9">
                            			<form:input path="name" class="form-control"/>
                            		</div>
                            	</div>
                            	<div class="form-group">
                            		<label for="address" class="col-lg-2 control-label">地址：</label>
                            		<div class="col-lg-9">
                            			<form:input path="address" class="form-control"/>
                            		</div>
                            	</div>
                            	<div class="form-group">
                            		<label for="url" class="col-lg-2 control-label">官网：</label>
                            		<div class="col-lg-9">
                            			<form:input path="url" class="form-control"/>
                            		</div>
                            	</div>
                            	<div class="form-group">
                            		<input type="hidden" name="id" value="${loginDepart.id }" />
								    <div class="col-sm-offset-2 col-sm-10">
								      <button type="submit" class="btn btn-default">提交</button>
								    </div>
								</div>
                            </form:form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

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
  