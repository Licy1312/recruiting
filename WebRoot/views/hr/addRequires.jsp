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
                    <h1 class="page-header">招聘需求管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
            	<div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	${subtitle }
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                             	<div class="col-lg-11">
                             		<form:form action="hr/requires/add" method="post" modelAttribute="required" class="form-horizontal" role="form">
	                               		<input type="hidden" name="user.id" value="${sessionScope.loginDepart.id }" />
	                                  	<div class="form-group">
	                                       <label class="col-lg-2 control-label">类别</label>
	                                       <div class="col-lg-10">
	                                       		<select id="major-0" class="form-control">
	                                       			<c:forEach items="${majors }" var="m">
	                                       				<option value="${m.id }">${m.name }</option>
	                                       			</c:forEach>
	                                       		</select>
	                                       		<select id="major-1" name="major.id" class="form-control">
	                                       			
	                                       		</select>
	                                       </div>
	                                  	</div>
	                                  	<div class="form-group">
	                                       <label class="col-lg-2 control-label">标题</label>
	                                       <div class="col-lg-10">
	                                       		<form:input path="title" class="form-control"/>
	                                       		<p class="btn-danger"><form:errors path="title"></form:errors></p>
	                                       </div>
	                                  	</div>
	                                  	<div class="form-group">
	                                       <label class="col-lg-2 control-label">薪水</label>
	                                       <div class="col-lg-10">
	                                       		<form:input path="salary" class="form-control"/>
	                                       </div>
	                                  	</div>
	                                  	<div class="form-group">
	                                       <label class="col-lg-2 control-label">工作地址</label>
	                                       <div class="col-lg-10">
	                                       		<form:input path="address" class="form-control"/>
	                                       </div>
	                                  	</div>
	                                  	<div class="form-group">
	                                       <label class="col-lg-2 control-label">职位介绍</label>
	                                       <div class="col-lg-10">
	                                       		<form:textarea path="intro" class="form-control" rows="20"/>
	                                       </div>
	                                  	</div>
	                                  	<div class="form-group">
	                                       <div class="col-lg-10 col-lg-offset-2">
	                                       		<c:if test="${required.id != null }">
	                                       			<form:hidden path="id"/>
	                                       			<a href="admin/requires/show" class="btn btn-success">返回</a>
	                                       		</c:if>
	                                       		<button type="submit" class="btn btn-default">提交</button>
	                                       </div>
	                                  	</div>
		                              </form:form>
                             	</div>
                            </div>
                            <!-- /.table-responsive -->
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
    	addMajor(1);
        $("#major-0").change(function(){
        	addMajor(this.value);
        });
    });
    function addMajor(id){
    	$.post("hr/requires/getMajor",{id:id},function(data){
        		var major = $("#major-1");
        		major.html('');
        		for(var i=0; i<data.length; i++){
        			major.append('<option value="'+data[i].id+'">'+ data[i].name +'</option>');
        		}
        	},"json");
    }
    </script>
  </body>
</html>
  