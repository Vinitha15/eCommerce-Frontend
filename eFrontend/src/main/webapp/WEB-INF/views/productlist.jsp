<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browse Products</title>
<style>
body{
height:700px;
}
</style>
<script>
	$(document).ready(function(){
		var searchCondition=  '${searchCondition}';
		$('.table').DataTable({
			"lengthMenu" :[ [ 3, 5, 7, -1 ], [ 3, 5, 7, "All" ] ],
			"oSearch" : {
				"sSearch" : searchCondition
			}
		})
	});
</script>
</head>
<body>
<div class="container">
	<center><h2>List of Products</h2></center><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<td>Product</td>
				<td>ProductName</td>
				<td>Category</td>
				<td>Price</td>
				<td>Information</td>
				<c:if test="${pageContext.request.userPrincipal.name!=null }">
				<security:authorize access="hasRole('ROLE_ADMIN')">
				<td>Delete</td>
				<td>Update</td>
				</security:authorize>
				</c:if>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${product}" var="p"> 
				<tr>
					<c:url value="/resources/images/${p.id}.png" var="image"></c:url>
					<td><img src="${image}" height="50" width="50" /></td>
					<c:url value="/all/products/viewproduct/${p.id}" var="view"></c:url>
					<td><a href="${view}">${p.productName}</a></td>
					<td>${p.category.categoryName}</td>
					<td>${p.price}</td>
					<td><a href="${view}"><span class="glyphicon glyphicon-info-sign"></span></a></td>
					<c:if test="${pageContext.request.userPrincipal.name!=null }">
					<security:authorize access="hasRole('ROLE_ADMIN')">
					<c:url value="/admin/products/deleteproduct/${p.id}" var="delete"></c:url>
					<td><a href="${delete}"><span class="glyphicon glyphicon-trash"></span></a></td>
					<c:url value="/admin/products/geteditproduct/${p.id}" var="edit"></c:url>
					<td><a href="${edit}"><span class="glyphicon glyphicon-pencil"></span></a></td>
					</security:authorize>
					</c:if>
				</tr>
			</c:forEach> 
		</tbody>
	</table>
	</div>
</body>
</html>
<%@ include file="footer.jsp"%>