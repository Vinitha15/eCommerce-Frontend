<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.container1 {
	background: transparent;
	border: 1px solid #b4f7b5;
	border-radius: 10px;
	margin: 10px 10px;
}
#f1_container1 {
	position: relative;
	width: 250px;
	margin-bottom: 10px;
	margin-left: 10px;
	height: 300px;
	z-index: 1;
	height: 300px;
}
#f1_container1 {
	perspective: 1000;
}
#f1_card1 {
	width: 100%;
	height: 100%;
	transform-style: preserve-3d;
	transition: all 1.0s linear;
}
#f1_container1:hover #f1_card1 {
	transform: rotateY(180deg);
	box-shadow: -5px 5px 5px #aaa;
}
.face {
	position: absolute;
	width: 100%;
	height: 100%;
	backface-visibility: hidden;
}
.face.back {
	display: block;
	transform: rotateY(180deg);
	box-sizing: border-box;
	padding: 10px;
	color: white;
	text-align: center;
	background-color:#8986d8;
}
.proname{
	background-color: purple;
	font-size: 20px;
	margin-top: 50px;
}
.proprice{
	font-size: 18px;
	margin-top: 60px;
}
.row{
	margin: 10px 10px; 
}
</style>	
	<div class="container1">
		<div class="row">
			<c:forEach items="${product}" var="product">
				<div class="col-md-3">
					<div id="f1_container1">
						<div id="f1_card1" class="shadow">
							<div class="front face">
								<c:url value="/resources/images/${product.id}.png" var="url1"></c:url>
								<img src="${url1}" />
							</div>
							<div class="back face center">
								<p class="proname">${product.productName}</p>
								<p class="proprice">&#8377; ${product.price}</p>
								<c:url value="/productdescription?id=${product.id}" var="url"></c:url>
								<p><a href="${url}"><button type="submit" class="btn btn-warning btn-md"><span class="glyphicon glyphicon-eye-open"></span>View</button></a></p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>