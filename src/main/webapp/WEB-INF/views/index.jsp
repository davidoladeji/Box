<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page session="true" %>

<%@ include file="template/homeheader.jsp" %>
<!-- Header End -->
<div id="maincontainer">
    <!-- Slider Start-->
    <section class="slider">
        <div class="container">
            <div class="html_carousel">
                <div id="mainslider3">
                    <c:forEach items="${featuredProductsList}" varStatus="loopStatus" var="product">
                    <div class="item">
                        <div>
                            <a href="/products/viewDetails/${product.id}"><img src="/img/product-one.jpg" alt="" title=""/></a>

                            <div class="text">
                                <h1 class="productname"><span
                                        class="bgnone">${product.name}</span></h1>

                                <p>One stop shop for the best user experience online and offline when it comes to speedy and intact wholesale ordering and delivery of kids and family products</p>

                                <div class="productprice">
                                    <div class="productpageprice">
                                        <span class="spiral"></span>&pound; ${product.salesPrice}
                                    </div>
                                    <div class="productpageoldprice">Old price : &pound;${product.regularPrice}</div>
                                    <ul class="rate">
                                        <li class="on"></li>
                                        <li class="on"></li>
                                        <li class="on"></li>
                                        <li class="off"></li>
                                        <li class="off"></li>
                                    </ul>
                                </div>
                                <br>
                                <ul class="productpagecart">
                                    <li><a href="/products/viewDetails/${product.id}" class="cart">View Details</a>
                                    </li>
                                    <li><a href="/cart/add/${product.id}" class="cart">Add to Cart</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    </c:forEach>

                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </section>
    <!-- Slider End-->

    <!-- Section Start-->
    <section class="container otherddetails">
        <div class="otherddetailspart">
            <div class="innerclass free">
                <h2>Free shipping</h2>
                All over in world over &pound; 200
            </div>
        </div>
        <div class="otherddetailspart">
            <div class="innerclass payment">
                <h2>Easy Payment</h2>
                Payment Gatway support
            </div>
        </div>
        <div class="otherddetailspart">
            <div class="innerclass shipping">
                <h2>24hrs Shipping</h2>
                Free For UK Customers
            </div>
        </div>
        <div class="otherddetailspart">
            <div class="innerclass choice">
                <h2>Over 5000 Choice</h2>
                50,000+ Products
            </div>
        </div>
    </section>
    <!-- Section End-->
    <div class="container">
        <div class="row">
            <!-- Featured Product-->
            <div class="span6">
                <section id="featured" class="row mt40">
                    <h1 class="heading1"><span class="maintext">Featured Products</span></h1>
                    <ul class="thumbnails">
                        <c:forEach items="${productsList.subList(0,4)}" var="product">
                        <li class="span3">
                            <a class="prdocutname" href="/products/viewDetails/${product.id}">${product.name}</a>

                            <div class="thumbnail">
                                <a href="/products/viewDetails/${product.id}"><img alt="" src="/img/product1.jpg"></a>

                                <div class="shortlinks">
                                    <a class="details" href="/products/viewDetails/${product.id}">DETAILS</a>
                                </div>
                                <div class="pricetag">
                                    <span class="spiral"></span><a href="/cart/add/${product.id}" class="productcart">ADD TO CART</a>

                                    <div class="price">
                                        <div class="pricenew">&pound; ${product.salesPrice}</div>
                                        <div class="priceold">&pound; ${product.regularPrice}</div>
                                    </div>
                                </div>
                            </div>
                        </li></c:forEach>
                    </ul>
                </section>
            </div>

            <!-- Latest Product-->
            <div class="span6">
                <section id="latest" class="row mt40">
                    <h1 class="heading1"><span class="maintext">Latest Products</span></h1>
                    <ul class="thumbnails">
                <c:if test="${productsList.size() < 9 }">
                        <c:forEach items="${productsList.subList(0,5)}" var="product">

                        <li class="span3">
                            <a class="prdocutname" href="/products/viewDetails/${product.id}">${product.name}</a>

                            <div class="thumbnail">
                                <a href="/products/viewDetails/${product.id}"><img alt="" src="/img/product1a.jpg"></a>

                                <div class="shortlinks">
                                    <a class="details" href="/products/viewDetails/${product.id}">DETAILS</a>
                                </div>
                                <div class="pricetag">
                                    <span class="spiral"></span><a methods="" href="/cart/add/${product.id}" class="productcart">ADD TO CART</a>

                                    <div class="price">
                                        <div class="pricenew">${product.salesPrice}</div>
                                        <div class="priceold">${product.regularPrice}</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                </c:forEach>
                </c:if>
                        <c:if test="${productsList.size() >= 9}">
                            <c:forEach items="${productsList.subList(4,10)}"  var="product">

                                <li class="span3">
                                    <a class="prdocutname" href="/products/viewDetails/${product.id}">${product.name}</a>

                                    <div class="thumbnail">
                                        <a href="/products/viewDetails/${product.id}"><img alt="" src="/img/product1a.jpg"></a>

                                        <div class="shortlinks">
                                            <a class="details" href="/products/viewDetails/${product.id}">DETAILS</a>
                                        </div>
                                        <div class="pricetag">
                                            <span class="spiral"></span><a href="/cart/add/${product.id}" class="productcart">ADD TO CART</a>

                                            <div class="price">
                                                <div class="pricenew">${product.salesPrice}</div>
                                                <div class="priceold">${product.regularPrice}</div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </section>
            </div>
        </div>
    </div>

    <!-- Popular Brands Maybe Later-->
</div>
<!-- /maincontainer -->
<%@ include file="template/footer.html" %>
</body>
</html>