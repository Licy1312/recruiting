<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${pageContext.request.contextPath}/sahome">SA硕士课程展示平台</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/sahome">首页</a></li>
        
        <li>
        
        <a href="${pageContext.request.contextPath}/recruiting">人员招聘分组</a> 
        </li>
        <li><a href="${pageContext.request.contextPath}/news">新闻发布</a></li>
        <li><a href="${pageContext.request.contextPath}/material">材料展示</a></li>
        <li><a href="${pageContext.request.contextPath}/device">设备统计分析</a></li>
        <li style="margin-top:20px;">
        	 <ul id="cssdropdown">
				<li class="mainitems">
					<a href="${pageContext.request.contextPath}/chatRoom">聊天室</a>
					<ul class="subuls">
						<li><a href="#">进入聊天</a></li>
						<li><a href="#">创建话题</a></li>
						
					</ul>
				</li>
			</ul>
        </li>
       
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<c:choose>
		  <c:when test="${sessionScope.loginUser != null }">
		    <li class="dropdown">
      			<a href="#" class="dropdown-toggle" data-toggle="dropdown"> ${sessionScope.loginUser.username } <span class="caret"></span></a>
      			<ul class="dropdown-menu">
      				<li><a href="salogout">退出</a></li>
      			</ul>
      		</li>
		  </c:when>
		</c:choose>
      </ul>
    </div>
  </div>
</nav>