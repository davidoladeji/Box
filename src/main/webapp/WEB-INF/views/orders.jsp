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
                <c:url var="updateUrl" value="/cart/update">  </c:url>
                <form method="post" action="${updateUrl }" id="updateForm">

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
                        <% if (currentCart != null){ %>
                        <% for (Orderitem item : currentCart.getOrderItems()){ %>


                        <tr>
                            <td class="image"><a href="#"><img title="product" alt="product" src="img/product-40x40.png"
                                                               height="50" width="50"></a></td>
                            <td class="name"><a href="#"><%= item.getProduct().getName() %></a></td>
                            <td class="model"><%= item.getProduct().getDescription() %></td>
                            <td class="quantity"><input type="text" size="1" value="<%= item.getQuantity() %>" id="quantity<%= item.getProductId() %>" class="span1">

                            </td>

                            <td class="total"><a href="javascript: submitForm('update', <%= item.getProductId() %>);"><img class="tooltip-test" data-original-title="Update"
                                                                                                                           src="img/update.png" alt=""></a>
                                <a href="javascript: submitForm('remove', <%= item.getProductId() %>);"><img class="tooltip-test" data-original-title="Remove" src="img/remove.png"
                                                                                                             alt=""></a></td>


                            <td class="price">$<%= item.getPrice() %></td>
                            <td class="total">$<%= item.getTotalItemPrice() %></td>

                        </tr>
                        <%}

                        }%>

                    </table>
                </form>
                <%-- </form>
             </div>--%>
                <div class="cartoptionbox">


                    <c:url var="checkOut" value="/checkout">  </c:url>
                    <form method="get" action="${checkOut}" id="checkoutForm">
                        <h4 class="heading4"> Choose preferred warehouse.</h4>
                        <fieldset>
                            <div class="control-group">
                                <label class="control-label">Select Warehouse</label>

                                <div class="controls">


                                    <select name="warehouseId"  id="warehouseId" class="span3 cartcountry">
                                        <c:forEach items="${warehousesList}" var="onewarehouse">
                                            <option label="${onewarehouse.location.name}" value="${onewarehouse.id}">
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>

            </div>
            <div class="container">
                <div class="pull-right">
                    <div class="span4 pull-right">
                        <table class="table table-striped table-bordered ">

                            <tr>
                                <td><span class="extra bold totalamout">Total :</span></td>
                                <td><span class="bold totalamout">$<%= currentCart.getTotal() %></span></td>
                            </tr>
                        </table>
                        <a href="javascript: submitCheckout();" class="btn btn-orange pull-right" >Check Out</a>

                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<script>
    function submitForm(action, productId,warehouseId){

        var quantity = $('#quantity'+productId).val();
        var warehouseId = $('#warehouseId').val();
        $('#updateForm').append('<input type="hidden" name="action" value="'+action+'" />');
        $('#updateForm').append('<input type="hidden" name="productId" value="'+productId+'" />');
        $('#updateForm').append('<input type="hidden" name="quantity" value="'+quantity+'" />');
        $('#updateForm').append('<input type="hidden" name="warehouseId" value="'+warehouseId+'" />');


        $('#updateForm').submit();
    }


    function submitCheckout(){

        $('#checkoutForm').submit();
    }


</script>

<%@ include file="template/footer.html" %>
</body>
</html>