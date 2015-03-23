<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page session="true" %>


<%@ include file="template/specialHeader.jsp" %>
<!-- Header End -->

<div id="maincontainer">
    <section id="product">
        <div class="container">
            <h1 class="heading1"><span class="maintext"> Shopping Cart</span><span class="subtext"> All items in your  Shopping Cart</span>
            </h1>
            <!-- Cart-->
            <div class="cart-info">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th class="image">Image</th>
                        <th class="name">Product Name</th>
                        <th class="model">Model</th>
                        <th class="quantity">Qty</th>
                        <th class="total">Action</th>
                        <th class="price">Unit Price</th>
                        <th class="total">Total</th>

                    </tr>
                    <tr>
                        <td class="image"><a href="#"><img title="product" alt="product" src="img/product-40x40.png"
                                                           height="50" width="50"></a></td>
                        <td class="name"><a href="#">Jeans</a></td>
                        <td class="model">Purchased Product</td>
                        <td class="quantity"><input type="text" size="1" value="1" name="quantity[40]" class="span1">

                        </td>
                        <td class="total"><a href="#"><img class="tooltip-test" data-original-title="Update"
                                                           src="img/update.png" alt=""></a>
                            <a href="#"><img class="tooltip-test" data-original-title="Remove" src="img/remove.png"
                                             alt=""></a></td>


                        <td class="price">$120.68</td>
                        <td class="total">$120.68</td>

                    </tr>
                </table>
            </div>
            <div class="cartoptionbox">


                <form class="form-vertical form-inline">
                    <h4 class="heading4"> Choose preferred warehouse.</h4>
                    <fieldset>
                        <div class="control-group">
                            <label class="control-label">Select Warehouse</label>

                            <div class="controls">
                                <select class="span3 cartcountry">
                                    <option>Country:</option>
                                    <option>United Kindom</option>
                                    <option>United States</option>
                                </select>
                                <input type="submit" value="Get Quotes" class="btn btn-orange">
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="container">
                <div class="pull-right">
                    <div class="span4 pull-right">
                        <table class="table table-striped table-bordered ">

                            <tr>
                                <td><span class="extra bold totalamout">Total :</span></td>
                                <td><span class="bold totalamout">&pound; 150.28</span></td>
                            </tr>
                        </table>
                        <input type="submit" value="CheckOut" class="btn btn-orange pull-right">
                        <input type="submit" value="Continue Shopping" class="btn btn-orange pull-right mr10">
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<%@ include file="template/footer.html" %>
</body>
</html>