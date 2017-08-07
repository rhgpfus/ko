<%@page import="java.util.regex.Pattern"%>
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
String command = "";
command = j.get("command").toString();

String vinumObj = j.get("vinum").toString();//회사번호
int vinum = 0;
if(!vinumObj.equals("")){
	vinum = Integer.parseInt(vinumObj);
}
Connection con = null;
PreparedStatement ps = null;
ArrayList<Map<String,String>> viList = new ArrayList<Map<String,String>>();
if(command.equals("select")){
	try{
		con = DBConn.getCon();
		String sql = "select gi.ginum,gi.giname,gi.gidesc,vi.vinum,vi.viname"
				 + " from goods_info as gi,vender_info as vi";
		if(vinumObj.equals("")){           //
			sql +=" where vi.vinum=gi.vinum";               //
		}else if(vinum>0){    //Pattern.matches("(^[0-9]*$)", j.get("vinum").toString())   <-숫자인지 검사한다.  
			sql +=" where vi.vinum=gi.vinum and vi.vinum=?";
		}
		ps = con.prepareStatement(sql);
		if(vinum>0){ 
			ps.setInt(1, vinum);
		}
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Map<String,String> vim = new HashMap<String,String>();
			vim.put("ginum",rs.getString("gi.ginum"));
			vim.put("giname",rs.getString("gi.giname"));
			vim.put("gidesc",rs.getString("gi.gidesc"));
			vim.put("vinum",rs.getString("vi.vinum"));
			vim.put("viname",rs.getString("vi.viname"));
			viList.add(vim);
		}
			con.commit();
	}catch(Exception e){
		out.println(e);
		con.rollback();
	}finally{
		ps.close();
		DBConn.closeCon();
	}
}
HashMap<String,Object> hm = new HashMap<String, Object>();
hm.put("list", viList);
String json = g.toJson(hm);
System.out.println(json);
out.print(json);

%>