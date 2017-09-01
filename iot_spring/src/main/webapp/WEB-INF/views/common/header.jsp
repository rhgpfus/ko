<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!-- include나 page는 가져와서 해석해준다. jsp파일만 적을수있다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="version" value="1.3.2"></c:set>
<c:set var="rootPath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="nowUrl" value="${pageContext.request.requestURI}"/>
<!-- JSTL이다. 6번라인을 보면 이름을 c로 시작하게 만들엇다. -->
</head>
<%
//String version = "1.3.2";
//String rootPath = request.getContextPath();
//request.getContextPath() 오른쪽과 같다. -----> "${pageContext.request.contextPath}" 루트패스로 바꿔줌.
%>
<script src="<c:url value="/resources/js/jquery-3.2.1.js?version=${version}"/>"></script>
<script src="<c:url value="/resources/js/jquery-ui-1.9.2.custom.js?version=${version}"/>"></script>
<script src="<c:url value="/resources/js/jquery.fileupload.js?version=${version}"/>"></script>
<script src="<c:url value="/resources/js/jquery.iframe-transport.js?version=${version}"/>"></script>


<script src="<c:url value="/resources/ui/common.js?version=${version}"/>"></script>
<script src="<c:url value="/resources/ui/btsp3.7.7/js/bootstrap.min.js?version=${version}"/>"></script>
<script src="<c:url value="/resources/ui/btsp3.7.7/js/bootstrap-table.js?version=${version}"/>"></script>
<script src="<c:url value="/resources/ui/btsp3.7.7/js/bootstrap-table.js?version=${version}"/>"></script>

<link rel="stylesheet" href="<c:url value="/resources/ui/btsp3.7.7/css/bootstrap-theme.min.css?version=${version}"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/ui/btsp3.7.7/css/bootstrap.min.css?version=${version}"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/ui/btsp3.7.7/css/bootstrap-table.css?version=${version}"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/ui/common.css?version=${version}"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/ui/cover.css?version=${version}"/>"/>

<script>
var rootPath = "${rootPath}";
$(document).ready(function(){
	var nowUrl = "${nowUrl}";
	var obj = $("a[href='" + nowUrl + "']").parent().attr("class", "active");
})
function doMovePage(pageId){
	var url = "${rootPath}";
	if(pageId=="board"){
		url += "/board/board_select.jsp";
	}else if(pageId=="main"){
		url += "/";
	}else if(pageId=="insertBoard"){
		url += "/board/board_insert.jsp";
	}
	location.href = url;
}

function alertOp(){
	alert($("$op").val());
}

</script>
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
			<a class="navbar-brand" href="${rootPath}/user/main">HOME</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li id="m1"><a href="${rootPath}/user/list" id="list">유저리스트</a></li>
				<li id="m2"><a href="/board/user_information.jsp" id="user">유저정보</a></li>
				<!--<li id="m3"><a href="/goods/goods_list.jsp">사원정보게시판</a></li>-->
				<!--<li id="m4"><a href="/goods/vender_list.jsp">회사정보게시판</a></li>-->
				<li><a href="${rootPath}/user/logout">로그아웃</a></li>
			</ul>
		</div>
		
	</div>
</nav>