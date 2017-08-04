<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.test.common.DBConn"%>
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

 
<%
Gson g = new Gson();
JSONObject j = g.fromJson(request.getReader(), JSONObject.class);
Connection con = null;
PreparedStatement ps = null;
ArrayList<Map<String,String>> viList = new ArrayList<Map<String,String>>();
try{
	con = DBConn.getCon();
	String sql = "select vinum, viname from vender_info";
	ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		Map<String,String> vim = new HashMap<String,String>();
		vim.put("vinum",rs.getString("vinum"));
		vim.put("viname",rs.getString("viname"));
		viList.add(vim);
	}
	con.commit();
}catch(Exception e){
	System.out.println(e);
	out.println(e);
	con.rollback();
}finally{
	ps.close();
	DBConn.closeCon();
}

String json = g.toJson(viList);
System.out.println(json);
out.print(json);
%>