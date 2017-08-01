<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.BoardInfo" %>
<body>

<div class="container">
      <div class="starter-template">
<%
	int pBinum = Integer.parseInt(request.getParameter("boardnum"));
	Connection con = null;
	PreparedStatement ps = null;
	int boardNum = 0;
	String boardTitle = "";
	String boardContent = "";
	String boardPwd = "";
	String boardWriter = "";
	String boardDate = "";
	try{
		con = DBConn.getCon();
		String sql = "select boardnum, boardtitle, boardcontent, boardpwd, boardwriter, boarddate from board_info where boardnum=?";
		ps = con.prepareStatement(sql);
		ps.setInt(1,pBinum);
		ResultSet rs = ps.executeQuery();
		rs.last();
		int rowCnt = rs.getRow();
		if(rowCnt==0){
%>
			<script>
				alert("<%=pBinum%>번이 게시물이 존재하지 않습니다.");
				history.back();
			</script>
<%
		}
		rs.beforeFirst();
		while(rs.next()){
			boardNum = rs.getInt("boardnum");
			boardTitle = rs.getString("boardtitle");
			boardContent = rs.getString("boardcontent");
			boardWriter = rs.getString("boardwriter");
			boardDate = rs.getString("boarddate");
			boardPwd = rs.getString("boardpwd");
		}
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

<table class='table table-bordered table-hover'>
<tr style='color:#A6A6A6'>
<td>번호</td><td><%=boardNum%></td>
</tr>
<tr style='color:#A6A6A6'>
<td>제목</td><td><%=boardTitle%></td>
</tr>
<tr style='color:#A6A6A6'>
<td>내용</td><td><%=boardContent%></td>
</tr>
<tr style='color:#A6A6A6'>
<td>글쓴이</td><td><%=boardWriter%></td>
</tr>
<tr style='color:#A6A6A6'>
<td>생성일자</td><td><%=boardDate%></td>
</tr>

</table>
<button type="button" onclick="boardUpdate()">수정</button> 
<button type="button" onclick="deleteBoard()">삭제</button>
<button type="button" onclick="doBoardMove('board')">게시판</button>

<script>
var boardSqlPwd = "<%=boardPwd%>";

function boardUpdate(){
	var boardInsertPwd = prompt("비밀번호를 입력하세요.","");
	if(boardInsertPwd!=null && boardInsertPwd!=""){
		if(boardSqlPwd==boardInsertPwd){
			location.href="<%=rootPath%>/board/board_update_view.jsp?boardnum=<%=boardNum%>";
		}else{
			alert("비밀번호가 틀려!");
		}
	}else{
		history.back();
	}
}
function deleteBoard(){
	var boardInsertPwd = prompt("비밀번호를 입력하세요.","");
	if(boardInsertPwd!=null && boardInsertPwd!=""){
		if(boardSqlPwd==boardInsertPwd){
			location.href="<%=rootPath%>/board/board_delete.jsp?boardnum=<%=boardNum%>"; 
		}else{
			alert("비밀번호가 틀려!");
		}
	}else{
		history.back();
	}
}
</script>
<%@ include file="/common/bottom.jsp"%>
</div>
</div>
</body>
</html>