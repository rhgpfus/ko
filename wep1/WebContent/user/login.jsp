<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.DTO.UserInfo" %>
<link rel="stylesheet" href="<%=rootPath%>/ui/signin.css"/>
<body>
	<div class="container">
		<form class="form-signin" action="<%=rootPath%>/user/login_true.jsp">
			<h2 class="form-signin-heading">Please login</h2>
			<label for="inputEmail" class="sr-only">Id</label> 
			<input type="text" id="id" name="id" class="form-control" placeholder="Id" required autofocus>
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
			<div class="checkbox">
				<label> 
					<input type="checkbox" value="remember-me">Remember me
				</label>
			</div>
			<button id="btn" class="btn_global" type="button">Login</button>
		</form>

	</div>
	<script>
	$("#btn").click(function(){
		var id = $("#id").val();
		var pwd = $("#password").val();
		var param = {};
		param["id"] = id;
		param["password"] = pwd;
		param = JSON.stringify(param);
		$.ajax({ 
	        type     : "POST"
	    ,   url      : "/user/login_true.jsp"
	    ,   dataType : "json" 
	    ,   beforeSend: function(xhr) {
	        xhr.setRequestHeader("Accept", "application/json");
	        xhr.setRequestHeader("Content-Type", "application/json");
	    }
	    ,   data     : param
	    ,   success : function(result){
	    	alert(result.msg);
	    	if(result.login =="ok"){
	    		location.href = "<%=rootPath%>/main.jsp";
	    	}else{
	    		$("#id").val("");
	    		$("#password").val("");
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