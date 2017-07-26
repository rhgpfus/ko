<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.BoardInfo" %>
<style>
*{margin:0; padding:0;}  /*마진이 여백을 주는 스타일 0:위 5:오른쪽 10:아래 15:왼쪽 시계방향으로 값을 준다. */
body{width:100%; position:relative;}
#boardcontent{height:200px;}
table tr td{width:200px;}
#bd_div{position:absolute; left:50%; margin-left:-200px;}
#dd{height:50px;}
</style>

<body>
<form action="/board/board_insert_ok.jsp">
<div id="bd_div">
<table border=1 cellspacing="0" cellpadding="0" >
	<tr align="center" id="dd">
	 	<td colspan="2"><p> = 게시판 입력 = </p></td>
	 </tr>
	<tr align="center" id="title">
		<td>제목 : </td>
		<td><input type="text" id="boardtitle" name="boardtitle"/></td>
	</tr>
	<tr align="center" id="bb">
		<td>내용 : </td>
		<td><textarea id="boardcontent" name="boardcontent"></textarea></td>
	</tr>
	<tr align="center">
		<td>글쓴이 : </td>
		<td><input type="text" id="boardwriter" name="boardwriter"/></td>
	</tr>
	<tr align="center">
		<td>비밀번호 : </td>
		<td><input type="password" id="boardpwd" name="boardpwd"/></td>
	</tr>
	
</table>
<input type="button" value="메인가기" onclick="doBoardMove('main')"/>
<input type="submit" value="글쓰기"/>
</div>
</form>	
</body>
</html>