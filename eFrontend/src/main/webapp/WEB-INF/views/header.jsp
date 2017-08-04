<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Angular JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
<link
	href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css"
	rel="stylesheet">
<style type="text/css">
html,body
{
height:100%;
}
.fx{
position:fixed;
z-index:9
}

div.container a {
	color: black;
	text-decoration: none;
	font: 15px Raleway;
	position: relative;
	z-index: 0;
	cursor: pointer;
}
/* Circle behind */
div.circleBehind a:before, div.circleBehind a:after {
	position: absolute;
	top: 22px;
	left: 50%;
	width: 50px;
	height: 50px;
	border: 4px solid #0277bd;
	transform: translateX(-50%) translateY(-50%) scale(0.8);
	border-radius: 50%;
	background: transparent;
	content: "";
	opacity: 0;
	transition: all 0.3s;
	z-index: -1;
}

div.circleBehind a:after {
	border-width: 2px;
	transition: all 0.4s;
}

div.circleBehind a:hover:before {
	opacity: 1;
	transform: translateX(-50%) translateY(-50%) scale(1);
}

div.circleBehind a:hover:after {
	opacity: 1;
	transform: translateX(-50%) translateY(-50%) scale(1.3);
}

nav {
	background-color: #2196f3 !important;
	border-color: darkblue !important;
		text-align: center;
}

nav a:hover {
	color: black !important;
}

.nav.navbar-nav.navbar-right li a {
	color: white;
}

.nav.navbar-nav li a {
	color: white;
}

.navbar-toggle.collapsed li a{
	background-color: #2196f3 !important;

}

.navbar-inverse .navbar-brand {
	color: #ffc107;
}

.dropdown a {
	background-color: #2196f3 !important;
}

.dropdown-menu li a {
	background-color: white !important;
	color: black !important;
	height: 50px;
	text-align: center;
}
</style>

</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container blue circleBehind">
		<div class="container">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#collapse-example"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div class="navbar-header">
				<c:url value="/aboutus" var="url2"></c:url>
				<c:url value="/resources/images/logo2.jpg" var="url5"></c:url>
				<a class="navbar-brand" href="${url2}"><img src="${url5 }"
					class="img-circle" alt="logo" height="30px" width="30px"></a> <a
					class="navbar-brand" href="${url2}">Beauty&Grooming</a>
			</div>
			<div class="collapse navbar-collapse" id="collapse-example">
				<ul class="nav navbar-nav">
					<security:authorize access="hasRole('ROLE_USER')">
					<li><a href="#">Hi ${pageContext.request.userPrincipal.name}!!</a></li>
					</security:authorize>
					<c:url value="/home" var="url1"></c:url>
					<li><a href="${url1}">Home</a></li>
					<li><a href="${url2}">About Us</a></li>
					<c:url value="/all/products/getallproducts" var="url4"></c:url>
					<li><a href="${url4}">Products</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Categories<span class="caret"></span></a>
						<ul class="dropdown-menu">
						
							<li>
							<c:forEach items="${categories}" var="c"> 
							<c:url value="/all/product/searchbycategory?searchCondition=${c.categoryName}" var="category"/>
							<a href="${category}" >${c.categoryName}</a>
							</c:forEach>
							<c:url value="/all/product/searchbycategory?searchCondition=All" var="all"/>
							<a href="${all }" >All</a>
						</ul>
					</li>
					
					<security:authorize access="hasRole('ROLE_ADMIN')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Add<span class="caret"></span></a>
						<ul class="dropdown-menu">
						<li>
							<c:url value="/admin/products/getproductform" var="url3"></c:url>
							<a href="${url3}" >Product</a>
							<c:url value="/admin/products/getcategoryform" var="url4"></c:url>
							<a href="${url4}" >Category</a>
						</ul>
					</li>
					</security:authorize>
					
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:url value="/all/RegistrationForm" var="action"></c:url>
					<c:if test="${pageContext.request.userPrincipal.name==null }">
					<li><a href="${action }"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					</c:if>
					
					<c:if test="${pageContext.request.userPrincipal.name!=null }">
					<security:authorize access="hasRole('ROLE_USER')">
					 <c:url value="/cart/getcart" var="cart"></c:url>
					<li><a href="${cart}"><span class="glyphicon glyphicon-shopping-cart" ></span>Cart ${count}</a></li>
				   </security:authorize> 
				   </c:if>
					
					<c:if test="${pageContext.request.userPrincipal.name==null }">
					<c:url value="/login" var="login"></c:url>
					<li><a href="${login}"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
					</c:if>
					<c:if test="${pageContext.request.userPrincipal.name!=null }">
					<c:url value="/j_spring_security_logout" var="logout"></c:url>
					<li><a href="${logout}"><span class="glyphicon glyphicon-log-out"></span>
							Logout</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	</nav>
</body>
</html>