<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%!

public void printStr(String str){
	System.out.println("dd");
}
%>
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
%>
<script src="<%=rootPath%>/js/jQuery-3.2.1.js"></script>
<script>
var rootPath = "<%=rootPath%>";

function doBoardMove(pageId){
	var url = "";
	if(pageId=="board"){
		url = rootPath + "/board/board_select.jsp";
	}else if(pageId=="main"){
		url = rootPath + "/";
	}else if(pageId=="boardInsert"){
		url = rootPath + "/board/board_insert.jsp";
	}
	location.href = url;
}
</script>
</html>