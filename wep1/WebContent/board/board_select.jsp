<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.BoardInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String boardtitle = request.getParameter("boardtitle");
String result = "";

if(boardtitle!=null && boardtitle!=null){
	BoardInfo bi = new BoardInfo();
	bi.setBoardTitle(boardtitle);
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try{
		con = DBConn.getCon();
		String sql = "select boardnum,boardtitle,boardcontent,boardpwd,boardwriter,boarddate from board_info";
		if(bi.getBoardTitlem()!=null && !bi.getBoardTitlem().equals("")){
			sql += " where boardtitle like ?";
		}
		
		ps = con.prepareStatement(sql);
		if(bi.getBoardTitlem()!=null && !bi.getBoardTitlem().equals("")){
			ps.setString(1,bi.getBoardTitlem());
		}
		rs = ps.executeQuery();
		while(rs.next()){
			BoardInfo bi2 = new BoardInfo();
			bi2.setBoardNum(rs.getInt("boardnum"));
			bi2.setBoardTitle(rs.getString("boardtitle"));
			bi2.setBoardContent(rs.getString("boardcontent"));
			bi2.setBoardPwd(rs.getString("boardpwd"));
			bi2.setBoardWriter(rs.getString("boardwriter"));
			bi2.setBoardDate(rs.getString("boarddate"));
			boardList.add(bi2);
		}
		con.commit();
		return boardList;
	}catch(SQLException | ClassNotFoundException e){
		try{
			con.rollback();
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		e.printStackTrace();
	}
	finally{
		try{
			rs.close();
			ps.close();
			DBConn.closeCon();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	return null;
}


%>
</body>
</html>