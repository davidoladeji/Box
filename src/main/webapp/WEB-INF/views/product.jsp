<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page session="true" %>

<%@ include file="template/header.html" %>
<!-- Header End -->

<div id="maincontainer">
    <section id="product">
        <div class="container">
            <!-- Product Details-->
            <div class="row">
                <!-- Left Image-->
                <div class="span5">
                    <ul class="thumbnails mainimage">
                        <li class="span5">
                            <a rel="position: 'inside' , showTitle: false, adjustX:-4, adjustY:-4"
                               class="thumbnail cloud-zoom" href="#">
                                <img src="img/product1big.jpg" alt="" title="">
                            </a>
                        </li>
                        <li class="span5">
                            <a rel="position: 'inside' , showTitle: false, adjustX:-4, adjustY:-4"
                               class="thumbnail cloud-zoom" href="#">
                                <img src="img/product1big.jpg" alt="" title="">
                            </a>
                        </li>
                        <li class="span5">
                            <a rel="position: 'inside' , showTitle: false, adjustX:-4, adjustY:-4"
                               class="thumbnail cloud-zoom" href="#">
                                <img src="img/product1big.jpg" alt="" title="">
                            </a>
                        </li>
                        <li class="span5">
                            <a rel="position: 'inside' , showTitle: false, adjustX:-4, adjustY:-4"
                               class="thumbnail cloud-zoom" href="#">
                                <img src="img/product1big.jpg" alt="" title="">
                            </a>
                        </li>
                    </ul>

                    <ul class="thumbnails mainimage">
                        <li class="producthtumb">
                            <a class="thumbnail">
                                <img src="img/product1.jpg" alt="" title="">
                            </a>
                        </li>
                        <li class="producthtumb">
                            <a class="thumbnail">
                                <img src="img/product1.jpg" alt="" title="">
                            </a>
                        </li>
                        <li class="producthtumb">
                            <a class="thumbnail">
                                <img src="img/product1.jpg" alt="" title="">
                            </a>
                        </li>
                        <li class="producthtumb">
                            <a class="thumbnail">
                                <img src="img/product1.jpg" alt="" title="">
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- Right Details-->
                <div class="span7">
                    <div class="row">
                        <div class="span7">
                            <h1 class="productname"><span class="bgnone">${product.name}</span>
                            </h1>

                            <div class="productprice">
                                <div class="productpageprice">
                                    <span class="spiral"></span>&pound; ${product.salesPrice}
                                </div>
                                <div class="productpageoldprice">Regular price : &pound; ${product.regularPrice}</div>
                                <ul class="rate">
                                    <li class="on"></li>
                                    <li class="on"></li>
                                    <li class="on"></li>
                                    <li class="off"></li>
                                    <li class="off"></li>
                                </ul>
                            </div>
                            <div class="quantitybox">

                                <div class="clear"></div>
                                <div class="control-group">
                                    <div class="controls"><%--
                                        <form:label path="quanity"></form:label>
                                        <form:input path="quanity" name="quamtity"/>--%>


                                    </div>
                                </div>
                            </div>
                            <ul class="productpagecart">
                                <li><a class="cart" href="/cart/add/">Add to Cart</a>
                                </li>
                            </ul>
                            <!-- Product Description tab & comments-->
                            <div class="productdesc">
                                <ul class="nav nav-tabs" id="myTab">
                                    <li class="active"><a href="#description">Description</a>
                                    </li>
                                    <li><a href="#specification">Specification</a>
                                    </li>

                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="description">
                                       ${product.description}
                                    </div>
                                    <div class="tab-pane " id="specification">
                                        <ul class="productinfo">
                                            <li>
                                                <span class="productinfoleft"> Product Weight:</span> ${product.weight}
                                            </li>
                                            <li>
                                                <span class="productinfoleft"> Items/Box</span> ${product.itemsperbox}
                                            </li>

                                            <li>
                                                <span class="productinfoleft"> Total Available: </span> ${totalstock} <i>all warehouses</i>
                                            </li>
                                            <li>
                                                <span class="productinfoleft"> Selling Price: </span> &pound; ${product.salesPrice}
                                            </li>
                                            <li>
                                                <span class="productinfoleft"> Regular Price: </span> &pound; ${product.regularPrice}
                                            </li>

                                            <li>
                                                <span class="productinfoleft"> Product id:</span> ${product.id}
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<%@ include file="template/footer.html" %>
</body>
</html>