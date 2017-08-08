<%@ include file="header.jsp"%>
<title>Homepage</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description"
	content="Made with WOW Slider - Create beautiful, responsive image sliders in a few clicks. Awesome skins and animations. Bootstrap slider" />

<link rel="stylesheet" type="text/css"
	href="resources/engine1/style.css" />
<script type="text/javascript" src="resources/engine1/jquery.js"></script>

<style type="text/css">
.container1 {
	background: transparent;
	border: 1px solid #b4f7b5;
	border-radius: 10px;
	margin: 10px 10px;
}
#f1_container1 {
	position: relative;
	width: 100px;
	margin-bottom: 10px;
	margin-left: 10px;
	height: 300px;
	z-index: 1;
	
}
#f1_container1 {
	perspective: 1000;
}

.face {
	position: absolute;
	width: 100%;
	height: 100%;
	backface-visibility: hidden;
}
.proname{
	font-size: 15px;
	color: blue;
	text-align: center;
    margin-top: 10px; 
}
 .proprice{
	font-size: 18px;
	color: black;
	text-align: center;
}

.img{
	text-align: center; 
}
 
</style>	

<div id="wowslider-container1">
	<div class="ws_images">
		<ul>
			<c:url value="/resources/data1/images/image.jpg" var="image1"></c:url>
			<li><img src="${image1 }" alt="image"
				title="Welcome!!" id="wows1_0" /></li>
			<c:url value="/resources/data1/images/image1.jpg" var="image2"></c:url>
			<li><img src="${image2 }" alt="image1"
				title="50% Offer" id="wows1_1" /></li>
			<c:url value="/resources/data1/images/image6.jpg" var="image3"></c:url>
			<li><img src="${image3 }" alt="image6"
				title="more varieties" id="wows1_2" /></li>
			<c:url value="/resources/data1/images/images3.jpg" var="image4"></c:url>
			<li><img src="${image4 }" alt="images3"
				title="New Arrivals" id="wows1_3" /></li>
			<c:url value="/resources/data1/images/images5.jpg" var="image5"></c:url>
			<li><img src="${image5 }" alt="images5"
				title="Best Collections" id="wows1_4" /></li>
		</ul>
	</div>
	<div class="ws_bullets">
		<div>
		    <c:url value="/resources/data1/tooltips/images/image.jpg" var="i1"></c:url>
			<a href="#" title="i"><span><img
					src="${i1}" alt="image" />1</span></a>
			<c:url value="/resources/data1/tooltips/images/image1.jpg" var="i2"></c:url>
		    <a href="#" title="image1"><span><img
					src="${i2 }" alt="image1" />2</span></a>
			<c:url value="/resources/data1/tooltips/images/image6.jpg" var="i3"></c:url>
			 <a href="#" title="image6"><span><img
					src="${i3 }" alt="image6" />3</span></a>
			<c:url value="/resources/data1/tooltips/images/images3.jpg" var="i4"></c:url>
			 <a href="#" title="images3"><span><img
					src="${i4 }" alt="images3" />4</span></a>
			<c:url value="/resources/data1/tooltips/images/images5.jpg" var="i5"></c:url>
			 <a href="#" title="images5"><span><img
					src="${i5 }" alt="images5" />5</span></a>
		</div>
	</div>
	<div class="ws_shadow"></div>
</div>
<script type="text/javascript" src="resources/engine1/wowslider.js"></script>
<script type="text/javascript" src="resources/engine1/script.js"></script>
<div class="container1">
		<div class="row">
			<c:forEach items="${product}" var="product">
				<div class="col-md-2">
					<div id="f1_container1">
						<div id="f1_card1" class="shadow">
							<div class="front face">
								<c:url value="/resources/images/${product.id}.png" var="url1"></c:url>
								<c:url value="/all/products/viewproduct/${product.id}" var="url2"></c:url>
								<a href="${url2}"><img src="${url1}" height="150" width="150"/></a>
								<b><p class="proname">${product.productName}</p></b>
								<p class="proprice">&#8377; ${product.price}</p>
							</div>
							<%-- <div class="back face center">
								<p class="proname">${product.productName}</p>
								
								<c:url value="/productdescription?id=${product.id}" var="url"></c:url>
								<p><a href="${url}"><button type="submit" class="btn btn-warning btn-md"><span class="glyphicon glyphicon-eye-open"></span>View</button></a></p>
							</div> --%>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
<%-- <%@ include file="footer.jsp" %> --%>