<div class="col-md-3 col-md-pull-9">
  <ul id="side-menu" class="nav">
  	<c:forEach items="${requestScope.majors}" var="major">
  	<li class="shadow-z-2 withripple">
      	<a href="#" >${major.name } <i class="mdi-navigation-chevron-right" style="float:right;margin-top: 5%;"></i> </a>
      	<ul class="collapse"  aria-expanded="false">
   			<c:forEach items="${major.children}" var="child">
   				<a href="major/${child.id }">${child.name }</a>
   			</c:forEach>
      	</ul>
  	</li>
   </c:forEach>
  </ul>
</div>
