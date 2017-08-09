<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

<%
String userId = (String) session.getAttribute("userid");
String userName = "";
int age = 0;
String address = "";
String hp1 = "";
String hp2 = "";
String hp3 = "";
boolean login = false;
if(userId!=null){
	userName = (String) session.getAttribute("username");
	age = (int) session.getAttribute("age");
	address = (String) session.getAttribute("address");
	hp1 = (String) session.getAttribute("hp1");
	hp2 = (String) session.getAttribute("hp2");
	hp3 = (String) session.getAttribute("hp3");
	login = true;
}
String rootPath = request.getContextPath();    //path가 무슨이름이건 거기잇는걸 가져온다.
Date toDate = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
String toDateStr = sdf.format(toDate);

String init = request.getParameter("init");
String defaultUrl = "";
if(init==null && !login){
	defaultUrl = rootPath + "/user/login.jsp?init=1";
	response.sendRedirect(defaultUrl);
}
String nowUrl = request.getRequestURI();
String loginStr = "로그인";
if(login){
	loginStr = "로그아웃";
}
String version = "1.3.2";
%>
<script src="<%=rootPath%>/js/jquery-3.2.1.js?version=<%=version%>"></script>
<script src="<%=rootPath%>/ui/btsp3.7.7/js/bootstrap.min.js?version=<%=version%>"></script>
<script src="<%=rootPath%>/ui/btsp3.7.7/js/bootstrap-table.js?version=<%=version%>"></script>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.7.7/css/bootstrap-theme.min.css?version=<%=version%>"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.7.7/css/bootstrap.min.css?version=<%=version%>"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/common.css?version=<%=version%>"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/cover.css?version=<%=version%>"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.7.7/css/bootstrap-table.css?version=<%=version%>"/>

<script>
Number.prototype.equals = function(obj){
	if(obj instanceof Number){
		return this.toString() == obj.toString();
	}
	return this==obj;
}

function setPagination(sNum, eNum, nPage, nTotal, objId){
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
	if(nPage==nTotal){
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

var rootPath = "<%=rootPath%>";
$(document).ready(function(){
	var nowUrl = "<%=nowUrl%>";
	var obj = $("a[href='" + nowUrl + "']").parent().attr("class","active");
})
function doBoardMove(pageId,bNum){
	var url = "<%=rootPath%>";
	if(pageId=="board"){
		url += rootPath + "/board/board_select.jsp";
	}else if(pageId=="main"){
		url += rootPath + "/main.jsp";
	}else if(pageId=="boardInsert"){
		url += rootPath + "/board/board_insert.jsp";
	}else if(pageId=="boardUpdate",bNum){
		url += rootPath + "/board/board_update.jsp?boardnum=" + bNum;
	}
	location.href = url;
}

function alertOp(){
	alert($("#op").val());
}

function movingPage(pParams, pUrl, pCallBackFunc){
	var params = JSON.stringify(pParams);
	$.ajax({ 
	//j쿼리의 에이작스를 호출
			type     : "POST"
	    ,   url      : pUrl
	    ,   dataType : "json" 
	    //받는 데이터 타입.
	    ,   beforeSend: function(xhr) {
	        xhr.setRequestHeader("Accept", "application/json");
	        xhr.setRequestHeader("Content-Type", "application/json");
	    }
	    ,   data     : params
	    ,   success : pCallBackFunc
	    ,   error : function(xhr, status, e) {
		    	alert("에러 : "+e);
		},
		complete  : function() {
		}
	});
}
</script>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=rootPath%>/main.jsp">HOME</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li id="m1"><a href="/board/board_select.jsp">게시판가기</a></li>
				<li id="m2"><a href="/board/user_information.jsp">유저정보가기</a></li>
				<li id="m3"><a href="#contact">권한정보가기</a></li>
				<li><a href="/user/logout.jsp"><%=loginStr%></a></li>
			</ul>
		</div>
		
	</div>
</nav>

