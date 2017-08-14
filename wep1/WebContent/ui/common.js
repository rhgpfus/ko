/**
 * 공통함수 javascript파일
 */
//javascript Number객체 비교 프로토타입 함수 추가.
Number.prototype.equals = function(obj){
	if(obj instanceof Number){
		return this.toString() == obj.toString();
	}
	return this==obj;
}


//Ajax + json을 이용한 페이지 이동 공통 함수.
function movePageWithAjax(pParams, pUrl, pCallBackFunc, pMethod){
	var params = JSON.stringify(pParams);
	$.ajax({ 
	//j쿼리의 에이작스를 호출
			type     : pMethod ? pMethod : "POST"
				//만족하면 pMethod 이고 만족하지 않으면 "POST"방식으로 된다.
	    ,   url      : pUrl
	    ,   dataType : "json" 
	    //받는 데이터 타입.
	    ,   beforeSend: function(xhr) {
	        xhr.setRequestHeader("Accept", "application/json");
	        xhr.setRequestHeader("Content-Type", "application/json");
	    }
	    ,   data     : params
	    ,   success : pCallBackFunc
	    //제이 쿼리가 success를 호출하게 되면 pCallBackFunc을 호출하게되고,
	    //pCallBackFunc은  callback함수이다.
	    //성공을 한다면 pCallBackFunc(callback)라는 함수를 호출.
	    ,   error : function(xhr, status, e) {
		    	alert("에러 : "+e);
		},
		complete  : function() {
		}
	});
}

//pagination 이벤트 적용 공통 함수
//단,ul태그 > il태그 > a태그 형식이여아 하며
//ul태그의 class명은 반드시 pagination이여야 함.
function setEvent(pageInfo,params, pUrl){
	$("ul[class='pagination']>li:not([class='disabled'],[class='active'])>a").bind("click",function(){
		var thisNowPage = pageInfo.nowPage;
		var movePageNum = new Number(this.innerHTML);
		if(isNaN(movePageNum)){
			if(this.innerHTML=="◀"){
				thisNowPage -= 1;
			}else if(this.innerHTML=="◀◁"){
				thisNowPage -= pageInfo.blockCnt;
			}else if(this.innerHTML=="◀◀"){
				thisNowPage = 1;
			}else if(this.innerHTML=="▶"){
				thisNowPage += 1;
			}else if(this.innerHTML=="▷▶"){
				thisNowPage += pageInfo.blockCnt;
			}else if(this.innerHTML=="▶▶"){
				thisNowPage = pageInfo.totalPageCnt;
			}
			if(thisNowPage<=0){
				thisNowPage = 1;
			}else if(thisNowPage>pageInfo.totalPageCnt){
				thisNowPage = pageInfo.totalPageCnt;
			}
			movePageNum = thisNowPage;
		}
		var page = {};
		page["nowPage"] = "" + movePageNum;
		//ul이 클래스가 pagination이면서 li안에 a인 값.
		var params = {};
		params["page"] = page;
		params["command"] = "list";
		movePageWithAjax(params, pUrl, callback);
	})
}

//하단 페이지 클릭을 자동으로 만들어주는 공통함수.
//param : pageInfo -> 페이지 정보.
//param : objId -> 생성한 페이지 클릭을 넣어줄 객체 아이디.
function makePagination(pageInfo, objId){
	var sNum = pageInfo.startBlock;
	var eNum = pageInfo.endBlock;
	var nPage = pageInfo.nowPage
	var nTotal = pageInfo.totalPageCnt;
	var pageStr = "";
	if(nPage==1){
		pageStr += "<li class='disabled'><a>◀◀</a></li>";
		pageStr += "<li class='disabled'><a>◀◁</a></li>";
		pageStr += "<li class='disabled'><a>◀</a></li>";
	}else{ 
		pageStr += "<li><a>◀◀</a></li>";
		pageStr += "<li><a>◀◁</a></li>";
		pageStr += "<li><a>◀</a></li>";
	}
	for(var i=sNum, max=eNum;i<=max;i++){
		if(i==nPage){
			pageStr += "<li class='active'><a>" + i + "</a></li>";
		}else{
			pageStr += "<li><a>" + i + "</a></li>";
		}
	}
	if(nPage.equals(nTotal)){
		pageStr += "<li class='disabled'><a>▶</a></li>";
		pageStr += "<li class='disabled'><a>▷▶</a></li>";
		pageStr += "<li class='disabled'><a>▶▶</a></li>";
	}else{ 
		pageStr += "<li><a>▶</a></li>";
		pageStr += "<li><a>▷▶</a></li>";
		pageStr += "<li><a>▶▶</a></li>";
	}
	$("#" + objId).html(pageStr);
}