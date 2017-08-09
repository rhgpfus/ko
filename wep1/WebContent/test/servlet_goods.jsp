<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
var testParam = {};
testParam1["giNum"] = "1";
testParam1["giName"] = "상품명";
testParam1["giDesc"] = "상품설명";
testParam1["viNum"] = "1";
testParam1["viName"] = "회사명";

function callback(result){
	alert(result.giDesc);
}

movingPage(testParam, "/test.goods", callback); //서블릿에 썻던 유알엘을 쓴다. *.goods도 된다.
</script>
</body>
</html>