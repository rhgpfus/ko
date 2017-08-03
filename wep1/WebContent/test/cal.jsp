<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
		<table id="table" data-height="460"
			class="table table-bordered table-hover">
			<thead>
				<tr>
					<th data-field="calumn"  class="text-center" style="color:#BDBDBD">번호</th>
					<th data-field="num1"  class="text-center" style="color:#BDBDBD">숫자1</th>
					<th data-field="num2"  class="text-center" style="color:#BDBDBD">숫자2</th>
					<th data-field="op"  class="text-center" style="color:#BDBDBD">연산자</th>
					<th data-field="result"  class="text-center" style="color:#BDBDBD">결과값</th>
				</tr>
			</thead>
			<tbody id="result_tbody">
			</tbody>
		</table>
	</div>
연산자 : <input type="text" id="op"/>
<input type="button" id="btn2" value="불러오기" style="color:#4C4C4C">
<div id="result_div" class="container"></div>
<script>
$("#btn").click(function(){
	var num1 = $("#num1").val();
	var num2 = $("#num2").val();
	var op = $("#op").val();
	if(op==""){
		alert("연산자를 선택하세요.");
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
	complete : function() {
		//성공해도 실패해도 무조건 실행한다~~
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
	,	success : function(result){
		 	$('#table').bootstrapTable({
	            data: result
	        });
	}
	,	error : function(xhr, status, e){
		alert("에러 : "+e);
	},	
	complete : function() {
	}
	});
});
</script>
