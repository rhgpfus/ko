<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>get parameter방식</p>
<form action="test.formtest" method="get">
	아이디 : <input type="text" id="id1" name="id1" style="color:#5D5D5D"><br>
	비밀번호 : <input type="text" id="pwd1" name="pwd1" style="color:#5D5D5D"><br>
	<input type="submit" value="로그인" style="color:#5D5D5D">
</form>

<p>post json방식</p>
<form action="test.formtest" method="POST">
	아이디 : <input type="text" id="id2" name="id2" style="color:#5D5D5D"><br>
	비밀번호 : <input type="text" id="pwd2" name="pwd2" style="color:#5D5D5D"><br>
	<input type="button" value="로그인" onclick="json()" id="btn" style="color:#5D5D5D">
</form>
</body>
<script>
$("#btn").click(function(){
	var params = {};
	params["id"] = $("#id2").val();
	params["pwd"] = $("#pwd2").val();
	
	movePageWithAjax(params, "/test.formtest", callback);
});
function callback(result){
	var div = document.getElementById("result_div")
	div.insertAdjacentHTML("beforeend",result.msg1 + result.id + "<br>");
	div.insertAdjacentHTML("beforeend",result.msg2 + result.pwd + "<br>");
}
	
</script>
<div id="result_div"></div>
</html>