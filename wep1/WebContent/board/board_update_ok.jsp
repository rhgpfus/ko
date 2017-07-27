<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn"%>
<%@ page import="com.test.DTO.BoardInfo"%>

<%
String boardTitle = request.getParameter("boardtitle");
String biContent = request.getParameter("bicontent");
String biPwd = request.getParameter("bipwd");
String creusr = request.getParameter("creusr");
String binum = request.getParameter("binum");
String sql = "update board_info";
sql += " set bititle=?,";
sql += "  bicontent=?,";
sql += "  bipwd=?,";
sql += "  creusr=?";
sql += "  where binum=?";

Connection con = null;
PreparedStatement ps = null;
String result = "수정 안된거 같다야~?";
int resultNum =0;
try{
	con = DBConn.getCon();
	ps = con.prepareStatement(sql);
	ps.setString(1, biTitle);
	ps.setString(2, biContent);
	ps.setString(3, biPwd);
	ps.setString(4, creusr);
	ps.setString(5, binum);
	
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
	location.href= "<%=rootPath%>/board/board_view.jsp?boardnum=<%=boardnum%>";
}else{
	history.back();
}
</script>