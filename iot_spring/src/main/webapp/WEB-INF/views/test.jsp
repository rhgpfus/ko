<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<form action="/sp/test/test1" method="get">
<input type="text" name="exam">
<input type="submit">
</form>

<form action="/sp/test/test1" method="post">
<input type="text" name="exam">
<input type="submit">
</form>

<form action="/sp/test/t" method="post">
<input type="text" name="exam">
<input type="submit">
</form>

<P>  The time on the server is 이게뭐지? ->${test}. </P>
${hm.test}
<!-- <P>  gojaimas ${testMsp}. </P> -->
</body>
</html>