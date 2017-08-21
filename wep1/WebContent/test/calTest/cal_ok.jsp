<%@page import="sun.font.CreatedFontTracker"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashMap"%>
<%@ page import="java.sql.*" %>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.test.common.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Gson g = new Gson();
HashMap<String,String> j = g.fromJson(request.getReader(), HashMap.class);
int num1 = 0;
int num2 = 0;
int result = 0;

String num1Obj = j.get("num1");
if(num1Obj!=null && !num1Obj.equals("")){
	num1 = Integer.parseInt(num1Obj);
}
String num2Obj = j.get("num2");
if(num2Obj!=null && !num2Obj.equals("")){
	num2 = Integer.parseInt(num2Obj);
}
String op = j.get("op");
if(op.equals("+")){
	result = num1 + num2;
}else if(op.equals("-")){
	result = num1 - num2;
}else if(op.equals("*")){
	result = num1 * num2;
}else if(op.equals("/")){
	result = num1 / num2;
}
Connection con =null;
PreparedStatement ps = null;
int insertResult = 0;

try{
	con = DBConn.getCon();
	String sql = "insert into cal(num1,op,num2,result) values(?,?,?,?)";
	ps = con.prepareStatement(sql);
	ps.setInt(1,num1);
	ps.setString(2,op);
	ps.setInt(3,num2);
	ps.setInt(4,result);
	
	insertResult = ps.executeUpdate();
	if(insertResult==1){
		con.commit();
	}
}catch(Exception e){
	out.println(e);
	con.rollback();
}finally{
	ps.close();
	DBConn.closeCon();
}

HashMap<String, Integer> hm = new HashMap<String, Integer>();
hm.put("result",result);
String json = g.toJson(hm);
out.write(json);
%>