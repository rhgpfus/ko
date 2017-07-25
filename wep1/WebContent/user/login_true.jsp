<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.UserInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String result = "";

if(id!=null && pwd!=null){
	UserInfo ui = new UserInfo();
	ui.setUserId(id);
	ui.setUserPwd(pwd);

	Connection con = null;
	PreparedStatement ps = null;
	try{
		con = DBConn.getCon();
		String sql = "select userpwd,username,age,address,hp1,hp2,hp3 from user_info ";
		sql += "where userid=?";
		
		ps = con.prepareStatement(sql);
		ps.setString(1,ui.getUserId());
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			String userPwd = rs.getString("userpwd");
			String userName = rs.getString("username");
			int age = rs.getInt("age");
			String address = rs.getString("address");
			String hp1 = rs.getString("hp1");
			String hp2 = rs.getString("hp2");
			String hp3 = rs.getString("hp3");
			if(userPwd.equals(ui.getUserPwd())){
				result = "로그인에 성공하셨습니다.";
				session.setAttribute("userid", ui.getUserId());
				session.setAttribute("username", userName);
				session.setAttribute("age", age);
				session.setAttribute("address", address);
				session.setAttribute("hp1", hp1);
				session.setAttribute("hp2", hp2);
				session.setAttribute("hp3", hp3);
			}else{
				result = "비밀번호가 틀립니다.";
			}
		}
	}catch(Exception e){
		System.out.print(e);
	}
	if(result.equals("")){
		result =  "아이디가 정확하지 않습니다.";	
	}
	out.println(result);
}else{
	// 세션 초기화
	result = "로그아웃 되셨습니다.";
	session.invalidate();
}
%>
<script>
alert("<%=result%>");
location.href="/user/login.jsp";
</script>
</body>
</html>