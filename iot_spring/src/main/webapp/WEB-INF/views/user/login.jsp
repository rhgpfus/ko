<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>spring 시작이야</title>
</head>
<P>  spring 시작이야!!  ${login}. </P>
<body>
아이디 : <input type="text" id="id" name="id"><br>
비밀번호 : <input type="password" id="pwd" name="pwd"><br>
<button id="btn" type="button">login</button>
</body>
<script>


</script>
</html>