<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.row{
margin-top: 100px;
}
</style>
</head>
<body style="background-color: powderblue;">
	<div class="container">
		<c:url value="/admin/savecategory" var="action"></c:url>
		
		<form:form action="${action}" method="post" name="form" modelAttribute="category" >

			<form:hidden path="id" />
			 <div class="col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
			 <div class= row>
			  <div class="col-xs-6 col-sm-6 col-md-8">
			<div class="form-group">
				<label>Enter Category Name:</label>
				<form:input path="categoryName" class="form-control" placeholder="Category Name" />
				<form:errors path="categoryName" cssStyle="color:red"></form:errors>
			</div>
			
			<div class="form-group">
				<label>Enter description:</label>
				<input type="textarea" class="form-control" placeholder="Category description" />
			</div>
			
			<button type="submit" class="btn btn-success center-block" >Submit</button>
			</div>
			</div>
			</div>
		</form:form>
	</div>
</body>
</html>
<%@ include file="footer.jsp" %>