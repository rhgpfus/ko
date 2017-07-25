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
<script>

</script>
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
	
try{
	con = DBConn.getCon();
	String sql = "select boardnum,boardtitle,boardcontent,boardwriter,boarddate from board_info";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	String tableStr="<table border=1 cellspacing='0' cellpadding='0' width='400' align='center'>";
	tableStr += "<tr>";
	tableStr += "<td>번호</td>";
	tableStr += "<td>제목</td>";
	tableStr += "<td>작성자</td>";
	tableStr += "<td>작성일자</td>";
	tableStr += "</tr>";
	while(rs.next()){
		tableStr += "<tr>";
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