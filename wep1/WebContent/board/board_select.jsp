<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.BoardInfo" %>
<body>

<form action="/board/board_select_true.jsp">
<table border=1 cellspacing="0" cellpadding="0" width="400" align="center">
	<tr>
		<td colspan="4"><p align="center"> = 게시판 검색 = </p></td>
	</tr>
	<tr align="center">
		<td>검색할 제목 : </td>
		<td colspan="2"><input type="text" id="boardtitle" name="boardtitle"/></td>
	</tr>
	<tr>
		<td align="center">
		<input type="submit" value="검색" onclick="doSelect()"/>
		</td>
		<td align="center">
		<input type="button" value="게시글 작성"/>
		</td>
		<td align="center">
		<input type="button" value="메인가기" onclick="doMovePage('main')"/>
		</td>
	</tr>
</table>
</form>	
</body>
</html>