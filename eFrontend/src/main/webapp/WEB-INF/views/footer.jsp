<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<style type="text/css">

div.footer.navbar-fixed-bottom {
	font-family: Raleway;
	margin: 0 auto;
	padding: 1em 5em;
	text-align: center;
	background: #306379;
}

div.footer.navbar-fixed-bottom span {
	color: white;
}
</style>
	<div class="container-fluid">
		<div class="footer navbar-fixed-bottom">
				<c:url value="/aboutus" var="url2"></c:url>
				<c:url value="/all/RegistrationForm" var="action"></c:url>
				<span>Beauty&Grooming uses a marketplace model to capture the
				regional variations of India. <br>
				<a href="${url2 }" >About US | </a><a href="${action }"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a><br>
				Copyright @ 2017 Beauty&Grooming.com. All Rights Reserved			
				</span>
		</div>

	</div>
</body>
</html>