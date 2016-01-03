<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addMajor.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/jquery-2.1.4.min.js"></script>
  </head>
  
  <body>
    <form:form action="add" method="post" modelAttribute="major">
    	name: <form:input path="name"/><form:errors path="*"></form:errors><br />
    	parentID: <form:input path="parentid"/><br />
    	<input type="submit" value="submit" />
    </form:form>
    
    <select name="yjxkdm" id="yjxkdm" class="l_form_width02" style="width:174px; overflow:hidden;"><option value="0301">(0301)法学</option><option value="0302">(0302)政治学</option><option value="0303">(0303)社会学</option><option value="0304">(0304)民族学</option><option value="0305">(0305)马克思主义理论</option><option value="0306">(0306)公安学</option></select>
    
  </body>
<script type="text/javascript">
/* 	$("option").each(function(index) {
		var name = $(this).text().substr(6);
		$.post("add", {
			'name': name,
			parentid:"4"
		}, function(data, textStatus, req) {
			
		},"json");
		
	}); */
	var data =[{"mc":"艺术学理论","dm":"1301"},{"mc":"音乐与舞蹈学","dm":"1302"},{"mc":"戏剧与影视学","dm":"1303"},{"mc":"美术学","dm":"1304"},{"mc":"设计学","dm":"1305"}];
	
	
	for(var i=0; i<data.length; i++){
		console.log(data[i].mc);
		$.post("add", {
			'name': data[i].mc,
			parentid:"13"
		}, function(data, textStatus, req) {
			
		},"json");
	}
</script>
</html>
