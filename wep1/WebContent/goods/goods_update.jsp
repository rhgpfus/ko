<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn"%>

	<div class="container-view"> 
		<table id="table"  data-height="460"	class="table table-bordered table-hover">
		<thead>
			<tr> 
				<th colspan="3" class="text-center"><h5 class="form-signin-heading">사원수정 페이지</h5></th>
			</tr>
			<tr>
				<td class="col-md-2">사원번호</td>
				<td class="col-md-4" colspan="2"><%=request.getParameter("giNum") %></td>
			<tr>
				<td>사원이름</td>
				<td colspan="2" style="color:#5D5D5D">
				<input type="text" id="giName" name="giName"/>
				</td>
			</tr>
			<tr>
				<td>사원설명</td>
				<td colspan="2" style="color:#5D5D5D">
				<input type="text" id="giDesc" name="giDesc"/>
				</td>
			</tr>
			<tr>
				<td>회사</td>
				<td colspan="2">
					<select id="s_vender" style="color:#5D5D5D">
					</select>
				</td>
			</tr>
			
			<tr>
				<td>
					<button id="btnUpdate" class="btn btn-md-2 btn-primary btn-block" 	type="button">사원정보 수정</button>
				</td>
				<td>
					<button id="btnGoList" class="btn btn-md-2 btn-primary btn-block" 	type="button">취소</button>
				</td>
			</tr>
		</table>
	</div>
	<!-- /container -->
<script>
$("#btnUpdate").click(function(){
	var params = {};
	params["command"] = "update";
	params["giDesc"] = $("#giDesc").val();
	params["giName"] = $("#giName").val();
	params["viNum"] = $("#s_vender").val();
	params["giNum"] = "<%=request.getParameter("giNum")%>";
	movePageWithAjax(params, "/list.goods", callbackInsert);
});
$(document).ready(function(){
	var params = {};
	params["command"] = "viList";
	movePageWithAjax(params, "/list.goods", callback);
});

function callbackInsert(result){
	alert(result.msg);
	location.href = result.url;
}

function callback(results){
	var venderList = results.viList;
	var selStr = "<option value=''>회사선택</option>";
	for(var i=0, max=venderList.length; i<max; i++){
		var vender = venderList[i];
		selStr += "<option value='" + vender.viNum + "' >"+vender.viName +"</option>";
	}
	$("#s_vender").html(selStr);
	
	var params = {};
	params["command"] = "view";
	params["giNum"] = "<%=request.getParameter("giNum")%>";
	var page = {}
	page["nowPage"] = "<%=request.getParameter("nowPage")%>";
	params["page"] = page;
	movePageWithAjax(params, "/list.goods", callback2);
}
function callback2(result){
	$("#giDesc").val(result.goods.giDesc);
	$("#giName").val(result.goods.giName);
	$("#s_vender").val(result.goods.viNum);
}

$("#btnGoList").click(function(){
	location.href="/goods/goods_list.jsp?nowPage=" + <%=request.getParameter("nowPage")%>
});
</script>
</body>
</html>