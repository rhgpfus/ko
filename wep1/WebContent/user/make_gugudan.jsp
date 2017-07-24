<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String guCnt = request.getParameter("gucnt");
if(guCnt==null || guCnt.equals("")){
	out.println("생성해주세요.");
}else{
	int guCnt2 = Integer.parseInt(guCnt);
	out.println(guCnt + "X" + guCnt + "단을 생성합니다.<br/>");
	String tables = "<table border='1'>";
	for(int i=1;i<=guCnt2;i++){
		tables += "<tr>";
		for(int j=2;j<=guCnt2;j++){
			tables += "<td>" + i + "*" + j + "=" + (i*j) +"</td>";
		}
		tables += "</tr>";
	}
	tables += "</table>";
	out.println(tables);
}

%>
<form action="/user/make_gugudan.jsp">
	구구단 생성 개수 : <input type="text" name="gucnt"/><br/>
	<input type="submit" value="생성!"/>
</form>
</body>
</html>