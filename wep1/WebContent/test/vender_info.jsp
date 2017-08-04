<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
    	<table id="table" data-height="460" class="table table-bordered table-nover">
    		<thead>
    			<tr style="color:#BDBDBD">
    				<th data-field="vinum" class="text-center">회사번호</th>
    				<th data-field="viname" class="text-center">회사이름</th>
    				<th data-field="videsc" class="text-center">회사설명</th>
    				<th data-field="giname" class="text-center">사원이름</th>
    				<th data-field="gidesc" class="text-center">사원소개</th>
    				<th data-field="gidate" class="text-center">날짜</th>
    				<th data-field="gitime" class="text-center">시간</th>
    			</tr>
    		</thead>
    		<tbody id="result_tbody"></tbody>
    	</table>
</div>
<select id="s_vendor" style="color:#BDBDBD">
<option value="" >회사선택</option>
</select> 
사원번호:<input type="text" id="ginum" style="color:#BDBDBD"/>
<input type="button" id="select_vi" value="정보보기" style="color:#BDBDBD"/>
<div id="result_div" class="container"></div>
<script>
$(document).ready(function(){
	$.ajax({
		type  : "POST"
	,	url   : "/test/vender_info_nameSelect.jsp"
	,	dataType : "json"
	,	beforeSend : function(xhr){
		xhr.setRequestHeader("Accept", "application/json");
		xhr.setRequestHeader("Content-Type", "application/json");
	}
	,	data : null
	,	success : function(result){
		for(var i=0;i<result.length;i++){  //List안에있는 HashMap<String,String>을 풀어서 가져온다.
			var list = result[i];
			$("#s_vendor").append("<option value='" + list.vinum + "'>" + list.viname + "</option>");
		}
	}
	,	error : function(xhr, status, e){
		
	}
	,	complete : function(){
	}	
	});
});
$("#select_vi").click(function(){
	var vinum = $("#s_vendor option:selected").val();
	var ginum = $("#ginum").val();
	var command = "select";
	var param = {};
	param["vinum"] = vinum;
	param["command"] = command;
	param = JSON.stringify(param);
	$.ajax({
		type : "POST"
	,	url  : "/test/vender_info_select.jsp"
	,	dataType : "json"
	,	beforeSend : function(xhr){
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
		}
	,	data : param
	,	success : function(result){
			$('#table').bootstrapTable('destroy');  // destroy 페이지를 새로고침할 필요없이 자동으로 새로고침해준다.
			$('#table').bootstrapTable({
          		data: result.list
       		});
			alert(result.msg);
		}
	,	error : function(xhr, status, e){
			alert("고똥님 에러가 발생했습니다." + e);
		}
	,	complete : function(){
		}
	});
});

</script>


