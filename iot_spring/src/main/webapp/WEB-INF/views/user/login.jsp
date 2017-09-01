<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ui/signin.css"/>
<body>
	<div class="container">
		<form class="form-signin">
			<h2 class="form-signin-heading">Please login</h2>
			<label for="inputEmail" class="sr-only">ID</label> 
			<input type="text" id="id" name="id" class="form-control" placeholder="ID" required value="${userId}"autofocus>
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password" required>
			<div class="checkbox">
				<label> 
					<input type="checkbox" value="1" id="saveId">Remember me
				</label>
			</div>
			<button id="btn" class="btn_global" type="button">Login</button>
		</form>

	</div>
	<%
	String user = (String)session.getAttribute("user");
	out.print(user);
	%>
	<script>
	$(document).ready(function(){
		var user = "<%=user%>";
		if(user){
			$("input[value='1']").prop("checked",true);
		}
	});
	
	$("#btn").click(function(){
		var id = $("#id").val();
		var pwd = $("#pwd").val();
		var param = {};
		param["userId"] = id;
		param["userPwd"] = pwd;
		param["saveId"] = $("#saveId").prop("checked");
		param = JSON.stringify(param);
		$.ajax({ 
	        type     : "POST"
	    ,   url      : "${rootPath}/user/login"
	    ,   dataType : "json" 
	    ,   beforeSend: function(xhr) {
	        xhr.setRequestHeader("Accept", "application/json");
	        xhr.setRequestHeader("Content-Type", "application/json");
	    }
	    ,   data     : param
	    ,   success : function(result){
	    	alert(result.msg);
	    	if(result.data =="True"){
	    		
	    		location.href = "${rootPath}/user/main";
	    	}else{
	    		$("#id").val("");
	    		$("#pwd").val("");
	    	}
	    }
	    ,   error : function(xhr, status, e) {
		    	alert("에러 : "+e);
		},
		done : function(e) {
		}
		});
		
	});
	
	
</script>

</body>

</html>