<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>고똥 세상에 온걸 환영해</title>

	<link href="<%=rootPath%>/ui/cover.css" rel="stylesheet">
	<jsp:include page="/common/top.jsp" flush="false">
		<jsp:param value="<%=login%>" name="login"/>
	</jsp:include>
	<body>
	
    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              
            </div>
          </div>

          <div class="inner cover">
            <h1 class="cover-heading"><%=userId%>님 어서옵쇼</h1>
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
</html>