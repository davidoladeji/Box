<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page session="true" %>


<%@ include file="template/header.jsp" %>
<!-- Header End -->

<div id="maincontainer">
  <section id="product">
    <div class="container">
      <div class="row">
        <!-- Sidebar Start-->
        <aside class="span3">
         <!-- Category-->
          <div class="sidewidt">
            <h2 class="heading2"><span>Categories</span></h2>
            <ul class="nav nav-list categories">
              <li>
                <a href="#">Appliances</a>
              </li>
              <li>
                <a href="#">Food Items</a>
              </li>
              <li>
                <a href="#">Computers </a>
              </li>
              <li>
                <a href="#">Canned Stuff</a>
              </li>
              <li>
                <a href="category.html">Others</a>
              </li>
            </ul>
          </div>
         <!--  Best Seller -->
          <div class="sidewidt">
            <h2 class="heading2"><span>Best Seller</span></h2>
            <ul class="bestseller">
              <li>
                <img width="50" height="50" src="img/product-40x40.png" alt="product" title="product">
                <a class="productname" href="product.html"> Product Name</a>
                <span class="procategory">Home Utensils</span>
                <span class="price">$250</span>
              </li>
              <li>
                <img width="50" height="50" src="img/product-40x40.png" alt="product" title="product">
                <a class="productname" href="product.html"> Product Name</a>
                <span class="procategory">Electronics</span>
                <span class="price">$250</span>
              </li>
              <li>
                <img width="50" height="50" src="img/product-40x40.png" alt="product" title="product">
                <a class="productname" href="product.html"> Product Name</a>
                <span class="procategory">Electronics</span>
                <span class="price">$250</span>
              </li>
            </ul>
          </div>
          <!-- Latest Product -->
          <div class="sidewidt">
            <h2 class="heading2"><span>Latest Products</span></h2>
            <ul class="bestseller">
              <li>
                <img width="50" height="50" src="img/product-40x40.png" alt="product" title="product">
                <a class="productname" href="product.html"> Product Name</a>
                <span class="procategory">Women Accessories</span>
                <span class="price">$250</span>
              </li>
              <li>
                <img width="50" height="50" src="img/product-40x40.png" alt="product" title="product">
                <a class="productname" href="product.html"> Product Name</a>
                <span class="procategory">Electronics</span>
                <span class="price">$250</span>
              </li>
              <li>
                <img width="50" height="50" src="img/product-40x40.png" alt="product" title="product">
                <a class="productname" href="product.html"> Product Name</a>
                <span class="procategory">Electronics</span>
                <span class="price">$250</span>
              </li>
            </ul>
          </div>
          <!--  Must have -->
          <div class="sidewidt">
          <h2 class="heading2"><span>Must have</span></h2>
          <div class="flexslider" id="mainslider">
            <ul class="slides">
              <li>
                <img src="img/product1.jpg" alt="" />
              </li>
              <li>
                <img src="img/product2.jpg" alt="" />
              </li>
            </ul>
          </div>
          </div>
        </aside>
        <!-- Sidebar End-->
        <!-- Category-->
        <div class="span9">          
          <!-- Category Products-->
          <section id="category">
            <div class="row">
              <div class="span9">
               <!-- Sorting-->
                <div class="sorting well">
                  <form class=" form-inline pull-left">
                    Sort By :
                    <select class="span2">
                      <option>Default</option>
                      <option>Name</option>
                      <option>Pirce</option>
                      <option>Rating </option>
                      <option>Color</option>
                    </select>
                    &nbsp;&nbsp;
                    Show:
                    <select class="span1">
                      <option>10</option>
                      <option>15</option>
                      <option>20</option>
                      <option>25</option>
                      <option>30</option>
                    </select>
                  </form>
                  <div class="btn-group pull-right">
                    <button class="btn" id="list"><i class="icon-th-list"></i>
                    </button>
                    <button class="btn btn-orange" id="grid"><i class="icon-th icon-white"></i></button>
                  </div>
                </div>
               <!-- Category-->
                <section id="categorygrid">
                  <ul class="thumbnails grid">

                      <c:if test="${searchProductsList.size() == 0}">
                         <h1 class="warning"> No Result(Product) for that search </h1>
                      </c:if>
                      <c:forEach items="${searchProductsList}" varStatus="loopStatus" var="product">

                    <li class="span3">
                      <a class="prdocutname" href="product.html">${product.name}</a>
                      <div class="thumbnail">
                          <c:if test="${product.regularPrice - product.salesPrice > 50}">
                        <span class="sale tooltip-test">Sale</span>
                          </c:if>
                          <c:if test="${product.regularPrice - product.salesPrice > 100}">
                              <span class="offer tooltip-test">Offer</span>
                          </c:if>
                        <a href="#"><img alt="" src="img/product1.jpg"></a>
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
                    </li>
                      </c:forEach>
                  </ul>
                  <ul class="thumbnails list row">

                      <c:if test="${searchProductsList.size() == 0}">
                          <h1 class="warning"> No Result(Product) for that search </h1>
                      </c:if>
                      <c:forEach items="${searchProductsList}" var="product">
                    <li>
                      <div class="thumbnail">
                        <div class="row">
                          <div class="span3">
                              <c:if test="${product.regularPrice - product.salesPrice > 50}">
                                  <span class="sale tooltip-test">Sale</span>
                              </c:if>
                              <c:if test="${product.regularPrice - product.salesPrice > 100}">
                                  <span class="offer tooltip-test">Offer</span>
                              </c:if>
                            <a href="#"><img alt="" src="img/product1.jpg"></a>
                          </div>
                          <div class="span6">
                            <a class="prdocutname" href="product.html">${product.name}</a>
                            <div class="productdiscrption"> ${product.description} </div>
                            <div class="pricetag">
                              <span class="spiral"></span><a href="/cart/add/${product.id}" class="productcart">ADD TO CART</a>
                              <div class="price">
                                <div class="pricenew">&pound; ${product.salesPrice}</div>
                                <div class="priceold">&pound; ${product.regularPrice}</div>
                              </div>
                            </div>
                            <div class="shortlinks">
                              <a class="details" href="/products/viewDetails/${product.id}">DETAILS</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                      </c:forEach>
                  </ul>
                  <div class="pagination pull-right">
                    <ul>
                      <li><a href="#">Prev</a>
                      </li>
                      <li class="active">
                        <a href="#">1</a>
                      </li>
                      <li><a href="#">2</a>
                      </li>
                      <li><a href="#">3</a>
                      </li>
                      <li><a href="#">4</a>
                      </li>
                      <li><a href="#">Next</a>
                      </li>
                    </ul>
                  </div>
                </section>
              </div>
            </div>
          </section>
        </div>
      </div>
    </div>
  </section>
