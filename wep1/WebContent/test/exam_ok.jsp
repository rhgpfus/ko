<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String age = request.getParameter("age");
String address = request.getParameter("address");
String address2 = request.getParameter("address2");
String hp1 = request.getParameter("hp1");
String hp2 = request.getParameter("hp2");
String hp3 = request.getParameter("hp3");
String zipcode = request.getParameter("zipcode");
String password = request.getParameter("password");

Map<String,String[]> map = request.getParameterMap();
Iterator<String> it = map.keySet().iterator();
while(it.hasNext()){
	String calumns = it.next();
	String value = request.getParameter(calumns);
	out.println("입력하신" + calumns + "의 값은" + value + "입니다.<br/>");
}
%>