
<%@ include file="header.jsp" %>

<title>Login page</title>
<style type="text/css">
body {
	
	margin: 0 auto;
	font-family: "Lucida Sans Unicode", "Lucida Grande", "sans-serif";
	width: 100%;
	height: 100%;
	color:white;
}

.log input {
	width: 95%;
	padding: 12px 20px;
	margin: 8px 0;
	display: block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	resize: none;
	text-align: left;
	color:black;
	
}
.log input:focus {
	border: 1px solid #a8a8a8;
	
}

.log {
	border-radius: 5px;
	background-color: black;
	padding: 40px;
	width: 25%;
	margin: 0 auto;
	margin-top: 20px;
	box-shadow: 1px 1px 5px #888888;
}
.error{
	text-align:center;
	font-family: "Lucida Sans Unicode", "Lucida Grande", "sans-serif";
	color:red;
}
.msg{
	text-align:center;
	font-family: "Lucida Sans Unicode", "Lucida Grande", "sans-serif";
	color:red;
}
</style>



	<c:url value="/j_spring_security_check" var="action"></c:url>
		<form:form action="${action}" class="log" method="post" >

			<center><h3 style="color:white;">Login</h3> </center>
			<br>
			<label for="Username"><span class="glyphicon glyphicon-user"> USER NAME</span></label>
			<input type="text"  name="j_username"  placeholder="Username">
			<label for="Password"><span class="glyphicon glyphicon-lock"> PASSWORD</span></label>
			<input type="password"  name="j_password"  placeholder="password">
			<br>
			<button type="submit" class="btn btn-success center-block" >Login</button>
				 <c:if test="${not empty error}">
				<div class="error"><b>${error}</b></div>
	 			</c:if> 
				<c:if test="${not empty logout}">
			<div class="msg"><b>${logout}</b></div>
				</c:if>	
			<br>
			<br>
	</form:form> 

<%@ include file="footer.jsp" %>