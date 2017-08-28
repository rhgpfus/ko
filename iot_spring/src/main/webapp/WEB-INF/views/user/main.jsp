<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<title>main</title>
<body>
	<div class="site-wrapper">
		<div class="site-wrapper-inner">
			<div class="cover-container">
				<div class="masthead clearfix">
            		<div class="inner">
             			<nav>
                			<ul class="nav masthead-nav"></ul>
              			</nav>
            		</div>
          		</div>
			<div class="inner cover">
            	<h1 class="cover-heading">${userid}님 어서옵쇼.</h1>
            	<p class="lead">spring page</p>
            	<p class="lead"></p>
         	</div>
			<div class="mastfoot">
            	<div class="inner">
              		<p>Cover template for <a href="http://getbootstrap.com">Bootstrap</a>, by <a href="https://twitter.com/mdo">@mdo</a>.</p>
            	</div>
          	</div>
			</div>
		</div>
	</div>
</body>
<script>
$(document).ready(function(){
	$("a[id='list']").click(function(){
		location.href = url;
	})
})
</script>