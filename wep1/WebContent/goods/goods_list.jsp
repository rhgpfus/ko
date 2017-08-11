<%@ include file="/common/header.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
    	<table id="table" data-height="460" class="table table-bordered table-nover">
    		<thead>
    			<tr style="color:#BDBDBD">
    				<th data-field="giNum" class="text-center">사원번호</th>
    				<th data-field="giName" class="text-center">사원이름</th>
    				<th data-field="giDesc" class="text-center">사원소개</th>
    				<th data-field="viNum" class="text-center">회사번호</th>
    				<th data-field="viName" class="text-center">회사이름</th>
    			</tr>
    		</thead>
    		<tbody id="result_tbody"></tbody>
    	</table>
</div>
<div class="jb-center" style="text-align : center">
	<ul class="pagination" id="page">
	</ul>
</div>
<select id="s_vender" style="color:#BDBDBD">
</select> 
<label>사원이름 : </label> <input type="text" id="giName" /> 

<input type="button" id="search_Goods" value="검색" style="color:#BDBDBD"/>
<div id="result_div" class="container"></div>
<script>

var pageInfo = {};
$("#search_Goods").click(function(){
	var giName = $("#giName").val().trim();
	var viNum = $("#s_vender").val().trim();
	if(giName=="" && viNum==""){
		alert("회사 선택이나 제품명을 입력해주세요.");
		return;
	}
	var params = {};
	if(giName!=""){
		params["giName"] = giName;
	}
	if(viNum!=""){
		params["viNum"] = viNum;
	}
	params["command"] = "list";
	var page = {};
	page["nowPage"] = "1";
	params["page"] = page;
	movePageWithAjax(params, "/list.goods", callback);
});

function callback(results){
	var venderList = results.viList;
	var goodsList = results.giList;
	var pageInfo = results.page;
	
	var optionStr = "<option value='' >회사선택</option>";
	for(var i=0, max=venderList.length;i<max;i++){
		var vendor = vendorList[i];
		var optionStr = "";
		if(search.viNum==vendor.viNum){
			selectStr = "selected";
		}
		optionStr += "<option value='" + venderList[i].viNum + "'>"+venderList[i].viName +"</option>";
	}
	$("#s_vender").html(optionStr);
	makePagination(pageInfo, "page");
	setEvent(pageInfo,"/list.goods");
	//페이지받아와서 뿌려주기,setPagination 실행해서 버튼 받아오기. 
    $('#table').bootstrapTable('destroy');
    $('#table').bootstrapTable({
        data: goodsList
    });
}
$(document).ready(function(){
	var page = {};
	page["nowPage"] = "1";
	var params = {};
	params["page"] = page;
	params["command"] = "list";
	
	movePageWithAjax(params, "/list.goods", callback);
});

</script>
<%@ include file="/common/bottom.jsp"%>

