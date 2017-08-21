<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.test.common.DBConn"%>
<%@page import="java.sql.PreparedStatement"%>
<%
Gson g = new Gson();
HashMap<String,String> j = g.fromJson(request.getReader(), HashMap.class);
int num = 0;
String content = "";
String message = "";

String numObj = j.get("num");
if(numObj!=null && !numObj.equals("")){
	num = Integer.parseInt(numObj);
}
if(num==0){
	message = "주인님 숫자써야대여!헥헥헥";
}
else{
	content = j.get("content");
	if(content!=null && !content.equals("")){
		Connection con = null;
		PreparedStatement ps = null;
		int insertResult = 0;
		try{
			con = DBConn.getCon();
			String sql = "insert into json_test(jt_num,jt_text) values(?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, content);
			
			insertResult = ps.executeUpdate();
			if(insertResult==1){
				con.commit();
				message = "헥헥 주인님 저장했어용!";
			}
		}catch(Exception e){
			out.println(e);
			con.rollback();
			message = "헥헥 주인님 망했어용!!";
		}finally{
			ps.close();
			DBConn.closeCon();
		}
	}else{
		message = "헥헥 주인님 내용을 쓰셔야져!";
	}
}


HashMap<String, String> hm = new HashMap<String, String>();
hm.put("message", message);
String json = g.toJson(hm);
out.write(json);
%>
   