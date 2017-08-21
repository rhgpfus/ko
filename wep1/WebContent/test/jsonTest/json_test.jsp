<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="container">
    	<table id="table" data-height="460" class="table table-bordered table-nover">
    		<thead>
    			<tr>
    				<th data-field="jt_num" class="text-center" style="color:#BDBDBD">제이슨번호</th>
    				
    				<th data-field="jt_text" class="text-center" style="color:#BDBDBD">제이슨내용</th>
    			</tr>
    		</thead>
    		<tbody id="json_test"></tbody>
    	</table>
    </div>
번호 : <input type="text" id="jt_num" style="color:#BDBDBD"/>
내용 : <input type="text" id="jt_text" style="color:#BDBDBD"/>
<input type="button" id="insert_json" value="제이슨! 저장해!" style="color:#BDBDBD"><br/>
내용 : <input type="text" id="jt_text2" style="color:#BDBDBD"/>
<input type="button" id="select_json" value="제이슨! 가져와!" style="color:#BDBDBD">
<input type="button" id="delete_json" value="제이슨! 지워!" style="color:#BDBDBD">
<div id="select_json" class="container"></div>
<script>
$("#delete_json").click(function(){
	var content = $("#jt_text2").val();
	var param = {};
	param["content"] = content;
	param = JSON.stringify(param);
	$.ajax({
		type : "POST"
	,	url  : "/test/json_test_delete.jsp"
	,	dataType : "json"
	,	beforeSend : function(xhr){
		xhr.setRequestHeader("Accept", "application/json");
		xhr.setRequestHeader("Content-Type", "application/json");
	}
	,	data : param
	, success : function(result){
		var message = result.message;
		alert(message);
	}
	,	error : function(xhr, status, e){
		alert("헥헥 주인님 에러래여! :" + e);
	}
	,	complete : function(){
	}
	});
});
$("#insert_json").click(function(){
	var num = $("#jt_num").val();
	var content = $("#jt_text").val();
	var param = {};
	param["num"] = num;
	param["content"] = content;
	param = JSON.stringify(param);
	$.ajax({
		type : "POST"
	,	url  : "/test/json_test_insert.jsp"
	,	dataType : "json"
	,	beforeSend : function(xhr){
		xhr.setRequestHeader("Accept", "application/json");
		xhr.setRequestHeader("Content-Type", "application/json");
	}
	,	data : param
	, success : function(result){
		var message = result.message;
		alert(message);
	}
	,	error : function(xhr, status, e){
		alert("헥헥 주인님 에러래여! :" + e);
	}
	,	complete : function(){
	}
	});
});
$("#select_json").click(function(){
	var content = $("#jt_text2").val();
	var param = {};
	param["content"] = content;
	param = JSON.stringify(param);
	$.ajax({
		type : "POST"
	,	url  : "/test/json_test_select.jsp"
	,	dataType : "json"
	,	beforeSend : function(xhr){
		xhr.setRequestHeader("Accept", "application/json");
		xhr.setRequestHeader("Content-Type", "application/json");
	}
	,	data : param
	, success : function(result){
		$('#table').bootstrapTable({
            data: result
        });
	}
	,	error : function(xhr, status, e){
		alert("헥헥 주인님 에러래여! :" + e);
	}
	,	complete : function(){
	}
	});
});
</script>