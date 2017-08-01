<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
</head>
<body>

<div class="container">
		<c:url value="/j_spring_security_check" var="action"></c:url>
		<form:form action="${action}" method="post" >

			<div class="form-group">
				<label>Enter User Name:</label>
				<input type="text" name="j_username" class="form-control"  />
				
			</div>
			<div class="form-group">
				<label>Enter Password:</label>
				<input type="password" name="j_password" class="form-control"  />
				
			</div>
			 <c:if test="${not empty error}">
				<div class="error"><b>${error}</b></div>
	 			</c:if> 
				<c:if test="${not empty logout}">
			<div class="msg"><b>${logout}</b></div>
				</c:if>	
			<button type="submit" class="btn btn-success center-block" >Login</button>
	</form:form>
	</div>
</body>
</html>