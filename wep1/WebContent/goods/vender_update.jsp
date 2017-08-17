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
				<td class="col-md-2">회사번호</td>
				<td class="col-md-4" colspan="2"><%=request.getParameter("viNum") %></td>
			<tr>
				<td>회사이름</td>
				<td colspan="2" style="color:#5D5D5D">
				<input type="text" id="viName" name="viName"/>
				</td>
			</tr>
			<tr>
				<td>회사설명</td>
				<td colspan="2" style="color:#5D5D5D">
				<input type="text" id="viDesc" name="viDesc"/>
				</td>
			</tr>
			<tr>
				<td>회사주소</td>
				<td colspan="2" style="color:#5D5D5D">
				<input type="text" id="viAddress" name="viAddress"/>
				</td>
			</tr>
			<tr>
				<td>회사전화번호</td>
				<td colspan="2" style="color:#5D5D5D">
				<input type="text" id="viPhone" name="viPhone"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<button id="btnUpdate" class="btn btn-md-2 btn-primary btn-block" 	type="button">회사정보 수정</button>
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
	params["command"] = "venderUpdate";
	params["viName"] = $("#viName").val();
	params["viDesc"] = $("#viDesc").val();
	params["viAddress"] = $("#viAddress").val();
	params["viPhone"] = $("#viPhone").val();
	
	params["viNum"] = "<%=request.getParameter("viNum")%>";
	movePageWithAjax(params, "/list.vender", callbackUpdate);
});
$(document).ready(function(){
	var params = {};
	var page = {}
	page["nowPage"] = "<%=request.getParameter("nowPage")%>";
	params["page"] = page;
	params["command"] = "list";
	movePageWithAjax(params, "/list.vender", callback);
});

function callbackUpdate(result){
	alert(result.msg);
	location.href = result.url;
}

function callback(results){
	var venderList = results.viList;
	var params = {};
	params["command"] = "view";
	params["viNum"] = "<%=request.getParameter("viNum")%>";
	var page = {}
	page["nowPage"] = "<%=request.getParameter("nowPage")%>";
	params["page"] = page;
	movePageWithAjax(params, "/list.vender", callback2);
}
function callback2(result){
	$("#viName").val(result.vender.viName);
	$("#viDesc").val(result.vender.viDesc);
	$("#viAddress").val(result.vender.viAddress);
	$("#viPhone").val(result.vender.viPhone);
	
}

$("#btnGoList").click(function(){
	location.href="/goods/vender_list.jsp?nowPage=" + <%=request.getParameter("nowPage")%>
});
</script>
</body>
</html>