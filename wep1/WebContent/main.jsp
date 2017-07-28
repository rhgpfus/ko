<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>고똥 세상에 온걸 환영해</title>
<body>
	<jsp:include page="/common/top.jsp" flush="false">
		<jsp:param value="<%=login%>" name="login"/>
	</jsp:include>
    <div class="container">
      <div class="starter-template">
        <h1>메인 화면</h1>
        <p class="lead">이거슨 메인 화면입니다.</p>
      </div>
    </div><!-- /.container -->
</body> 
</html>