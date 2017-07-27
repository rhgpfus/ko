<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.BoardInfo" %>
<body>
<script>
function goBoard(boardnum,param2){
	location.href ="<%=rootPath%>/board/board_view.jsp?boardnum=" + boardnum;
}
function doSearch(){
	var searchTarget = document.getElementById("searchTarget").value;
	var searchStr = document.getElementById("searchStr").value;
	location.href ="<%=rootPath%>/board/board_select.jsp?searchTarget=" + searchTarget + "&searchStr=" + searchStr;
}
</script>
<%
String searchTarget = request.getParameter("searchTarget");
String searchStr = request.getParameter("searchStr");
Connection con = null;
PreparedStatement ps = null;
try{
	con = DBConn.getCon();
	String sql = "select boardnum, boardtitle, boardcontent, boardpwd, boardwriter, boarddate from board_info where 1=1";

	if(searchTarget!=null){
		if(searchTarget.equals("boardtitle")){
			sql += " and boardtitle like ?";
		}else if(searchTarget.equals("boardcontent")){
			sql += " and boardcontent like ?";
		}else if(searchTarget.equals("boardwriter")){
			sql += " and boardwriter like ?";
		}else if(searchTarget.equals("bicontitle")){
			sql += " and boardcontent like ? or boardtitle like ?";
		}
	}
	ps = con.prepareStatement(sql);
	if(searchTarget!=null){
		ps.setString(1, "%"+searchStr+"%");
		if(searchTarget.equals("bicontitle")){
			ps.setString(2, "%"+searchStr+"%");
		}
	}
	ResultSet rs = ps.executeQuery();
	String tableStr="<table border='1'>";
	tableStr += "<tr>";
	tableStr += "<td>번호</td>";
	tableStr += "<td>제목</td>";
	tableStr += "<td>작성자</td>";
	tableStr += "<td>작성일자</td>";
	tableStr += "</tr>";
	boolean existData = false;
	while(rs.next()){
		existData = true;
		tableStr += "<tr>";
		tableStr += "<td>"+rs.getInt("boardnum") + "</td>";
		tableStr += "<td style='cursor:pointer' onclick='goBoard(" + rs.getInt("boardnum") + ")'>" + rs.getString("boardtitle") + "</td>";
		tableStr += "<td>"+rs.getString("boardwriter") + "</td>";
		tableStr += "<td>"+rs.getString("boarddate") + "</td>";
		tableStr += "</tr>";
	}
	if(!existData){
		tableStr += "<tr>";
		tableStr += "<td colspan='6' align='center'>검색결과가 없습니다.</td>";
		tableStr += "</tr>";
	}else{
		tableStr += "<tr>";
		tableStr += "<td colspan='6' align='center'>";
		tableStr += "<select name='searchTarget' id='searchTarget'>";
		tableStr += "<option value='boardtitle'>제목</option>";
		tableStr += "<option value='boardwriter'>작성자</option>";
		tableStr += "<option value='boardcontent'>내용</option>";
		tableStr += "<option value='bicontitle'>제목 + 내용</option>";
		tableStr += "</select> ";
		tableStr += " <input type='text' name='searchStr' id='searchStr'/> ";
		tableStr += " <input type='button' value='검색' onclick='doSearch()'/>";
		tableStr += "</td>";
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
%>
<input type="button" value="게시글 작성" onclick="doBoardMove('boardInsert')"/>
<input type="button" value="메인가기" onclick="doBoardMove('main')"/>
</body>
</html>