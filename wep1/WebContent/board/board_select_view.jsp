<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.BoardInfo" %>
<body>
<jsp:include page="/common/top.jsp" flush="false">
	<jsp:param value="<%=login%>" name="login"/>
</jsp:include>
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
<tr>
<td>번호</td><td><%=boardNum%></td>
</tr>
<tr>
<td>제목</td><td><%=boardTitle%></td>
</tr>
<tr>
<td>내용</td><td><%=boardContent%></td>
</tr>
<tr>
<td>글쓴이</td><td><%=boardWriter%></td>
</tr>
<tr>
<td>생성일자</td><td><%=boardDate%></td>
</tr>

</table>
<input type="button" value="수정" onclick="boardUpdate()"/> 
<input type="button" value="삭제"onclick="deleteBoard()"/>
<input type="button" value="게시판"onclick="doBoardMove('board')"/>
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
</div>
</div>
</body>
</html>