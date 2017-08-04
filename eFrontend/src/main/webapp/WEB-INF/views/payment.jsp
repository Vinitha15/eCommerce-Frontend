<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
<title>Insert title here</title>
<script>
	function formCC() {
		var cname = document.getElementById('cname');
		var cexp = document.getElementById('cexp');
		var cvc = document.getElementById('cvc');
		if (Credit(cname, " Enter a valid 16 digit number")) {
			if (isNumeric(cname, "Please enter only numbers")) {
				if (isAlphanumeric(cexp,
						"Please enter valid date of expiry in suggested format")) {
					if (Cvc(cvc, " Enter a valid 3 digit number")) {
						if (isNumeric(cvc, "Please enter only numbers")) {
							return true;
						}
					}
				}
			}
		}
		return false;
	}
	function Credit(elem, helperMsg) {
		if (elem.value.length != 16) {
			alert(helperMsg);
			elem.focus(); // set the focus to this input
			return false;
		}
		return true;
	}
	function Cvc(elem, helperMsg) {
		if (elem.value.length != 3) {
			alert(helperMsg);
			elem.focus(); // set the focus to this input
			return false;
		}
		return true;
	}
	function isAlphabet(elem, helperMsg) {
		var alphaExp = /^[a-z A-Z]+$/;
		if (elem.value.match(alphaExp)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}
	function isAlphanumeric(elem, helperMsg) {
		var alphaExp = /^[0-9a-zA-Z\.\-]+$/;
		if (elem.value.match(alphaExp)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}
	function isNumeric(elem, helperMsg) {
		var numericExpression = /^[0-9]+$/;
		if (elem.value.match(numericExpression)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}
</script>



<style>
body {
	/******************************************************************
  This contains the font, Internet Explorer fall back options and 
  the background color for all of the sites
  ******************************************************************/
	margin: 0 auto;
	font-family: "Lucida Sans Unicode", "Lucida Grande", "sans-serif";
	background: #c3e6f4;
	width: 100%;
	height: 100%;
}
.blueButton {
	background-color: #0088BB;
	cursor: pointer;
	color: #fff;
	font-family: Arial;
	font-size: 15px;
	padding: 9px 23px;
	text-decoration: none;
}
.payment input[type=text] {
	width: 95%;
	padding: 12px 20px;
	margin: 8px 0;
	display: block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	resize: none;
	text-align: left;
}
.payment input[type=text]:focus {
	border: 1px solid #a8a8a8;
}
.payment input[type=submit], .payment input[type=button] {
	float: right;
	margin: -20px 20px 10px 0px;
}
.payment {
	border-radius: 5px;
	background-color: #f8f8f8;
	padding: 40px;
	width: 25%;
	margin: 0 auto;
	margin-top: 20px;
	box-shadow: 1px 1px 5px #888888;
}
/******************************************************************
Below is the form for the confirm order table 
******************************************************************/
/* CSS for Credit Card Payment form */
.credit-card-box .panel-title {
	display: inline;
	font-weight: bold;
}
.credit-card-box .form-control.error {
	border-color: red;
	outline: 0;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(255, 0, 0, 0.6);
}
.credit-card-box label.error {
	font-weight: bold;
	color: red;
	padding: 2px 8px;
	margin-top: 2px;
}
.credit-card-box .payment-errors {
	font-weight: bold;
	color: red;
	padding: 2px 8px;
	margin-top: 2px;
}
.credit-card-box label {
	display: block;
}
/* The old "center div vertically" hack */
.credit-card-box .display-table {
	display: table;
}
.credit-card-box .display-tr {
	display: table-row;
}
.credit-card-box .display-td {
	display: table-cell;
	vertical-align: middle;
	width: 50%;
}
.credit-card-box .panel-heading img {
	min-width: 180px;
}
</style>
</head>
<body>
	<form action="billingpage" class="payment" method="post"
		onsubmit="return formCC()">

			<div class="panel panel-default credit-card-box">
				<div class="panel-heading display-table">
					<div class="row display-tr">
						<h3 class="panel-title display-td">Payment Details</h3>
						<img class="img-responsive pull-right"
							src="http://i76.imgup.net/accepted_c22e0.png">
					</div>
				</div>
			</div>
			<br>
			<label for="cardNumber">CARD NUMBER</label>
			<input type="text" size="16" id="cname" name="cardNumber"
				placeholder="Valid Card Number">
			<label for="cardExpir">EXPIRATION DATE</label>
			<input type="text" size="5" id="cexp" name="cardExpiry"
				placeholder="MM-YY">
			<label for="cardCVC">CV CODE</label>
			<input type="text" size="3" id="cvc" name="cardCVC" placeholder="CVC">

			<br>
			<input type="submit" class="blueButton" style="float: right;"
				value="Confirm Paymet">
			<br>
			<br>
	</form>
</body>
</html>