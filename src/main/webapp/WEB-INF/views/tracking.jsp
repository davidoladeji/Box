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
                        <th style="width: 30%" ><strong> Product Name </strong></th>
                        <th style="width: 15%" > Order ID </th>
                        <th style="width: 15%" > Status </th>
                        <th style="width: 20%" > Status </th>
                        <th style="width: 15%" > Status </th>
                        <th style="width: 15%" > Status </th>
                        <th style="width: 8%" > Warehouse </th>


                    </tr>

                    <c:forEach items="${orderitemsList}" var="orderItem">
                    <tr>
                        <c:if test="${orderItem.transferRequirement ==  1}">

                            <td class="image"><a href="#"><img title="product" alt="product" src="img/product-40x40.png"
                                                           height="50" width="50"></a></td>


                            <td class="center">${orderItem.product.name}</td>
                            <td class="center">${orderItem.orders.id}</td>
                            <td class="center"><button class="btn  btn-success">Placed</button></td>
                            <td class="center"><button class="btn">Being packed</button></td>
                            <td class="center"><button class="btn">Dispatched</button></td>
                            <td class="center"><button class="btn">Delivered</button></td>
                            <td class="center">${orderItem.warehouse.location.name}, (${orderItem.warehouse.codename})</td>

                        </c:if>

                        <c:if test="${orderItem.transferRequirement ==  2}">
                            <td class="image"><a href="#"><img title="product" alt="product" src="img/product-40x40.png"
                                                               height="50" width="50"></a></td>

                            <td class="center">${orderItem.product.name}</td>
                            <td class="center">${orderItem.orders.id}</td>
                            <td class="center"><button class="btn">Placed</button></td>
                            <td class="center"><button class="btn btn-success">Being packed</button></td>
                            <td class="center"><button class="btn">Dispatched</button></td>
                            <td class="center"><button class="btn">Delivered</button></td>
                            <td class="center">${orderItem.warehouse.location.name}, (${orderItem.warehouse.codename})</td>

                        </c:if>

                        <c:if test="${orderItem.transferRequirement ==  3}">
                            <td class="image"><a href="#"><img title="product" alt="product" src="img/product-40x40.png"
                                                                     height="50" width="50"></a></td>

                            <td class="center">${orderItem.product.name}</td>
                            <td class="center">${orderItem.orders.id}</td>
                            <td class="center"><button class="btn">Placed</button></td>
                            <td class="center"><button class="btn">Being packed</button></td>
                            <td class="center"><button class="btn btn-success">Dispatched</button></td>
                            <td class="center"><button class="btn">Delivered</button></td>
                            <td class="center">${orderItem.warehouse.location.name}, (${orderItem.warehouse.codename})</td>

                        </c:if>

                        <c:if test="${orderItem.transferRequirement ==  4}">
                            <td class="image"><a href="#"><img title="product" alt="product" src="img/product-40x40.png"
                                                               height="50" width="50"></a></td>

                            <td class="center">${orderItem.product.name}</td>
                            <td class="center">${orderItem.orders.id}</td>
                            <td class="center"><button class="btn">Placed</button></td>
                            <td class="center"><button class="btn">Being packed</button></td>
                            <td class="center"><button class="btn">Dispatched</button></td>
                            <td class="center"><button class="btn btn-success">Delivered</button></td>
                            <td class="center">${orderItem.warehouse.location.name}, (${orderItem.warehouse.codename})</td>

                        </c:if>

                    </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="cartoptionbox">



            </div>

        </div>
    </section>
</div>

<%@ include file="template/footer.html" %>
</body>
</html>