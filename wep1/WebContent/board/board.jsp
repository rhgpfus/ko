<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.BoardInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

%>
<form action="/board/board_select.jsp">
<table border=1 cellspacing="0" cellpadding="0" width="400" align="center">
	<tr>
	 	<td colspan="2"><p align="center"> = 게시판 검색 = </p></td>
	</tr>
	<tr align="center">
		<td>검색할 제목 : </td>
		<td><input type="text" id="boardtitle" name="boardtitle"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="검색"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>