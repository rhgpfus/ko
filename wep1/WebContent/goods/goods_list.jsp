<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<div class="container">
	<div class="container" style="text-align: center; padding-top: 20px;padding-bottom: 20px;">
		<select id="s_vender" style="color:#5D5D5D">
		</select> 
		<label>사원이름 : </label> <input type="text" id="giName" /> 
		<input type="button" id="search_Goods" value="검색" style="color:#5D5D5D"/>
		<input type="button" id="insert_Goods" value="사원등록" style="color:#5D5D5D"/>
	</div>
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
<script>

var pageInfo = {};
var nowPage = "<%=request.getParameter("nowPage")%>"
if(nowPage=="null"){
	nowPage = "1";
}
$("#insert_Goods").click(function(){
	location.href = "/goods/goods_insert.jsp";
})
$("#search_Goods").click(function(){
	var giName = $("#giName").val().trim();
	var viNum = $("#s_vender").val().trim();
	if(giName=="" && viNum==""){
		alert("회사 선택이나 사원이름을 입력해주세요.");
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
	params["page"] = nowPage;
	movePageWithAjax(params, "/list.goods", callback);
});

function callback(results){
	var goodsList = results.giList;
	pageInfo = results.page;
	var venderList = results.viList;
	var search = results.search;
	var selStr = "<option value=''>회사선택</option>";
	for(var i=0, max=venderList.length; i<max; i++){
		var vender = venderList[i];
		var selectStr = "";
		if(search.viNum==vender.viNum){
			selectStr = "selected";
		}
		selStr += "<option value='" + vender.viNum + "' "+ selectStr + ">"+vender.viName +"</option>";
	}
	$("#s_vender").html(selStr);
	var params = {};
	if(search.viNum!=0){
		params["viNum"] = search.viNum;
	}
	if(search.giName){
		params["giName"] = search.giName;
	}
	makePagination(pageInfo, "page");
	setEvent(pageInfo, params, "/list.goods");
	//페이지받아와서 뿌려주기,setPagination 실행해서 버튼 받아오기. 
    $('#table').bootstrapTable('destroy');
	var resultStr = "";
	for(var i=0, max=goodsList.length; i<max; i++){
		var goods = goodsList[i];
		resultStr += "<tr data-view='" + goods.giNum + "'>";
		resultStr +="<td class='text-center'>" + goods.giNum + "</td>";
		resultStr +="<td class='text-center'>" + goods.giName + "</td>";
		resultStr +="<td class='text-center'>" + goods.giDesc + "</td>";
		resultStr +="<td class='text-center'>" + goods.viNum + "</td>";
		resultStr +="<td class='text-center'>" + goods.viName + "</td>";
		resultStr +="</tr>";
	}
	$('#result_tbody').html(resultStr);
    $("tbody[id='result_tbody']>tr[data-view]").click(function(){
    	var params = {};
    	params["giNum"] = this.getAttribute("data-view");
    	params["command"] = "view";
    	var page = {};
    	page["nowPage"] = pageInfo.nowPage;
    	params["page"] = page;
    	movePageWithAjax(params, "/list.goods", callbackView);
    })
}

function callbackView(result){
	var url = result.url + "?nowPage=" + result.page.nowPage + "&giNum=" + result.goods.giNum;
	url += "&giName=" + result.goods.giName;
	url += "&giDesc=" + result.goods.giDesc;
	url += "&viNum=" + result.goods.viNum;
	url += "&viName=" + result.goods.viName;
	location.href = url;
}

$(document).ready(function(){
	var page = {};
	page["nowPage"] = nowPage;
	var params = {};
	params["page"] = page;
	params["command"] = "list";
	
	movePageWithAjax(params, "/list.goods", callback);
});

</script>
<%@ include file="/common/bottom.jsp"%>

