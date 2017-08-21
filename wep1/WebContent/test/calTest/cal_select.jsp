<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.common.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Gson g = new Gson();
HashMap<String,String> j = g.fromJson(request.getReader(), HashMap.class);
//Gson에 있는 fromJson함수를 사용. 
//request.getReader() 내가 보낸 ["op":""]을 읽어와서 옆에 적힌 HashMap.class~ HashMap형태로, 즉 hm.put("op","") 이 형태로 바꾼다.
//그리고 이것을 앞에 적어준 j에 넣어준다. list타입으로 바꾸고 싶으면 HashMap.class를 List.class로 바꿔주고 앞에도 List<String>으로 바꿔주면 된다.
String op = "";
if(j!=null){
	op = j.get("op");
}
Connection con =null;
PreparedStatement ps = null;
ArrayList<Map<String,String>> calList = new ArrayList<Map<String,String>>();
try{
	con = DBConn.getCon();
	String sql = "select calumn,num1,op,num2,result from cal where 1=1";
	if(op!=null && !op.equals("")){
		sql += "and op=?";
	}
	ps = con.prepareStatement(sql);
	if(op!=null && !op.equals("")){
		ps.setString(1,op);
	}
	
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		Map<String, String> m2 = new HashMap<String, String>();
		m2.put("calumn", rs.getString("calumn"));
		m2.put("num1", rs.getString("num1"));
		m2.put("op", rs.getString("op"));
		m2.put("num2", rs.getString("num2"));
		m2.put("result", rs.getString("result"));
		calList.add(m2);
	}
}catch(Exception e){
	out.println(e);
	con.rollback();
}finally{
	ps.close();
	DBConn.closeCon();
}
String json = g.toJson(calList);
System.out.println(json);
out.print(json);

%>