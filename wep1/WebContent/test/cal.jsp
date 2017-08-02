
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="/js/jquery-3.2.1.js"></script>
<script src="/ui/btsp3.7.7/js/bootstrap.min.js"></script>
<input type="text" id="num1">
<select id="op" name="op">
	<option value="">선택</option>
	<option value="+">+</option>
	<option value="-">-</option>
	<option value="*">*</option>
	<option value="/">/</option>
</select>
<input type="text" id="num2">
<input type="button" id="btn" value="계산">
<input type="text" id="result">

<input type="button" id="btn2" value="불러오기">
<div id="result_div" class="container"></div>
<script>
$("#btn").click(function(){
	var num1 = $("#num1").val();
	var num2 = $("#num2").val();
	var op = $("#op").val();
	if(op==""){
		alert("연산자를 선택하세요.")
	}
	var param = {};
	param["num1"] = num1;
	param["op"] = op;
	param["num2"] = num2;
	param = JSON.stringify(param);
	$.ajax({
		type : "POST"
	,	url  : "/test/cal_ok.jsp"
	,	dataType : "json"
	,	beforeSend : function(xhr){
		xhr.setRequestHeader("Accept", "application/json");
		xhr.setRequestHeader("Content-Type", "application/json");
	}
	,	data : param
	,	success : function(result){
		var re = result.result;
		$("#result").val(re);
	}
	,	error : function(xhr, status, e){
		alert("에러 : "+e);
	},	
	done : function(e) {
	}
	});
});
$("#btn2").click(function(){
	var op = $("#op").val();
	var param = {};
	param["op"] = op;
	
	param = JSON.stringify(param);
	$.ajax({
		type : "POST"
	,	url  : "/test/cal_select.jsp"
	,	dataType : "json"
	,	beforeSend : function(xhr){
		xhr.setRequestHeader("Accept", "application/json");
		xhr.setRequestHeader("Content-Type", "application/json");
	}
	,	data : param
	,	success : function(results){
		var table = "<table border=1>";
		table += "<tr><td>calumn</td><td>num1</td><td>op</td><td>num2</td><td>result</td></tr>";
		for(var i=0, max=results.length;i<max;i++){
			var result = results[i];
			table += "<tr>";
			table += "<td>" + result.calumn + "</td>";
			table += "<td>" + result.num1 + "</td>";
			table += "<td>" + result.op + "</td>";
			table += "<td>" + result.num2 + "</td>";
			table += "<td>" + result.result + "</td>";
			table += "</tr>";
		} 
		table += "</table>";
		$("#result_div").html(table);
	}
	,	error : function(xhr, status, e){
		alert("에러 : "+e);
	},	
	done : function(e) {
	}
	});
});
</script>
</body>
</html>