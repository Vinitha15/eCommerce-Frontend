<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:powderblue;">
	<div class="container">
		<c:url value="/cart/order" var="action"></c:url>
		<form:form action="${action}" method="post" modelAttribute="shippingaddress">

			<form:hidden path="id" />
			<div class="form-group">
				<label>Enter Door no:</label>
				<form:input path="doorno" class="form-control" placeholder="doorno" />
				<form:errors path="doorno" cssStyle="color:red"></form:errors>
			</div>
			<div class="form-group">
				<label>Enter Street name:</label>
				<form:input path="streetname" class="form-control" placeholder="streetname" />
				<form:errors path="streetname" cssStyle="color:red"></form:errors>
			</div>
			<div class="form-group">
				<label>Enter city</label>
				<form:input path="city" class="form-control"
					placeholder="city" />
				<form:errors path="city" cssStyle="color:red"></form:errors>
			</div>
			<div class="form-group">
				<label>Enter state</label>
				<form:input path="state" class="form-control"
					placeholder="state" id="state"/>
				<form:errors path="state" cssStyle="color:red"></form:errors>
			</div>
			<div class="form-group">
				<label>Enter state</label>
				<form:input path="country" class="form-control"
					placeholder="country" id="state"/>
				<form:errors path="country" cssStyle="color:red"></form:errors>
			</div>
			<div class="form-group">
				<label>Enter state</label>
				<form:input path="zipcode" class="form-control"
					placeholder="zipcode" id="state"/>
				<form:errors path="zipcode" cssStyle="color:red"></form:errors>
			</div>
			<button type="submit" class="btn btn-success center-block" >Next</button>
		</form:form>
	</div>
	    
	<%-- <%@ include file="footer.jsp"%> --%>
	
	
</body>
</html>