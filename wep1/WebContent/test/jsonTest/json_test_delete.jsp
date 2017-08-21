<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
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
String content = "";
String message = "";

content = j.get("content");
if(content!=null && !content.equals("")){
	Connection con = null;
	PreparedStatement ps = null;
	int insertResult = 0;
	try{
		con = DBConn.getCon();
		String sql = "delete from json_test where jt_text=?;";
		ps = con.prepareStatement(sql);
		ps.setString(1,content);
		
		insertResult = ps.executeUpdate();
		if(insertResult==1){
			con.commit();
			message = "헥헥헥헥헥헥 주인님 지웠어요!";
		}
	}catch(Exception e){
		out.println(e);
		con.rollback();
	}finally{
		ps.close();
		DBConn.closeCon();
	}
}else{
	message = "헥헥 주인님 내용을 써야 지우져~!";
}



HashMap<String, String> hm = new HashMap<String, String>();
hm.put("message", message);
String json = g.toJson(hm);
out.write(json);
%>