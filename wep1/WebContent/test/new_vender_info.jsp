<%@ include file="/common/header.jsp"%>
<%@ include file="/common/bottom.jsp"%>
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
var thisBlockCnt = 0;
var thisNowPage = 0;
var thisTotalPage = 0;
function callback(results){
	var vendorList = results.viList;
	var goodsList = results.giList;
	var pageInfo = results.pageInfo;
	
	var blockCnt = new Number(pageInfo.blockCnt);
	thisBlockCnt = blockCnt;
	var nowPage= new Number(pageInfo.nowPage);
	thisNowPage = nowPage;
	var startBlock = Math.floor((nowPage-1)/blockCnt) * 10+1;
	var endBlock = startBlock+blockCnt-1;
	var totalPageCnt = new Number(pageInfo.totalPageCnt);
	thisTotalPage = totalPageCnt;
	if(endBlock>totalPageCnt){
		endBlock = totalPageCnt;
	}
	
	setPagination(startBlock, endBlock, pageInfo.nowPage,"page");
	var optionStr = "";
	for(var i=0, max=vendorList.length;i<max;i++){
		optionStr += "<option value='" + vendorList[i].vinum + "'>"+vendorList[i].viname +"</option>";
	}
	$("#s_vendor").html(optionStr);
	//이름을 받아와서 html로 select 옵션에 넣어준다.
    $('#table').bootstrapTable('destroy');
    $('#table').bootstrapTable({
        data: goodsList
    });
    setEvent();
}
$(document).ready(function(){
	var params = {};
	params["nowPage"] = "1";   
	//params.nowPage는 1이라는 해쉬맵 생성.
	movingPage(params, "/test/vender_info_nameSelect.jsp", callback);
});

function setEvent(){
	$("ul[class='pagination']>li>a").bind("click",function(){
		var movePageNum = new Number(this.innerHTML);
		if(isNaN(movePageNum)){
			if(this.innerHTML=="◀"){
				thisNowPage -= 1;
			}else if(this.innerHTML=="◀◁"){
				thisNowPage -= thisBlockCnt;
			}else if(this.innerHTML=="◀◀"){
				thisNowPage = 1;
			}else if(this.innerHTML=="▶"){
				thisNowPage += 1;
			}else if(this.innerHTML=="▷▶"){
				thisNowPage += thisBlockCnt;
			}else if(this.innerHTML=="▶▶"){
				thisNowPage = thisTotalPage;
			}
			if(thisNowPage<=0){
				thisNowPage = 1;
			}else if(thisNowPage>thisTotalPage){
				thisNowPage = thisTotalPage;
			}
			movePageNum = thisNowPage;
		}
		
		var params = {};
		params["nowPage"] = "" + movePageNum;
		//ul이 클래스가 pagination이면서 li안에 a인 값.
		movingPage(params, "/test/vender_info_nameSelect.jsp", callback);
	})
}


</script>