</div>

<!-- Footer -->
<footer id="footer">
  <section class="footersocial">
    <div class="container">
      <div class="row">
        <div class="span3 aboutus">
          <h2>About Us </h2>
          <p> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. <br>
            <br>
            t has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. </p>
        </div>
        <div class="span3 contact">
          <h2>Contact Us </h2>
          <ul>
            <li class="phone"> +123 456 7890, +123 456 7890</li>
            <li class="mobile"> +123 456 7890, +123 456 78900</li>
            <li class="email"> test@test.com</li>
            <li class="email"> test@test.com</li>
          </ul>
        </div>
        <div class="span3 twitter">
          <h2>Twitter </h2>
          <div id="twitter">
          </div>
        </div>
        <div class="span3 facebook">
          <h2>Facebook </h2>
          <div id="fb-root"></div>
          <script src="http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php" type="text/javascript"></script>
          <script type="text/javascript">FB.init("");</script>
          <script type="text/javascript">
//<![CDATA[
document.write('<fb:fan profile_id="80655071208" stream="0"	connections="6"	logobar="0" height="190px"	width="200"css="css/fb.css"></fb:fan> ');
//]]>
</script>
        </div>
      </div>
    </div>
  </section>
  <section class="footerlinks">
    <div class="container">
      <div class="info">
        <ul>
          <li><a href="#">Privacy Policy</a>
          </li>
          <li><a href="#">Terms &amp; Conditions</a>
          </li>
          <li><a href="#">Affiliates</a>
          </li>
          <li><a href="#">Newsletter</a>
          </li>
        </ul>
      </div>
      <div id="footersocial">
        <a href="#" title="Facebook" class="facebook">Facebook</a>
        <a href="#" title="Twitter" class="twitter">Twitter</a>
        <a href="#" title="Linkedin" class="linkedin">Linkedin</a>
        <a href="#" title="rss" class="rss">rss</a>
        <a href="#" title="Googleplus" class="googleplus">Googleplus</a>
        <a href="#" title="Skype" class="skype">Skype</a>
        <a href="#" title="Flickr" class="flickr">Flickr</a>
      </div>
    </div>
  </section>
  <section class="copyrightbottom">
    <div class="container">
      <div class="row">
        <div class="span6"> All images are copyright to their owners. </div>
        <div class="span6 textright"> ShopSimple @ 2012 </div>
      </div>
    </div>
  </section>
  <a id="gotop" href="#">Back to top</a>
</footer>
<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/respond.min.js"></script>
<script src="js/application.js"></script>
<script src="js/bootstrap-tooltip.js"></script>
<script defer src="js/jquery.fancybox.js"></script>
<script defer src="js/jquery.flexslider.js"></script>
<script type="text/javascript" src="js/jquery.tweet.js"></script>
<script  src="js/cloud-zoom.1.0.2.js"></script>
<script  type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript"  src="js/jquery.carouFredSel-6.1.0-packed.js"></script>
<script type="text/javascript"  src="js/jquery.mousewheel.min.js"></script>
<script type="text/javascript"  src="js/jquery.touchSwipe.min.js"></script>
<script type="text/javascript"  src="js/jquery.ba-throttle-debounce.min.js"></script>
<script defer src="js/custom.js"></script>
</body>
</html>