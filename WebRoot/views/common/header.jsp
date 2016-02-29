<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index">人员招聘分组</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <!-- <li class="active"><a href="index">首页</a></li> -->
        <li><a href="sahome">返回到主页</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<c:choose>
		  <c:when test="${sessionScope.loginUser != null }">
		    <li class="dropdown">
      			<a href="#" class="dropdown-toggle" data-toggle="dropdown"> ${sessionScope.loginUser.username } <span class="caret"></span></a>
      			<ul class="dropdown-menu">
      				<li><a href="user/myresume">个人设置</a></li>
      				<!-- <li><a href="logout">退出</a></li> -->
      			</ul>
      		</li>
		  </c:when>
		  <c:when test="${sessionScope.loginDepart != null}">
		    <li class="dropdown">
      			<a href="#" class="dropdown-toggle" data-toggle="dropdown"> ${sessionScope.loginDepart.username } <span class="caret"></span></a>
      			<ul class="dropdown-menu">
      				<li><a href="hr/">进入控制台</a></li>
      				<!-- <li><a href="logout">退出</a></li> -->
      			</ul>
      		</li>
		  </c:when>
		  <c:otherwise>
		    <li><a href="login">登陆</a></li>
        	<li class="hidden"><a href="register">注册</a></li>
		  </c:otherwise>
		</c:choose>
      </ul>
    </div>
  </div>
</nav>