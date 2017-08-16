<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn"%>

	<div class="container-view"> 
		<table id="table"  data-height="460"	class="table table-bordered table-hover">
		<thead>
			<tr> 
				<th colspan="3" class="text-center"><h5 class="form-signin-heading">회사등록 페이지</h5></th>
			</tr>
			<tr>
			<td>회사이름</td>
				<td colspan="2" style="color:#5D5D5D">
					<input type="text" id="viname" name="viname"/>
				</td>
			</tr>
			<tr>
				<td>회사설명</td>
				<td colspan="2" style="color:#5D5D5D">
					<input type="text" id="videsc" name="videsc"/>
				</td>
			</tr>
			<tr>
				<td>회사주소</td>
				<td colspan="2" style="color:#5D5D5D">
					<input type="text" id="viaddress" name="viaddress"/>
				</td>
			</tr>
			<tr>
				<td>회사전화번호</td>
				<td colspan="2" style="color:#5D5D5D">
					<input type="text" id="viphone" name="viphone"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<button id="btnGoList" class="btn btn-md-2 btn-primary btn-block" 	type="button">취소</button>
				</td>
				<td>
					<button id="btnInsert" class="btn btn-md-2 btn-primary btn-block" 	type="button">등록</button>
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
	movePageWithAjax(params, "/list.vender" , callback);
});
function callback(results){
	var venderList = results.viList; 
}
$("#btnInsert").click(function(){
	var isInsert = confirm("회사를 등록 하시겠습니까?");
	if(isInsert){
		var params = {};
		var viname = $("#viname").val();
		var videsc = $("#videsc").val();
		var viaddress = $("#viaddress").val();
		var viphone = $("#viphone").val();
		
		if(viname=="" || videsc=="" || viaddress=="" || viphone==""){
			alert("빈 입력란이 존재합니다.");
			return;
		}
		
		params["viName"] = viname;
		params["viDesc"] = videsc;
		params["viAddress"] = viaddress;
		params["viPhone"] = viphone;
		params["command"] = "venderInsert";
		var page = {};
		params["page"] = page;
		movePageWithAjax(params, "/list.vender", callbackView);
	}
});

function callbackView(result){
	alert(result.msg);
	if(result.url!=""){	
		location.href = result.url + "?nowPage=" + result.page.nowPage;
	}
}

$("#btnGoList").click(function(){
	location.href="/goods/vender_list.jsp?nowPage=" + <%=request.getParameter("nowPage")%>
});
</script>
</body>
</html>