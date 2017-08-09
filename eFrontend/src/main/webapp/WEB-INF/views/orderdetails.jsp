<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<%@ page isELIgnored="false" %>
<jsp:useBean id="now" class="java.util.Date" />
<style>
h4{
font-family: "Lucida Sans Unicode", "Lucida Grande", "sans-serif";
color:black;
text-align: center;
}
strong{
color:blue;
font-family: "Lucida Sans Unicode", "Lucida Grande", "sans-serif";
}
p{
font-family: "Lucida Sans Unicode", "Lucida Grande", "sans-serif";
}
.f{
font-family: "Lucida Sans Unicode", "Lucida Grande", "sans-serif";
}
.page-header{
margin-top: 1px;
text-align: center;
color: black;

}
</style>
<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
         <p class="lead">Order confirmation</p>
        </div>

        <div class="container">
        <c:url value="/cart/confirm" var="url"></c:url>
<form:form action="${url}" modelAttribute="order">
            <div class="row">

                       <div class="col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">

                       <div class="txt-center">
                            <h4>Summary</h4>
                       </div>
                       ORDER ID: ${order.id }
                  
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <address>
                                    <strong>Shipping Address</strong><br/>
                                    ${order.cart.customer.shippingaddress.streetname}
                                <br/>
                                    ${order.cart.customer.shippingaddress.city}, ${order.cart.customer.shippingaddress.state}
                                <br/>
                                     ${order.cart.customer.shippingaddress.country}, ${order.cart.customer.shippingaddress.zipcode}
                                </address>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <p>Shipping Date:&nbsp&nbsp&nbsp <fmt:formatDate type="date" value="${now}" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
                                <p>Delivery Date:&nbsp&nbsp&nbsp ${delivery }</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <address>
                                    <strong>Billing Address</strong><br/>
                                        ${order.cart.customer.billingaddress.streetname}
                                    <br/>
                                        ${order.cart.customer.billingaddress.city}, ${order.cart.customer.billingaddress.state}
                                    <br/>
                                        ${order.cart.customer.billingaddress.country}, ${order.cart.customer.billingaddress.zipcode}
                                </address>
                            </div>
                        </div>

                        <div class="row">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <td class ="f">Product</td>
                                        <td class ="f">Quantity</td>
                                        <td class ="f" class="text-center">Price</td>
                                        <td class ="f" class="text-center" style="text-align: center">Total</td>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:set var="grandTotal" value="0.0"></c:set>
                                <c:forEach var="cartItem" items="${order.cart.cartitems}">
                                    <tr>
                                    	<c:url value="/resources/images/${cartItem.products.id}.png" var="image"></c:url>
									    <td class="col-md-8" class ="f"><img src="${image}" height="50" width="50" />${cartItem.products.productName}</td>
                                        <td class="col-md-1" class ="f" style="text-align: center">${cartItem.quantity}</td>
                                        <td class="col-md-1" class ="f" style="text-align: center">${cartItem.products.price}</td>
                                        <td class="col-md-2" class ="f" style="text-align: center">${cartItem.totalprice}</td>
                                        <c:set var="grandTotal" value="${grandtotal + cartItem.totalprice }"></c:set>
                                    </tr>
                                </c:forEach>

                                <tr>
                                    <td></td>
                                    
                                    <td colspan="2" class="text-center" class ="f">
                                        Grand Total:
                                    </td>
                                    <td class="text-center text-danger" class ="f">
                                        &#8377; ${grandTotal}
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                           <button type="submit" class="btn btn-success center-block" >Order</button>
                        </div>


                      
                    </div>
             
            </div>
            
            </form:form>
        </div>
</div>
</div>
<%-- <%@ include file="footer.jsp" %> --%>
