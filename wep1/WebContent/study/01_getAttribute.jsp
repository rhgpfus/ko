<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
아이디 : <input type="text" id="id1" name="id2" value="deee.html"/><br>
비밀번호 : <input type="password" id="pwd" name="pwd"/><br>
<input type="button" value="전송" onclick="dd()"/>
</body>
<script>

function dd(){
	var name = document.getElementById("id1").getAttribute("name"); 
	//아이디가 id1인 태그안에 있는 name의 속성의~!! 값을 가져온다.
	var name2 = document.getElementById("id1").getAttribute("value"); 
	
	alert(name + name2 );
	
} 

</script>

</html>