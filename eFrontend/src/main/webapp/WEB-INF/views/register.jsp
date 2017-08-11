<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.01 Transitional//EN" "http://www.w3.org/TR/html3/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<style type="text/css">

body {
  height: 700px;
  
}
</style>
<script type="text/javascript">
function sync()
{
  var n1 = document.getElementById('d');
  var n2 = document.getElementById('d1');
  var n3 = document.getElementById('s');
  var n4 = document.getElementById('s1');
  var n5 = document.getElementById('ct');
  var n6 = document.getElementById('ct1');
  var n7 = document.getElementById('st');
  var n8 = document.getElementById('st1');
  var n9 = document.getElementById('c');
  var n10 = document.getElementById('c1');
  var n11 = document.getElementById('z');
  var n12 = document.getElementById('z1');
  n2.value = n1.value;
  n4.value = n3.value;
  n6.value = n5.value;
  n8.value = n7.value;
  n10.value = n9.value;
  n12.value = n11.value;
}
function Validate()
{
var str1=document.getElementById("name1").value;
var str2=document.getElementById("name2").value;
if(str1 != str2 ){
	alert("Passwords donot match");
	return false;
}
return true;
} 
</script>
</head>
<body>
	<div class="container wrapper">
		<div class="container">
			<c:url value="/all/saveCustomer" var="action"></c:url>
			<form:form action="${action}" method="post" modelAttribute="customer" >
				<table class="table table-striped">
				<thead>
			<tr>
				<td><button type="button" class="btn btn-info"><span class="glyphicon glyphicon-user"> USER DETAILS</span></button></td>
				<td><button type="button" class="btn btn-info"><span class="glyphicon glyphicon-home"> BILLING ADDRESS</span></button></td>
				<!-- <td><button type="button" class="btn btn-info"><span class="glyphicon glyphicon-home"> SHIPPING ADDRESS</span></button></td> -->
			</tr>
		</thead>
		<tbody>
		<tr>
		<td>
		
					<div class="form-group">
						<form:label path="fname">First Name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</form:label>
						<form:input path="fname" placeholder="First Name" />
						<form:errors path="fname" cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">
						<form:label path="lname">Last Name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</form:label>
						<form:input path="lname" placeholder="Last Name" />
						<form:errors path="lname" cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">
						<form:label path="email">Email&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</form:label>
						<form:input path="email" placeholder="Email" />
						<form:errors path="email" cssStyle="color:red"></form:errors>
						<p style="color:red">${duplicateEmail}</p>
					</div>
					<div class="form-group">
						<form:label path="phone">Phone&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</form:label>
						<form:input path="phone" placeholder="Phone" />
						<form:errors path="phone" cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">
						<form:label path="user.username">User Name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</form:label>
						<form:input path="user.username" placeholder="User Name" />
						<form:errors path="user.username" cssStyle="color:red"></form:errors>
						<p style="color:red">${duplicateuser}</p>
					</div>
					<div class="form-group">
						<form:label path="user.password">Password&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</form:label>
						<form:input path="user.password" type="password" id="name1"
							placeholder="Password" />
						<form:errors path="user.password" cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">
						<label>Confirm Password</label>
						<input type="password" placeholder="Password" id="name2" />
					</div>
				
		
		</td>
		<td>
		
					<div class="form-group">
						<form:input path="billingaddress.doorno" placeholder="Door no" id="d" onkeyup="sync()" />
						<form:errors path="billingaddress.doorno" cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">
						<form:input path="billingaddress.streetname" placeholder="Street name" id="s" onkeyup="sync()"/>
						<form:errors path="billingaddress.streetname" cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">
						<form:input path="billingaddress.city" placeholder="city" id="ct" onkeyup="sync()" />
						<form:errors path="billingaddress.city" cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">
						<form:input path="billingaddress.state" placeholder="State" id="st" onkeyup="sync()"/>
						<form:errors path="billingaddress.state" cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">
						<form:input path="billingaddress.country" placeholder="Country" id="c" onkeyup="sync()"/>
						<form:errors path="billingaddress.country" cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">

						<form:input path="billingaddress.zipcode" placeholder="Zipcode" id="z" onkeyup="sync()"/>
						<form:errors path="billingaddress.zipcode" cssStyle="color:red"></form:errors>
					</div>
					
				
				
		
		</td>
		<%-- <td>
				
					<div class="form-group">
						<form:input path="shippingaddress.doorno" placeholder="Door no" id="d1"/>
						<form:errors path="shippingaddress.doorno" cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">
						<form:input path="shippingaddress.streetname"
							placeholder="Street name" id="s1" />
						<form:errors path="shippingaddress.streetname"
							cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">
						<form:input path="shippingaddress.city" placeholder="city" id="ct1" />
						<form:errors path="shippingaddress.city" cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">
						<form:input path="shippingaddress.state" placeholder="State" id="st1"/>
						<form:errors path="shippingaddress.state" cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">
						<form:input path="shippingaddress.country" placeholder="Country" id="c1"/>
						<form:errors path="shippingaddress.country" cssStyle="color:red"></form:errors>
					</div>
					<div class="form-group">
						<form:input path="shippingaddress.zipcode" placeholder="Zipcode" id="z1"/>
						<form:errors path="shippingaddress.zipcode" cssStyle="color:red"></form:errors>
					</div>
				
				
		</td> --%>
		</tr>
		</tbody>
		</table>
		
			<div class="form-group">
					
				<center>	<button type="submit" class="btn btn-warning" onclick="return Validate()">
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSUBMIT <span
							class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					</button>
					</center>
			</div>
		
		
		
				
				
				
			</form:form>
		</div>
	</div>
	
</body>
</html>
<%@ include file="footer.jsp"%>