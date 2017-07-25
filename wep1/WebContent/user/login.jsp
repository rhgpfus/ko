<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.UserInfo" %>
<script>
var setObj;
var loopCnt = 0;
function doStartTimer(){
	setObj = setInterval(function(){
	if(loopCnt==10){
		clearInterval(setObj);
	}else{
		loopCnt++;
		alert(loopCnt + "번 안녕하세요.");
	}
	//location.reload();   //이페이지를 새로고침하는것.
	},1000);
}
function doStopTimer(){
	clearInterval(setObj);
}

function doLogout(){
	location.href= rootPath + "/user/login_true.jsp";
}
</script>
<body>
<%
if(login){
	out.println("현재시간 : " + toDateStr);
	out.println("<br/>");
	out.println(userId + "님 환영합니다.");
	out.println("<br/>");
	out.println("<table border='1'>");
	out.println("<tr align='center'>");
	out.println("<td>");
	out.println("==" + userId + "님의 정보" + "==");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("<td>" + "이름 :" +  userName + "</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("<td>" + "나이 :" +  age + "</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("<td>" + "주소 :" +  address + "</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("<td>" + "전화번호 :" + hp1 + "-" + hp2+ "-" + hp3 + "</td>");
	out.println("</tr>");
	
	out.println("<tr align='center'>");
	out.println("<td>" + "<input type='button' value='게시판' onclick='doBoardMove(\"board\")'/>" + "</td>");
	out.println("</tr>");
	
	out.println("<tr align='center'>");
	out.println("<td>" + "<input type='button' value='로그아웃' onclick='doLogout()'/>" + "</td>");
	out.println("</tr>");
	
	out.println("<tr align='center'>");
	out.println("<td>" + "<input type='button' value='스타트타이머' onclick='doStartTimer()'/>" + "</td>");
	out.println("</tr>");
	
	out.println("<tr align='center'>");
	out.println("<td>" + "<input type='button' value='스탑' onclick='doStopTimer()'/>" + "</td>");
	out.println("</tr>");
	
	out.println("</table>");
}else{  //로그인을 안하고 누르면 else니깐 밑에 있는 로그인화면이 그대로 나온다.
	%>
	<form action="<%=rootPath%>/user/login_true.jsp">
	ID : <input type="text" name="id"/><br/>
	PWD : <input type="text" name="pwd"/><br/>
	<input type="submit" value="로그인"/>
	</form>
	<%
}
%>
</body>
</html>