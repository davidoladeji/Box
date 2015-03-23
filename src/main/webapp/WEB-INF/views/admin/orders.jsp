<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>

<%@ include file="template/productHeader.html" %>
<body>

<!-- Left side content -->
<%@ include file="template/leftSidebar.html" %>
<!-- Right side -->
<div id="rightSide">

    <!-- Top fixed navigation -->
    <%@ include file="template/topNav.html" %>
    <!-- Responsive header -->
    <%@ include file="template/responsiveHeader.html" %>
    <!-- Title area -->
    <%@ include file="template/titleArea.html" %>
    <div class="line"></div>
    <!-- Shortcuts -->
    <%@ include file="template/shortcuts.html" %>
    <div class="line"></div>

    <!-- Main content wrapper -->
    <div class="wrapper">

        <!-- Dynamic table -->
        <div class="widget">
            <div class="title"><img src="img/icons/dark/full2.png" alt="" class="titleIcon"/><h6>All Orders</h6>
            </div>
            <table cellpadding="0" cellspacing="0" border="0" class="display dTable">
                <thead>
                <tr>
                    <th>S/N</th>
                    <th>Customer</th>
                    <th>No. Items</th>
                    <th>Order Status</th>
                    <th>Total Price</th>
                    <th>Choice Warehouse</th>
                    <th>Order Items</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>

                <c:if test="${ordersList.size() > 0}">
                    <c:forEach items="${ordersList}" var="order" varStatus="loopStatus">


                        <tr class="${loopStatus.index % 2 == 0 ? 'gradeA' : 'gradeC'}">

                            <!-- Column 1 SN -->
                            <td>${loopStatus.index+1}</td>

                            <!-- Column 2 Customer name -->
                            <td>${order.account.firstname}, ${order.account.firstname}</td>

                            <!-- Column 3 Number of Items -->


                            <c:if test="${order.orderItem.size() != null && order.orderItem.size() != 0}">
                                <td>There are: ${order.orderItem.size()} Items</td>
                            </c:if>

                            <c:if test="${order.orderItem.size() == 0}">
                                <td>No Order Items</td>
                            </c:if>



                            <!-- Column 4 Status of the Order -->

                            <c:if test="${order.orderStatus == 1}">
                                <td>${orderstatuses.get(0).name}</td>
                            </c:if>
                            <c:if test="${order.orderStatus == 2}">
                                <td>${orderstatuses.get(1).name}</td>
                            </c:if>
                            <c:if test="${order.orderStatus == 3}">
                                <td>${orderstatuses.get(2).name}</td>
                            </c:if>
                            <c:if test="${order.orderStatus == 4}">
                                <td>${orderstatuses.get(3).name}</td>
                            </c:if>

                            <!-- Column 5 Total Price of order -->
                            <td>${order.price}</td>

                            <!-- Column 6 Choice Ware house -->
                            <td>${order.warehouse.location.name}(${order.warehouse.codename})</td>

                            <!-- Column 7 Order Items -->
                            <c:if test="${order.orderItem.size() !=0 && order.orderItem != null}">
                                <td>
                                    <c:forEach items="${order.orderItem}" var="orderitem">
                                        <ul>
                                            <l>${orderitem.product.name}</l>
                                            <l>${orderitem.price}</l>
                                            <l>${orderitem.quantity}</l>

                                            <c:if test="${orderitem.transfer.transferStatusId == 1}">
                                                ${transferstatuses.get(0).name}<br/>
                                                Now at ${orderitem.transfer.destinationWarehouse}
                                            </c:if>
                                            <c:if test="${orderitem.transfer.transferStatusId == 2}">
                                                ${transferstatuses.get(1).name}<br/>
                                                From  ${orderitem.transfer.departureWarehouse}<br/>
                                                ${orderitem.transfer.destinationWarehouse}
                                            </c:if>
                                            <c:if test="${orderitem.transfer.transferStatusId == 3}">
                                                ${transferstatuses.get(2).name}<br/>
                                                From  ${orderitem.transfer.departureWarehouse}<b/>
                                                ${orderitem.transfer.destinationWarehouse}
                                            </c:if>
                                            <c:if test="${orderitem.transfer.transferStatusId == 4}">
                                                ${transferstatuses.get(3).name}<br/>
                                            </c:if>

                                        </ul>
                                    </c:forEach>
                                </td>
                            </c:if>

                            <c:if test="${order.orderItem.size() ==0 || order.orderItem == null}">
                                <td>
                                    <div class="errormsg alert">
                                        <strong>Error!</strong> No orderitem
                                    </div>
                                </td>
                            </c:if>

                            <!-- Column 8 Actions -->
                            <td class="center">Actions</td>
                        </tr>


                    </c:forEach></c:if>

                </tbody>
            </table>
        </div>

    </div>

    <!-- Footer line -->
    <%@ include file="template/Footer.html" %>

</div>

<div class="clear"></div>

</body>
</html>