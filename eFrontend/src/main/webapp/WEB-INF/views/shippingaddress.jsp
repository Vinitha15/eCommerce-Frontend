<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
.row {
	margin-top: 100px;
}
.page-header{
margin-top: 1px;
text-align: center;
color: black;
}
</style>
</head>
<body>
	<div class="container">
		<c:url value="/cart/order" var="action"></c:url>
		<form:form action="${action}" method="post"
			modelAttribute="shippingaddress">
			<form:hidden path="id" />
			<div class="row">
				<div class="page-header">
					<p class="lead">Enter the Shipping address details</p>
				</div>
				<div
					class="col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
					<table class="table table-striped">
						<tr>
							<td>
								<div class="form-group">
									<label>Enter Door no</label>
									<form:input path="doorno" placeholder="doorno"
										class="form-control" />
								</div>
								<div class="form-group">
									<label>Enter Street name</label>
									<form:input path="streetname" placeholder="streetname"
										class="form-control" />
								</div>
								<div class="form-group">
									<label>Enter city</label>
									<form:input path="city" class="form-control" placeholder="city" />

								</div>
							</td>

							<td>

								<div class="form-group">
									<label>Enter state</label>
									<form:input path="state" class="form-control"
										placeholder="state" />

								</div>

								<div class="form-group">
									<label>Enter Country</label>
									<form:input path="country" class="form-control"
										placeholder="country" />

								</div>
								<div class="form-group">
									<label>Enter Zipcode</label>
									<form:input path="zipcode" class="form-control"
										placeholder="zipcode" />

								</div>
							</td>
					</table>
					<button type="submit" class="btn btn-success center-block">Next</button>
				</div>
			</div>
		</form:form>
	</div>

	<%-- <%@ include file="footer.jsp"%> --%>


</body>
</html>