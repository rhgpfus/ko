<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.BoardInfo" %>

<body>
<%
int boardnum = Integer.parseInt(request.getParameter("boardnum"));
String boardtitle = request.getParameter("boardtitle");
String boardcontent = request.getParameter("boardcontent");
String boardpwd = request.getParameter("boardpwd");
int result = 0;
String message = "수정이 안됬어요!";

if(boardtitle!=null && boardcontent!=null && boardpwd!=null){
	BoardInfo bi = new BoardInfo();
	bi.setBoardNum(boardnum);
	bi.setBoardTitle(boardtitle);
	bi.setBoardContent(boardcontent);
	bi.setBoardPwd(boardpwd);
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	try{
		con = DBConn.getCon();
		String sql = "update board_info set boardtitle=?,boardcontent=?,boardpwd=? where boardnum=?;";
	
		ps = con.prepareStatement(sql);
		ps.setString(1, bi.getBoardTitlem());
		ps.setString(2, bi.getBoardContent());
		ps.setString(3, bi.getBoardPwd());
		ps.setInt(4, bi.getBoardNum());
		rs = ps.executeQuery();
		while(rs.next()){
			String bPwd = rs.getString("boardpwd");
			if(bi.getBoardPwd().equals(bPwd)){
				if(result==1){
					message = "수정이 완료되었습니다.";
					con.commit();
				}
			}
		}
	
}catch(SQLException | ClassNotFoundException e){
	try{
		con.rollback();
	}catch(SQLException e1){
		e1.printStackTrace();
	}
	e.printStackTrace();
}finally{
	try{
		ps.close();
		DBConn.closeCon();
	}catch(SQLException e){
		e.printStackTrace();
	}
}

}
%>
<script>
alert("<%=message%>");
location.href= "<%=rootPath%>" + "/board/board_select.jsp";
</script>
</body>
</html>