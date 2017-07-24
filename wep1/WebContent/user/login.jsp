<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.UserInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function doLogout(){
	location.href="/user/login_true.jsp";
}
function doBoardMove(){
	location.href="/board/board.jsp";
}
</script>
<body>
<%
String userId = (String) session.getAttribute("userid");
if(userId!=null){
	String userName = (String) session.getAttribute("username");
	int age = (int) session.getAttribute("age");
	String address = (String) session.getAttribute("address");
	String hp1 = (String) session.getAttribute("hp1");
	String hp2 = (String) session.getAttribute("hp2");
	String hp3 = (String) session.getAttribute("hp3");
	
	out.println(userId + "님 환영합니다.");
	out.println("<br/>");
	out.println("<table border='1'>");
	out.println("<tr align='center'>");
	out.println("<td>");
	out.println("==" + userId + "님의 정보" + "==");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("<td>" + "이름 :" +  userName + "</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("<td>" + "나이 :" +  age + "</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("<td>" + "주소 :" +  address + "</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("<td>" + "전화번호 :" + hp1 + "-" + hp2+ "-" + hp3 + "</td>");
	out.println("</tr>");
	
	out.println("<tr align='center'>");
	out.println("<td>" + "<input type='button' value='게시판' onclick='doBoardMove()'/>" + "</td>");
	out.println("</tr>");
	
	out.println("<tr align='center'>");
	out.println("<td>" + "<input type='button' value='로그아웃' onclick='doLogout()'/>" + "</td>");
	out.println("</tr>");
	
	out.println("</table>");
}else{  //로그인을 안하고 누르면 else니깐 밑에 있는 로그인화면이 그대로 나온다.
	%>
	<form action="/user/login_true.jsp">
	ID : <input type="text" name="id"/><br/>
	PWD : <input type="text" name="pwd"/><br/>
	<input type="submit" value="로그인"/>
	</form>
	<%
}
%>
</body>
</html>