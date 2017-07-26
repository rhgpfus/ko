<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.BoardInfo" %>
<%
String boardNum = request.getParameter("boardnum");

BoardInfo bi = new BoardInfo();
if(boardNum!=null){
	bi.setBoardNum(Integer.parseInt(boardNum));
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try{
		con = DBConn.getCon();
		String sql = "select boardnum,boardtitle,boardcontent,boardwriter,boarddate from board_info";
		sql += " where boardnum=?";
		
		ps = con.prepareStatement(sql);
		ps.setInt(1,bi.getBoardNum());
		
		rs = ps.executeQuery();
		String tableStr="<table border=1 cellspacing='0' cellpadding='0' width='400' align='center'>";
		tableStr += "<tr align='center'>";
		tableStr += "<td colspan='6'><p align='center'> = 게시판 수정 = </p></td>";
		tableStr += "</tr>";
		tableStr += "<tr align='center'><td>수정할 보드 번호</td>";
		tableStr += "<td>제목</td>";
		tableStr += "<td>내용</td>";
		tableStr += "<td>글쓴이</td>";
		tableStr += "<td>작성일자</td>";
		tableStr += "<td>비밀번호</td>";
		while(rs.next()){
			int bNum = rs.getInt("boardnum");
			tableStr += "<tr align='center'>";
			tableStr += "<td>" + rs.getInt("boardnum") + "</td>";
			tableStr += "<td><input type='text' value=" + rs.getString("boardtitle") + " id='title' name='title'/></td>";
			tableStr += "<td><input type='text' value=" + rs.getString("boardcontent") + " id='content' name='content'/></td>";
			tableStr += "<td>" + rs.getString("boardwriter") + "</td>";
			tableStr += "<td>" + rs.getString("boarddate") + "</td>";
			tableStr += "<td><input type='password' id='pwd' name='pwd'></td>";
			tableStr += "</tr>";
		}
		tableStr += "</table>";
		out.println(tableStr);
	}catch(Exception e){
		System.out.println(e);
	}finally{
		if(ps!=null){
			ps.close();
			ps = null;
		}
		DBConn.closeCon();
	}
}

%>

<body>
<form action="/board/board_update_ok.jsp">
<input type="submit" value="수정"/>
</form>
</body>
</html>