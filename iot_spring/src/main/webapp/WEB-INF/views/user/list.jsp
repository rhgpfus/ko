<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<title>유저 리스트</title>
</head>
<script>
	$(document).ready(function(){
		var param = {};
		param["userName"] = "s";
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
		    	    	var userList = result.userList;
		    	    	var result = "";
		    	    	for(var i=0, max=userList.length;i<max;i++){
		    	    		var user = userList[i];
		    	    		result += user.userNum + "," + user.userId;
		    	    		result += user.userName + "," + user.age;
		    	    		result += user.address + "," + user.userRoleLevel;
		    	    		result +="<br>";
		    	    	}
		    	    	$("#userDiv").html(result);
		    	    }
		    	    ,   error : function(xhr, status, e) {
		    		    	alert("에러 : "+e);
		    		},
		    		done : function(e) {
		    		}
		    		};
		$.ajax(a);
	})
</script>
<body>
<div id="userDiv">
</div>
</body>
</html>