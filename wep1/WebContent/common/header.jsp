<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

<%
String userId = (String) session.getAttribute("userid");
String userName = "";
int age = 0;
String address = "";
String hp1 = "";
String hp2 = "";
String hp3 = "";
boolean login = false;
if(userId!=null){
	userName = (String) session.getAttribute("username");
	age = (int) session.getAttribute("age");
	address = (String) session.getAttribute("address");
	hp1 = (String) session.getAttribute("hp1");
	hp2 = (String) session.getAttribute("hp2");
	hp3 = (String) session.getAttribute("hp3");
	login = true;
}
String rootPath = request.getContextPath();    //path가 무슨이름이건 거기잇는걸 가져온다.
Date toDate = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
String toDateStr = sdf.format(toDate);

String init = request.getParameter("init");
String defaultUrl = "";
if(init==null && !login){
	defaultUrl = rootPath + "/user/login.jsp?init=1";
	response.sendRedirect(defaultUrl);
}
String nowUrl = request.getRequestURI();
String loginStr = "로그인";
if(login){
	loginStr = "로그아웃";
}
String version = "1.2";
%>
<script src="<%=rootPath%>/js/jquery-3.2.1.js?version=<%=version%>"></script>
<script src="<%=rootPath%>/ui/btsp3.7.7/js/bootstrap.min.js?version=<%=version%>"></script>
<script src="<%=rootPath%>/ui/btsp3.7.7/js/bootstrap-table.js?version=<%=version%>"></script>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.7.7/css/bootstrap-theme.min.css?version=<%=version%>"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.7.7/css/bootstrap.min.css?version=<%=version%>"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/common.css?version=<%=version%>"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/cover.css?version=<%=version%>"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.7.7/css/bootstrap-table.css?version=<%=version%>"/>

<script>
var rootPath = "<%=rootPath%>";
$(document).ready(function(){
	var nowUrl = "<%=nowUrl%>";
	var obj = $("a[href='" + nowUrl + "']").parent().attr("class","active");
})
function doBoardMove(pageId,bNum){
	var url = "<%=rootPath%>";
	if(pageId=="board"){
		url += rootPath + "/board/board_select.jsp";
	}else if(pageId=="main"){
		url += rootPath + "/main.jsp";
	}else if(pageId=="boardInsert"){
		url += rootPath + "/board/board_insert.jsp";
	}else if(pageId=="boardUpdate",bNum){
		url += rootPath + "/board/board_update.jsp?boardnum=" + bNum;
	}
	location.href = url;
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
			<a class="navbar-brand" href="<%=rootPath%>/main.jsp">HOME</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li id="m1"><a href="/board/board_select.jsp">게시판가기</a></li>
				<li id="m2"><a href="/board/user_information.jsp">유저정보가기</a></li>
				<li id="m3"><a href="#contact">권한정보가기</a></li>
				<li><a href="/user/logout.jsp"><%=loginStr%></a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>

