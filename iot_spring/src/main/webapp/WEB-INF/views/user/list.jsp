<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<title>유저 리스트</title>
</head>

<div class="container">
	<div class="container" style="text-align: center;"> 
		<label>이름 : </label> <input type="text" id="userName" style="color:#5D5D5D"/> 
		<input type="button" id="searchUser" value="검색" style="color:#5D5D5D"/>
		<button id="btnInsert" class="btn btn-primary"  type="button">회원등록</button>
	</div>
<table id="table" data-height="460" class="table table-bordered table-nover" style="padding-top:500">
    	<thead>
    		<tr style="color:#BDBDBD">
    			<th data-field="userNum" class="text-center">번호</th>
    			<th data-field="userId" class="text-center">아이디</th>
    			<th data-field="userName" class="text-center">이름</th>
    			<th data-field="age" class="text-center">나이</th>
    			<th data-field="address" class="text-center">주소</th>
    			<th data-field="hp" class="text-center">휴대전화</th>
    			<th data-field="gerder" class="text-center">성별</th>
    		</tr>
    	</thead>
    <tbody id="result_tbody"></tbody>
    </table>
</div>
<script>
	$(document).ready(function(){
		var param = {};
		param = JSON.stringify(param);
		var a = { 
		        type     : "POST"
		    	    ,   url      : "${pageContext.request.contextPath}/user/list"
		    	    ,   dataType : "json" 
		    	    ,   beforeSend: function(xhr) {
		    	        xhr.setRequestHeader("Accept", "application/json");
		    	        xhr.setRequestHeader("Content-Type", "application/json");
		    	    }
		    	    ,   data     : param
		    	    ,   success : function(result){
		    	    	$('#table').bootstrapTable('destroy');
		    	    	var userList = result.userList;
		    	    	var result = "";
		    	    	for(var i=0, max=userList.length;i<max;i++){
		    	    		var user = userList[i];
		    	    		result += "<tr data-view='" + user.userNum + "'>";
		    	    		result += "<td class='text-center'>" + user.userNum  + "</td>";
		    	    		result += "<td class='text-center'>" + user.userId  + "</td>";
		    	    		result += "<td class='text-center'>" + user.userName  + "</td>";
		    	    		result += "<td class='text-center'>" + user.age  + "</td>";
		    	    		result += "<td class='text-center'>" + user.address  + "</td>";
		    	    		result += "<td class='text-center'>" + user.hp1 + "-" + user.hp2 + "-" + user.hp3 + "</td>";
		    	    		var gender = user.gender;
		    	    		if(gender=="1"){
		    	    			result += "<td class='text-center'>" + "남" + "</td>";
		    	    		}else{
		    	    			result += "<td class='text-center'>" + "여"  + "</td>";
		    	    		}
		    	    		result +="</tr>";
		    	    	}
		    	    	$("#result_tbody").html(result);
		    	    }
		    	    ,   error : function(xhr, status, e) {
		    		    	alert("에러 : "+e);
		    		},
		    		done : function(e) {
		    		}
		    		};
		$.ajax(a);
	})
	
	$("#searchUser").click(function(){
		var username = $("#userName").val().trim();
		if(username==""){
			alert("검색란을 입력해주세요.");
			return;
		}
		var param = {};
		param["userName"] = username;
		param = JSON.stringify(param);
		var a = { 
		        type     : "POST"
		    	    ,   url      : "${pageContext.request.contextPath}/user/list"
		    	    ,   dataType : "json" 
		    	    ,   beforeSend: function(xhr) {
		    	        xhr.setRequestHeader("Accept", "application/json");
		    	        xhr.setRequestHeader("Content-Type", "application/json");
		    	    }
		    	    ,   data     : param
		    	    ,   success : function(result){
		    	    	$('#table').bootstrapTable('destroy');
		    	    	var userList = result.userList;
		    	    	var result = "";
		    	    	for(var i=0, max=userList.length;i<max;i++){
		    	    		var user = userList[i];
		    	    		result += "<tr data-view='" + user.userNum + "'>";
		    	    		result += "<td class='text-center'>" + user.userNum  + "</td>";
		    	    		result += "<td class='text-center'>" + user.userId  + "</td>";
		    	    		result += "<td class='text-center'>" + user.userName  + "</td>";
		    	    		result += "<td class='text-center'>" + user.age  + "</td>";
		    	    		result += "<td class='text-center'>" + user.address  + "</td>";
		    	    		result += "<td class='text-center'>" + user.hp1 + "-" + user.hp2 + "-" + user.hp3 + "</td>";
		    	    		var gender = user.gender;
		    	    		if(gender=="1"){
		    	    			result += "<td class='text-center'>" + "남" + "</td>";
		    	    		}else{
		    	    			result += "<td class='text-center'>" + "여"  + "</td>";
		    	    		}
		    	    		result +="</tr>";
		    	    	}
		    	    	$("#result_tbody").html(result);
		    	    }
		    	    ,   error : function(xhr, status, e) {
		    		    	alert("에러 : "+e);
		    		},
		    		done : function(e) {
		    		}
		    		};
		$.ajax(a);
		
			
});
</script>

</body>
</html>