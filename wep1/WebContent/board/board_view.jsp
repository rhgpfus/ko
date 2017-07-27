<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.BoardInfo" %>
<body>
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
				alert("<%=pBinum%>번 게시물은 이미 지워졌어 자시가");
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

번호 : <%=boardNum%><br/>
제목 : <%=boardTitle%><br/>
내용 : <%=boardContent%><br/>
글쓴이 : <%=boardWriter%><br/>
생성일자 :  <%=boardDate%><br/>

<input type="button" value="수정" onclick="modifyBoard()"/> <input type="button" value="삭제"onclick="deleteBoard()"/>
<script>
var boardSqlPwd = "<%=boardPwd%>";

function modifyBoard(){
	var boardInsertPwd = prompt("비밀번호를 입력하세요!","");
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
	var bipwd = document.getElementById("boardpwd").value;
	location.href="<%=rootPath%>/board/board_delete.jsp?binum=<%=boardNum%>&bipwd=" + bipwd; 
}
</script>
</body>
</html>