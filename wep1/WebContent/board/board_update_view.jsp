<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.BoardInfo" %>
<body>
<jsp:include page="/common/top.jsp" flush="fasle"></jsp:include>
<div class="container">
      <div class="starter-template">
<%
	int boardNum = Integer.parseInt(request.getParameter("boardnum"));
	Connection con = null;
	PreparedStatement ps = null;
	int bNum = 0;
	String bTitle = "";
	String bContent = "";
	String bPwd = "";
	String bWriter = "";
	String bDate = "";
	try{
		con = DBConn.getCon();
		String sql = "select boardnum,boardtitle,boardcontent,boardwriter,boarddate,boardpwd from board_info";
		sql += " where boardnum=?";
		ps = con.prepareStatement(sql);
		ps.setInt(1,boardNum);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			bNum = rs.getInt("boardnum");
			bTitle = rs.getString("boardtitle");
			bContent = rs.getString("boardcontent");
			bPwd = rs.getString("boardpwd");
			bWriter = rs.getString("boardwriter");
			bDate = rs.getString("boarddate");
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

<form method="get" action="<%=rootPath%>/board/board_update_ok.jsp" >
				<table class='table table-bordered table-hover'>
					<tr>
						<td>제목</td>
						<td><input type="text" name="boardtitle" id="boardtitle"
							value="<%=bTitle%>" /></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2"><textarea name="boardcontent" id="boardcontent"><%=bContent%></textarea></td>
					</tr>
					<tr>
						<td>글쓴이</td>
						<td><input type="text" name="boardwriter" id="boardwriter" value="<%=bWriter%>" /></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="boardpwd" id="boardpwd" value="<%=bPwd%>" /></td>
					</tr>
				</table>
				<input type="hidden" value="<%=bNum%>" name="boardnum" /> 
				<input type="submit" value="수정하기" />
			</form>
	</div>
</div>
</body>
</html>