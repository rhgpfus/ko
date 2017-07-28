<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn"%>
<%@ page import="com.test.DTO.BoardInfo"%>

<%
String boardTitle = request.getParameter("boardtitle");
String boardContent = request.getParameter("boardcontent");
String boardPwd = request.getParameter("boardpwd");
String boardWriter = request.getParameter("boardwriter");
String boardnum = request.getParameter("boardnum");
String sql = "update board_info";
sql += " set boardtitle=?,";
sql += "  boardcontent=?,";
sql += "  boardpwd=?,";
sql += "  boardwriter=?";
sql += "  where boardnum=?";

Connection con = null;
PreparedStatement ps = null;
String result = "수정 실패.";
int resultNum =0;
try{
	con = DBConn.getCon();
	ps = con.prepareStatement(sql);
	ps.setString(1, boardTitle);
	ps.setString(2, boardContent);
	ps.setString(3, boardPwd);
	ps.setString(4, boardWriter);
	ps.setString(5, boardnum);
	
	resultNum = ps.executeUpdate();
	if(resultNum==1){
		result = "정상적으로 수정 되었습니다.";
		con.commit();
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
<script>
alert("<%=result%>");
if(<%=resultNum%> == 1){
	location.href= "<%=rootPath%>/board/board_select_view.jsp?boardnum=<%=boardnum%>";
}else{
	history.back();
}
</script>