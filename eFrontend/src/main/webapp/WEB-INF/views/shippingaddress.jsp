<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
.row {
	margin-top: 50px;
}

.page-header {
	margin-top: 1px;
	text-align: center;
	color: black;
}
#myDIV {
	margin-top: 100px;
	display: none;
}
</style>
<script type="text/javascript">
document.getElementById('app').onclick = function() {
	myFunction()
};
function myFunction() {
	var x = document.getElementById('myDIV');
	x.style.display = 'block';
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">

			<div
				class="col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">

				<div class="txt-center">
					<h4>List Of Addresses</h4>
				</div>
				<c:forEach items="${shipping}" var="s">

				<div class="row"> 
					<div class="col-xs-6 col-sm-6 col-md-6">
						<address>
							<strong>Shipping Address</strong><br />
							${s.doorno},
							${s.streetname} <br />
							${s.city},
							${s.state} <br />
							${s.country}-
							${s.zipcode}
						</address>
					</div>
					 <div class="col-xs-6 col-sm-6 col-md-6 text-right">
					 			 <c:url value="/cart/order/${s.id}" var="action"></c:url>
                               <a href="${action}" class="btn btn-success pull-left">Deliver</a>
                            </div>
				</div>
				</c:forEach>
			</div>
		</div>
		<center><a onclick="myFunction()" id="app"
		class="btn btn-success btn-default">Add Address</a></center>
		<div id="myDIV">
		 <c:url value="/cart/add/shipping" var="action"></c:url>
		<form:form action="${action}" method="post" modelAttribute="shippingaddress">
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
 </div>


</body>
</html>