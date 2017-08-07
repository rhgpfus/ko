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

int rowCnt = 10;
int nowPage = 1;
int blockCnt = 10;
int totalPageCtn = 0;
int totalBlockCnt = 0;
int totalCnt = 0;

Gson g = new Gson();
HashMap<String,String> hm = g.fromJson(request.getReader(), HashMap.class);
if(hm!=null && hm.get("nowPage")!=null){
	nowPage = Integer.parseInt(hm.get("nowPage"));
}

Connection con = null;
PreparedStatement ps = null;
ArrayList<Map<String,String>> viList = new ArrayList<Map<String,String>>();
ArrayList<Map<String, String>> giList = new ArrayList<Map<String, String>>();

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
	sql = "select count(1) from goods_info as gi,vender_info as vi where gi.vinum=vi.vinum";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	
	while(rs.next()){
		totalCnt = rs.getInt(1);
		System.out.println("테이터 로우 개수:"+ totalCnt);
	}
	if(totalCnt!=0){
		int mod = totalCnt%rowCnt;
		totalPageCtn = totalCnt/rowCnt;
		if(mod!=0){
			totalPageCtn +=1;
		}
	}
	
	if(totalPageCtn!=0){
		int mod = totalPageCtn%blockCnt;
		totalBlockCnt = totalPageCtn/blockCnt;
		if(mod!=0){
			totalBlockCnt +=1;
		}
	}
	
	
	System.out.println("총 페이지 개수:" + totalPageCtn);
	System.out.println("블럭 개수(한 화면에 10개씩):" + totalBlockCnt);
	
	sql = "select gi.ginum,gi.giname,gi.gidesc,vi.vinum,vi.viname from goods_info as gi,vender_info as vi where gi.vinum=vi.vinum";
	sql += " order by gi.ginum";
	sql += " limit ?,?";
	ps = con.prepareStatement(sql);
	ps.setInt(1, (nowPage-1)*rowCnt);
	ps.setInt(2, rowCnt);
	rs = ps.executeQuery();
	while(rs.next()){
		Map<String,String> vim = new HashMap<String,String>();
		vim.put("ginum",rs.getString("ginum"));
		vim.put("giname",rs.getString("giname"));
		vim.put("gidesc",rs.getString("gidesc"));
		vim.put("vinum",rs.getString("vinum"));
		vim.put("viname",rs.getString("viname"));
		giList.add(vim);
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
HashMap<String,Integer> pageInfo = new HashMap<String,Integer>();
pageInfo.put("nowPage",nowPage);
pageInfo.put("totalPageCtn",totalPageCtn);
pageInfo.put("totalBlockCnt",totalBlockCnt);
pageInfo.put("blockCnt",blockCnt);
pageInfo.put("totalCnt",totalCnt);

HashMap resultHm = new HashMap();
resultHm.put("viList", viList);
resultHm.put("giList", giList);
resultHm.put("pageInfo", pageInfo);
String json = g.toJson(resultHm);
System.out.println(json);
out.print(json);
%>