<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.BoardInfo" %>
<style>
*{margin:0; padding:0;}  /*마진이 여백을 주는 스타일 0:위 5:오른쪽 10:아래 15:왼쪽 시계방향으로 값을 준다. */
body{width:100%; position:relative;}
#boardcontent{height:200px;}
table tr td{width:200px;}
#bd_div{position:absolute; left:50%; margin-left:-200px;}
#dd{height:50px;}
</style>
<body>
<%
String boardtitle = request.getParameter("boardtitle");
String boardcontent = request.getParameter("boardcontent");
String boardwriter = request.getParameter("boardwriter");
String boardpwd = request.getParameter("boardpwd");
int result = 0;

if(boardtitle!=null && boardcontent!=null && boardwriter!=null && boardpwd!=null){
	BoardInfo bi = new BoardInfo();
	bi.setBoardTitle(boardtitle);
	bi.setBoardContent(boardcontent);
	bi.setBoardWriter(boardwriter);
	bi.setBoardPwd(boardpwd);

	Connection con = null;
	PreparedStatement ps = null;
	
	try{
		con = DBConn.getCon();
		String sql = "insert into board_info(boardtitle,boardcontent,boardpwd,boardwriter,boarddate)";
		sql += "values(?,?,?,?,now())";
		
		ps = con.prepareStatement(sql);
		ps.setString(1, bi.getBoardTitlem());
		ps.setString(2, bi.getBoardContent());
		ps.setString(3, bi.getBoardPwd());
		ps.setString(4, bi.getBoardWriter());
		int result = ps.executeUpdate();
		if(result==1){
			con.commit();
			return true;
		}
	}catch(SQLException | ClassNotFoundException e){
		try {
			con.rollback();
		} catch (SQLException e1) {
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
	return false;
	}
	



%>

</body>
</html>