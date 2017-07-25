<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.BoardInfo" %>
<style>
#aa{margin-left:990px;}
</style>
<body>

<form action="/board/board_select.jsp">
<table border="1" cellspacing="0" cellpadding="0" width="400" align="center">
	<tr>
		<td colspan="4"><p align="center"> = 게시판 검색 = </p></td>
	</tr>
	<tr align="center">
		<td>검색할 제목 : </td>
		<td colspan="2"><input type="text" id="boardtitle" name="boardtitle"/></td>
		<td><input type="submit" value="검색"/></td>
	</tr>
</table>
<div id="aa"><input type="button" value="게시글 작성" onclick="doBoardMove('boardInsert')"/>
<input type="button" value="메인가기" onclick="doBoardMove('main')"/></div>
</form>	
<%
String boardNum = request.getParameter("boardnum");
String boardTitle = request.getParameter("boardtitle");
String boardContent = request.getParameter("boardcontent");
String boardPwd = request.getParameter("boardpwd");
String boardWriter = request.getParameter("boardwriter");
String boardDate = request.getParameter("boarddate");

BoardInfo bi = new BoardInfo();
if(boardNum!=null) {
	bi.setBoardNum(Integer.parseInt(boardNum));
}
bi.setBoardTitle(boardTitle);
bi.setBoardContent(boardContent);
bi.setBoardPwd(boardPwd);
bi.setBoardWriter(boardWriter);
bi.setBoardDate(boardDate);

if(boardTitle!=null && !boardTitle.equals("")){
	bi.setBoardTitle("%" + boardTitle + "%");
}
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
	con = DBConn.getCon();
	String sql = "select boardnum,boardtitle,boardcontent,boardwriter,boarddate from board_info";
	if(bi.getBoardTitlem()!=null && !bi.getBoardTitlem().equals("")){
		sql += " where boardtitle like ?";
	}
	ps = con.prepareStatement(sql);
	if(bi.getBoardTitlem()!=null && !bi.getBoardTitlem().equals("")){
		ps.setString(1,bi.getBoardTitlem());
	}
	rs = ps.executeQuery();
	String tableStr="<table border=1 cellspacing='0' cellpadding='0' width='400' align='center'>";
	tableStr += "<tr align='center'>";
	tableStr += "<td>번호</td>";
	tableStr += "<td>제목</td>";
	tableStr += "<td>작성자</td>";
	tableStr += "<td>작성일자</td>";
	tableStr += "</tr>";
	while(rs.next()){
		tableStr += "<tr align='center'>";
		tableStr += "<td>"+rs.getInt("boardnum") + "</td>";
		tableStr += "<td>"+rs.getString("boardtitle") + "</td>";
		tableStr += "<td>"+rs.getString("boardwriter") + "</td>";
		tableStr += "<td>"+rs.getString("boarddate") + "</td>";
		tableStr += "</tr>";
	}
	tableStr += "</table>";
	out.println(tableStr);
}catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>