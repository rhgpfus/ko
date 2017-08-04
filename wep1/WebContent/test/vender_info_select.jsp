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

String ginum = "";
if(j.get("ginum").toString()==null || j.get("ginum").toString().equals("")){
	String ginumObj = j.get("ginum").toString();//사원번호
	
}

int ginum = 0;
if(!ginumObj.equals("")){
	ginum = Integer.parseInt(ginumObj);
}

String vinumObj = j.get("vinum").toString();//회사번호
int vinum = 0;
if(!vinumObj.equals("")){
	vinum = Integer.parseInt(vinumObj);
}
Connection con = null;
PreparedStatement ps = null;
String message = "";
ArrayList<Map<String,String>> viList = new ArrayList<Map<String,String>>();
if(command.equals("select")){
	try{
		con = DBConn.getCon();
		String sql = "select vi.vinum,vi.viname,vi.videsc,gi.giname,gi.gidesc,gi.gidate,gi.gitime"
				 + " from goods_info as gi,vender_info as vi";
		if(vinumObj.equals("") || ginumObj.equals("")){           //
			sql +=" where vi.vinum=gi.vinum";               //
		}else if(vinum>0){    //Pattern.matches("(^[0-9]*$)", j.get("vinum").toString())   <-숫자인지 검사한다.  
			sql +=" where vi.vinum=gi.vinum and vi.vinum=?";
		}else if(ginum>0){
			sql +=" where vi.vinum=gi.vinum and gi.ginum=?";
		}
		ps = con.prepareStatement(sql);
		if(vinum>0){ 
			ps.setInt(1, vinum);
		}else if(ginum>0){
			ps.setInt(1, ginum);
		}
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Map<String,String> vim = new HashMap<String,String>();
			vim.put("vinum",rs.getString("vi.vinum"));
			vim.put("viname",rs.getString("vi.viname"));
			vim.put("videsc",rs.getString("vi.videsc"));
			vim.put("giname",rs.getString("gi.giname"));
			vim.put("gidesc",rs.getString("gi.gidesc"));
			vim.put("gidate",rs.getString("gi.gidate"));
			vim.put("gitime",rs.getString("gi.gitime"));
			viList.add(vim);
		}
			con.commit();
			message = "고똥님 회사정보를 불러오는데 성공했습니다.";
	}catch(Exception e){
		out.println(e);
		con.rollback();
		message = "고똥님 회사정보를 불러오는데 실패했습니다.";
	}finally{
		ps.close();
		DBConn.closeCon();
	}
}

HashMap<String,Object> hm = new HashMap<String, Object>();
hm.put("list", viList);
hm.put("msg", message);
String json = g.toJson(hm);
System.out.println(json);
out.print(json);

%>