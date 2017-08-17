<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<div class="container">
	<div class="container" style="text-align: center; padding-top: 20px;padding-bottom: 20px;">
		<select id="s_vender" style="color:#5D5D5D">
		</select> 
		<label>검색 : </label> <input type="text" id="giName" style="color:#5D5D5D"/> 
		<input type="button" id="search_Goods" value="검색" style="color:#5D5D5D"/>
		
	</div>
    <table id="table" data-height="460" class="table table-bordered table-nover">
    	<thead>
    		<tr style="color:#BDBDBD">
    			<th data-field="viNum" class="text-center">회사번호</th>
    			<th data-field="viName" class="text-center">회사이름</th>
    			<th data-field="viDesc" class="text-center">회사설명</th>
    			<th data-field="viAddress" class="text-center">회사주소</th>
    			<th data-field="viPhone" class="text-center">회사전화번호</th>
    		</tr>
    	</thead>
    <tbody id="result_tbody"></tbody>
    </table>
    <input type="button" id="insert_vender" class="btn btn-primary" value="회사등록"/>
	
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
$("#insert_vender").click(function(){
	location.href = "/goods/vender_insert.jsp";
})

function callback(results){
	var venderList = results.viList;
	pageInfo = results.page;
	
	var params = {};
	makePagination(pageInfo, "page");
	setEvent(pageInfo, params, "/list.vender");
	//페이지받아와서 뿌려주기,setPagination 실행해서 버튼 받아오기. 
	
	$('#table').bootstrapTable('destroy');
	var resultStr = "";
	for(var i=0, max=venderList.length; i<max; i++){
		var vender = venderList[i];
		resultStr += "<tr data-view='" + vender.viNum + "'>";
		resultStr +="<td class='text-center'>" + vender.viNum + "</td>";
		resultStr +="<td class='text-center'>" + vender.viName + "</td>";
		resultStr +="<td class='text-center'>" + vender.viDesc + "</td>";
		resultStr +="<td class='text-center'>" + vender.viAddress + "</td>";
		resultStr +="<td class='text-center'>" + vender.viPhone + "</td>";
		resultStr +="</tr>";
	}
	$('#result_tbody').html(resultStr);
	$("tbody[id='result_tbody']>tr[data-view]").click(function(){
    	var params = {};
    	params["viNum"] = this.getAttribute("data-view");
    	params["command"] = "view";
    	var page = {};
    	page["nowPage"] = pageInfo.nowPage;
    	params["page"] = page;
    	movePageWithAjax(params, "/list.vender", callbackView);
    })
}

function callbackView(result){
	var url = result.url + "?nowPage=" + result.page.nowPage + "&viNum=" + result.vender.viNum;
	url += "&viName=" + result.vender.viName;
	url += "&viDesc=" + result.vender.viDesc;
	url += "&viAddress=" + result.vender.viAddress;
	url += "&viPhone=" + result.vender.viPhone;
	location.href = url;
}

$(document).ready(function(){
	var page = {};
	page["nowPage"] = nowPage;
	var params = {};
	params["page"] = page;
	params["command"] = "list";
	
	movePageWithAjax(params, "/list.vender", callback);
});

</script>
<%@ include file="/common/bottom.jsp"%>

