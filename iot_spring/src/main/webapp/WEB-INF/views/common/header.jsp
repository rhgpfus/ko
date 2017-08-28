<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!-- include나 page는 가져와서 해석해준다. jsp파일만 적을수있다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<%
String version = "1.3.2";
String rootPath = request.getContextPath();
//request.getContextPath() 오른쪽과 같다. -----> "${pageContext.request.contextPath}" 루트패스로 바꿔줌.
boolean login = false;
String loginStr = "로그인";
if(login){
	loginStr = "로그아웃";
}
%>
<script src="<c:url value="/resources/js/jquery-3.2.1.js?version=<%=version%>"/>"></script>
<script src="<c:url value="/resources/js/jquery-ui-1.9.2.custom.js?version=<%=version%>"/>"></script>
<script src="<c:url value="/resources/js/jquery.fileupload.js?version=<%=version%>"/>"></script>
<script src="<c:url value="/resources/js/jquery.iframe-transport.js?version=<%=version%>"/>"></script>


<script src="<c:url value="/resources/ui/common.js?version=<%=version%>"/>"></script>
<script src="<c:url value="/resources/ui/btsp3.7.7/js/bootstrap.min.js?version=<%=version%>"/>"></script>
<script src="<c:url value="/resources/ui/btsp3.7.7/js/bootstrap-table.js?version=<%=version%>"/>"></script>
<script src="<c:url value="/resources/ui/btsp3.7.7/js/bootstrap-table.js?version=<%=version%>"/>"></script>

<link rel="stylesheet" href="<c:url value="/resources/ui/btsp3.7.7/css/bootstrap-theme.min.css?version=<%=version%>"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/ui/btsp3.7.7/css/bootstrap.min.css?version=<%=version%>"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/ui/btsp3.7.7/css/bootstrap-table.css?version=<%=version%>"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/ui/common.css?version=<%=version%>"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/ui/cover.css?version=<%=version%>"/>"/>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=rootPath%>/user/main">HOME</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li id="m1"><a href="<%=rootPath%>/user/list" id="list">유저리스트</a></li>
				<li id="m2"><a href="/board/user_information.jsp" id="user">유저정보</a></li>
				<!--<li id="m3"><a href="/goods/goods_list.jsp">사원정보게시판</a></li>-->
				<!--<li id="m4"><a href="/goods/vender_list.jsp">회사정보게시판</a></li>-->
				<li><a href="/user/logout.jsp"><%=loginStr%></a></li>
			</ul>
		</div>
		
	</div>
</nav>