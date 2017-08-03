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
if(j!=null){
	content = j.get("content");
}
Connection con = null;
PreparedStatement ps = null;
ArrayList<Map<String,String>> jsonList = new ArrayList<Map<String,String>>();
try{
	con = DBConn.getCon();
	String sql = "select jt_num,jt_text from json_test where 1=1";
	if(content!=null && !content.equals("")){
		sql += " and jt_text like ?";
	}
	ps = con.prepareStatement(sql);
	if(content!=null && !content.equals("")){
		ps.setString(1,"%"+content+"%");
	}
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		Map<String,String> jm = new HashMap<String,String>();
		jm.put("jt_num", rs.getString("jt_num"));
		jm.put("jt_text", rs.getString("jt_text"));
		jsonList.add(jm);
	}
}catch(Exception e){
	out.println(e);
	con.rollback();
}finally{
	ps.close();
	DBConn.closeCon();
}
String json = g.toJson(jsonList);
System.out.println(json);
out.print(json);
%>
   