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
%>
<script src="<%=rootPath%>/js/jquery-3.2.1.js"></script>
<script src="<%=rootPath%>/ui/btsp3.7.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.7.7/css/bootstrap-theme.min.css"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.7.7/css/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/common.css"/>
<script>
var rootPath = "<%=rootPath%>";

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