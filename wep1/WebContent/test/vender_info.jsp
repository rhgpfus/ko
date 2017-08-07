<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
    	<table id="table" data-height="460" class="table table-bordered table-nover">
    		<thead>
    			<tr style="color:#BDBDBD">
    				<th data-field="ginum" class="text-center">사원번호</th>
    				<th data-field="giname" class="text-center">사원이름</th>
    				<th data-field="gidesc" class="text-center">사원소개</th>
    				<th data-field="vinum" class="text-center">회사번호</th>
    				<th data-field="viname" class="text-center">회사이름</th>
    			</tr>
    		</thead>
    		<tbody id="result_tbody"></tbody>
    	</table>
</div>
<div class="jb-center" style="text-align : center">
	<ul class="pagination" id="page">
	</ul>
</div>
<select id="s_vendor" style="color:#BDBDBD">
<option value="" >회사선택</option>
</select> 
<select id="s_goods" style="color:#BDBDBD">
<option value="" >선택</option>
<option value="ginum" >사원번호</option>
<option value="giname" >사원이름</option>
</select>
<input type="text" id="ginum" style="color:#BDBDBD"/>
<input type="button" id="select_vi" value="정보보기" style="color:#BDBDBD"/>
<div id="result_div" class="container"></div>
<script>
$(document).ready(function(){
	var params = {};
	params[""]
	params["nowPage"] = "3";
	params = JSON.stringify(params);
	$.ajax({
		type  : "POST"
	,	url   : "/test/vender_info_nameSelect.jsp"
	,	dataType : "json"
	,	beforeSend : function(xhr){
		xhr.setRequestHeader("Accept", "application/json");
		xhr.setRequestHeader("Content-Type", "application/json");
	}
	,	data : params
	,	success : function(result){
		var viList = result.viList;
    	var giList = result.giList;
    	var pageInfo = result.pageInfo;
    	
    	var pageStr = "<li><a>◀◀</a></li>";
		pageStr += "<li><a>◀</a></li>";
    	var nowPage = new Number(pageInfo.nowPage);
    	var blockCnt = new Number(pageInfo.blockCnt);
    	var totalPageCtn = new Number(pageInfo.totalPageCtn);
    	
    	var startblock =(Math.floor((nowPage-1)/blockCnt))*10+1;  //Math.floor 정수만 읽고 소수점자리 다 버린다.
    	var endblock = startblock+blockCnt-1;
    	
    	if(endblock>totalPageCtn){
    		endblock = totalPageCtn;
    	}
    	
    	for(var i=startblock,max=endblock;i<=max;i++){
			if(i==pageInfo.nowPage){
				pageStr += "<li class='active'><a>" + i + "</a></li>";
			}else{
				pageStr += "<li><a onclick='" + i + "()' id='" + i + "'>" + i + "</a></li>";
			}
		}
		pageStr += "<li><a>▶</a></li>";
		pageStr += "<li><a>▶▶</a></li>";
		
		$("#page").html(pageStr);
		$("#i").
		
		for(var i=0,max=viList.length;i<max;i++){  //List안에있는 HashMap<String,String>을 풀어서 가져온다.
			var list = result[i];
			$("#s_vendor").append("<option value='" + viList[i].vinum + "'>" + viList[i].viname + "</option>");
		}
		$('#table').bootstrapTable({
            data: giList
        });
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
		}
	,	error : function(xhr, status, e){
			alert("고똥님 에러가 발생했습니다." + e);
		}
	,	complete : function(){
		}
	});
});

</script>


