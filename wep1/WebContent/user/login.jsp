<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.UserInfo" %>

<link rel="stylesheet" href="<%=rootPath%>/ui/signin.css"/>

<jsp:include page="/common/top.jsp" flush="false">
	<jsp:param value="<%=login%>" name="login"/>
</jsp:include>
	<div class="container">
		<form class="form-signin" action="<%=rootPath%>/user/login_true.jsp">
			<h2 class="form-signin-heading">Please login</h2>
			<label for="inputEmail" class="sr-only">Id</label> <input type="text"
				id="id" name="id" class="form-control" placeholder="Id" required
				autofocus> <label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="password" name="password"
				class="form-control" placeholder="Password" required>
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login
				</button>
		</form>

	</div>
</html>