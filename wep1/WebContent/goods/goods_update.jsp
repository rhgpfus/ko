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
				<input type="text" id="giName"/>
				</td>
			</tr>
			<tr>
				<td>사원설명</td>
				<td colspan="2" style="color:#5D5D5D">
				<input type="text" id="giDesc"/>
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
					<button id="btnUpdate" class="btn btn-md-2 btn-primary btn-block" 	type="button">수정하기</button>
				</td>
				<td>
					<button id="btnGoList" class="btn btn-md-2 btn-primary btn-block" 	type="button">취소</button>
				</td>
			</tr>
		</table>
	</div>
	<!-- /container -->
<script>
var pageInfo = {};
var nowPage = "<%=request.getParameter("nowPage")%>"
if(nowPage=="null"){
	nowPage = "1";
}

$(document).ready(function(){
	var params = {};
	var page = {};
	page["nowPage"] = nowPage;
	params["page"] = page;
	params["command"] = "list";
	movePageWithAjax(params, "/list.goods", callback);
});
function callback(results){
	var venderList = results.viList;
	var search = results.search;
	var selStr = "<option value='" + "<%=request.getParameter("viNum") %>" + "'>" + "<%=request.getParameter("viName") %>" + "</option>";
	for(var i=0, max=venderList.length; i<max; i++){
		var vender = venderList[i];
		var selectStr = "";
		if(search.viNum==vender.viNum){
			selectStr = "selected";
		}
		selStr += "<option value='" + vender.viNum + "' "+ selectStr + ">"+vender.viName +"</option>";
	}
	$("#s_vender").html(selStr);
}
$("#btnDelete").click(function(){
	var isDelete = confirm("해당 상품을 삭제 하시겠습니까?");
	if(isDelete){
		var params = {};
		params["giNum"] = "<%=request.getParameter("giNum")%>";
		params["command"] = "delete";
		var page = {};
		page["nowPage"] = "<%=request.getParameter("nowPage")%>";
		params["page"] = page;
		movePageWithAjax(params, "/list.goods", callbackView);
	}
});

function callbackView(result){
	alert(result.msg);
	if(result.url!=""){	
		location.href = result.url + "?nowPage=" + result.page.nowPage;
	}
}
$("#btnUpdate").click(function(){
	location.href="/goods/goods_update.jsp?nowPage=" + <%=request.getParameter("nowPage")%> + "&giNum=" + <%=request.getParameter("giNum")%>
});
$("#btnGoList").click(function(){
	location.href="/goods/goods_list.jsp?nowPage=" + <%=request.getParameter("nowPage")%>
});
</script>
</body>
</html>