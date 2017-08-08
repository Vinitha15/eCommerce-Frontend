<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Product Form</title>
<style type="text/css">
body {
  height: 700px;
  
}
</style>
</head>
<body style="background-color: powderblue;">
	<div class="container">
		<c:url value="/admin/saveproduct" var="action"></c:url>
		<form:form action="${action}" method="post" name="form" modelAttribute="product" enctype="multipart/form-data" >

			<form:hidden path="id" />
			<div class="form-group">
				<label>Enter Product Name:</label>
				<form:input path="productName" class="form-control" placeholder="Product Name" id="productName" />
				<form:errors path="productName" cssStyle="color:red"></form:errors>
			</div>
			<div class="form-group">
				<label>Enter price</label>
				<form:input path="price" class="form-control" placeholder="Price" />
				<form:errors path="price" cssStyle="color:red"></form:errors>
			</div>
			<div class="form-group">
				<label>Enter quantity</label>
				<form:input path="quantity" class="form-control"
					placeholder="quantity" />
				<form:errors path="quantity" cssStyle="color:red"></form:errors>
			</div>
			<div class="form-group">
				<label>Enter description</label>
				<form:textarea path="description" class="form-control"
					placeholder="description" id="description"/>
				<form:errors path="description" cssStyle="color:red"></form:errors>
			</div>
			<div class="form-group">
				<label>Select Category</label><br>
				<form:select path="category.id">
					<c:forEach items="${categories}" var="c">
						<%-- <form:radiobutton path="category.id" value="${c.id }"  />${c.categoryName }<br> --%>
						<form:option value="${c.id }" label="${c.categoryName }" />
					</c:forEach>
				</form:select>
			</div>
			<div class="form-group">
			<label>Upload an image</label>
			<input type="file" name="image" />
			</div>
			<button type="submit" class="btn btn-success center-block" >Submit</button>
		</form:form>
	</div>
	    
	<%@ include file="footer.jsp"%>
	
	
</body>
</html>