<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

h4{
font-weight: bold;
font-family: "Lucida Sans Unicode", "Lucida Grande", "sans-serif";
}
</style>
</head>
<body>
<center><h4>You are an unauthorized person to view this page</h4></center><br>
<c:url value="/resources/images/403.jpg" var="image"></c:url>
<center><img src="${image}" /></center>
</body>
</html>