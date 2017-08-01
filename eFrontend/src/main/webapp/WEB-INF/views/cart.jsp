<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		 <c:url value="/cart/removecart/${i.id}" var="clear"></c:url> 
		 <a href="${clear}" class="btn btn-danger pull-left" ><span
			class="glyphicon glyphicon-remove-sign"></span>Clear Cart</a>
	<c:url value="/cart/shippingaddressform" var="order"></c:url>
		<a href="${order}" class="btn btn-success pull-right" ><span
			class="glyphicon glyphicon-shopping-cart"></span>Check out</a> 
		 <table class="table table-striped">
			<thead>
				<tr>
					<th>ProductName</th>
					<th>Quantity</th>
					<th>Total price</th>
					<th>Remove</th>
				</tr>
			</thead>
			<c:set var="grandtotal" value="0"></c:set>
			<tbody>
			<c:forEach items="${i.cartitems}" var="c">
			<tr>
			<td>${c.products.productName}</td>
			<td>${c.quantity}</td>
			<td>${c.totalprice}</td>
			<td><c:url value="/cart/removecartitem/${c.id}" var="remove"></c:url>
			<c:set var="grandtotal" value="${c.totalprice + grandtotal}"></c:set>
			<a href="${remove}" class="label label-danger pull-left" ><span
			class="glyphicon glyphicon-remove"></span>Remove</a></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		TOTAL PRICE:${grandtotal }
	</div>
</body>
</html>