<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body>
<div class="container-fluid">

<div id="myCarousel" class="carousel slide" data-ride="carousel" >
            <!-- Indicators -->
            <ol class="carousel-indicators" >
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
                <li data-target="#myCarousel" data-slide-to="5"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                <c:url value="/resources/images/third.jpg" var="url1"></c:url>
                    <img class="first-slide home-image" src="${url1 }" style="width:1320px;height:320px" alt="first slide">
                    <div class="container">
                    </div>
                </div>
                <div class="item">
                	<c:url value="/resources/images/fourth.jpg" var="url2"></c:url>
                    <img class="second-slide home-image " src="${url2 }" style="width:1320px;height:320px" alt="second slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1 style="color:lightgrey">Beauty and Grooming...</h1>
                            <p style="color:orange">Online shopping offers you a lot of varieties than you imagine</p>
                        </div>
                    </div>
                </div>
                 <div class="item">
                 <c:url value="/resources/images/fifth.jpg" var="url3"></c:url>
                    <img class="third-slide home-image " src="${url3 }" style="width:1320px;height:320px" alt="third slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1 style="color:orange">Available with huge discounts</h1>
                            <p style="color:black">Grab more cosmetics with small amount!!</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                	<c:url value="/resources/images/seventh.jpg" var="url4"></c:url>
                    <img class="fourth-slide home-image" src="${url4 }"   style="width:1320px;height:320px" alt="fourth slide" >
                    <div class="container">
                        <div class="carousel-caption">
                            <h1 style="color:orange">Impressive cosmetics under different categories</h1>
                            <p style="color:red">You have numerous products under MakeUp, Spa etc..</p>
                        </div>
                    </div>
                </div>
                 <div class="item">
                 <c:url value="/resources/images/sixth.jpg" var="url5"></c:url>
                    <img class="fifth-slide home-image " src="${url5 }" style="width:1320px;height:320px" alt="fifth slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1 style="color:orange">Unique Products around worldwide</h1>
                            <p style="color:red">You have numerous products under MakeUp, Spa etc..</p>
                        </div>
                    </div>
                </div>
                 <div class="item">
                 <c:url value="/resources/images/first.jpg" var="url6"></c:url>
                    <img class="sixth-slide home-image" src="${url6 }"   style="width:1320px;height:320px" alt="sixth slide" >
                    <div class="container">
                        <div class="carousel-caption">
                            <h1 style="color:white">Bye Kajal of all brands</h1>
                            <p style="color:red">Here, you can see the products under different brands</p>
                        </div>
                    </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev" style="color:black">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next" style="color:black">
                <span class="glyphicon glyphicon-chevron-right" ></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

</div>
</div><br>
</body>
</html>
<%@ include file="footer.jsp"%>