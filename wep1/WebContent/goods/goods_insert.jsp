<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn"%>

	<div class="container-view"> 
		<table id="table"  data-height="460"	class="table table-bordered table-hover">
		<thead>
			<tr> 
				<th colspan="3" class="text-center"><h5 class="form-signin-heading">사원등록 페이지</h5></th>
			</tr>
			<tr>
			<td>사원이름</td>
				<td colspan="2" style="color:#5D5D5D">
					<input type="text" id="giname" name="giname"/>
				</td>
			</tr>
			<tr>
				<td>사원설명</td>
				<td colspan="2" style="color:#5D5D5D">
					<input type="text" id="gidesc" name="gidesc"/>
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
	movePageWithAjax(params, "/list.goods", callback);
});
function callback(results){
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
}

$("#btnInsert").click(function(){
	var isInsert = confirm("사원을 등록 하시겠습니까?");
	if(isInsert){
		var params = {};
		var giname = $("#giname").val();
		var gidesc = $("#gidesc").val();
		var vinum = $("#s_vender option:selected").val();
		if(giname=="" || gidesc=="" || vinum==""){
			alert("빈 입력란이 존재합니다.");
			return;
		}
		
		params["giName"] = giname;
		params["giDesc"] = gidesc;
		params["viNum"] = vinum;
		params["command"] = "Insert";
		var page = {};
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

$("#btnGoList").click(function(){
	location.href="/goods/goods_list.jsp?nowPage=" + <%=request.getParameter("nowPage")%>
});
</script>
</body>
</html>