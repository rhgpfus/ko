<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn"%>

	<div class="container-view"> 
		<table id="table"  data-height="460"	class="table table-bordered table-hover">
		<thead>
			<tr> 
				<th colspan="3" class="text-center"><h5 class="form-signin-heading">사원정보 페이지</h5></th>
			</tr>
			<tr>
				<td class="col-md-2">회사번호</td>
				<td class="col-md-4" colspan="2"><%=request.getParameter("viNum") %></td>
			<tr>
				<td>회사이름</td>
				<td colspan="2"><%=request.getParameter("viName") %></td>
			</tr>
			<tr>
				<td>회사설명</td>
				<td colspan="2"><%=request.getParameter("viDesc") %></td>
			</tr>
			<tr>
				<td>회사주소</td>
				<td colspan="2"><%=request.getParameter("viAddress") %></td>
			</tr>
			<tr>
				<td>회사전화번호</td>
				<td colspan="2"><%=request.getParameter("viPhone") %></td>
			</tr>
			<tr>
				<td>
					<button id="btnUpdate" class="btn btn-md-2 btn-primary btn-block" 	type="button">회사 수정</button>
				</td>
				<td>
					<button id="btnDelete" class="btn btn-md-2 btn-primary btn-block" 	type="button">회사 삭제</button>
				</td>
				<td>
					<button id="btnGoList" class="btn btn-md-2 btn-primary btn-block" 	type="button">리스트 이동</button>
				</td>
			</tr>
		</table>
	</div>
	<!-- /container -->
<script>
$("#btnDelete").click(function(){
	var isDelete = confirm("해당 상품을 삭제 하시겠습니까?");
	if(isDelete){
		var params = {};
		params["viNum"] = "<%=request.getParameter("viNum")%>";
		params["command"] = "venderDelete";
		var page = {};
		page["nowPage"] = "<%=request.getParameter("nowPage")%>";
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
$("#btnUpdate").click(function(){
	location.href="/goods/vender_update.jsp?nowPage=" + "<%=request.getParameter("nowPage")%>" + "&viNum=" + "<%=request.getParameter("viNum")%>" 
			
});
$("#btnGoList").click(function(){
	location.href="/goods/vender_list.jsp?nowPage=" + <%=request.getParameter("nowPage")%>
});
</script>
</body>
</html>