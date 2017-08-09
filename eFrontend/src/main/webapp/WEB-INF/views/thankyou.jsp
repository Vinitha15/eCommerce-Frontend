<%@ include file="header.jsp" %>
<div class="container">
	<div class="row text-center">
		<div class="col-sm-6 col-sm-offset-3">
			<br>
			<br>
			<h2 style="color: #0fad00">Success</h2>
			<h3>
				<font color="#1327db">Dear ${username}</font>
			</h3>

			<h4>
				<font color="#ba9a55">Your Shipment will be delivered within
					${delivery}.....</font>
			</h4>

			<p style="font-size: 20px; color: #5C5C5C;">Thank you for
				shopping!!!</p>
			<c:url value="/home" var="h"></c:url>
			<a href="${h}" class="btn btn-success"> Visit Again </a> <br>
			<br>
		</div>

	</div>
</div>
