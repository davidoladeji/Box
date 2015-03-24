<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="template/header.html" %>
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

        <!-- Note -->
        <div class="nNote nInformation hideit">
            <p><strong>INFORMATION: </strong>Pending Transfers and orders to be processed</p>
        </div>

        <!-- Widgets -->
        <div class="widgets">
            <div class="oneTwo">
                <!-- Warehouses list widget -->
                <div class="widget">
                    <div class="title"><img src="img/icons/dark/users.png" alt="" class="titleIcon"/><h6>Warehouses</h6>
                    </div>
                    <ul class="warehouses">
                        <c:forEach items="${warehousesList.subList(0,5)}" var="warehouse">
                            <li>
                                <a href="#" title="" class="floatL"><img src="img/icons/color/store.png" alt=""/></a>

                                <div class="pInfo">
                                    <a href="#" title=""><strong>${warehouse.location.name}</strong></a>
                                    <i>${warehouse.codename}</i>
                                </div>
                                <div class="pLinks">

                                </div>
                                <div class="clear"></div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <!--  Transfers table widget -->
                <div class="widget">
                    <div class="title"><img src="img/icons/dark/timer.png" alt="" class="titleIcon"/><h6>TODO:
                        transfers</h6>

                        <div class="num"><a href="#" class="blueNum">+245</a></div>
                    </div>
                    <table cellpadding="0" cellspacing="0" width="100%" class="sTable taskWidget">
                        <thead>
                        <tr>
                            <td>Description</td>
                            <td width="100">Status</td>
                            <td width="60">Acts</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="taskD"><a href="#" title="">Start beta testing</a></td>
                            <td><span class="red f11">done</span></td>
                            <td class="actBtns"><a href="#" title="Update" class="tipS"><img src="img/icons/edit.png"
                                                                                             alt=""/></a><a href="#"
                                                                                                            title="Remove"
                                                                                                            class="tipS"><img
                                    src="img/icons/remove.png" alt=""/></a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>


            <!-- 2 columns widgets -->
            <div class="oneTwo">

                <!-- Search -->
                <div class="searchWidget">
                    <form action="">
                        <input type="text" name="search" placeholder="Enter search text..."/>
                        <input type="submit" name="find" value=""/>
                    </form>
                </div>
                <!-- Last Purchase info widget -->
                <div class="widget">
                    <div class="title">
                        <img src="img/icons/dark/money.png" alt="" class="titleIcon"/>
                        <h6>Last Order</h6>

                        <div class="topIcons">
                            <a href="#" class="tipS" title="Download statement"><img src="img/icons/downloadTop.png"
                                                                                     alt=""/></a>
                            <a href="#" class="tipS" title="Print invoice"><img src="img/icons/printTop.png"
                                                                                alt=""/></a>
                            <a href="#" class="tipS" title="Edit"><img src="img/icons/editTop.png" alt=""/></a>
                        </div>
                    </div>
                    <div class="newOrder">
                        <div class="userRow">
                            <a href="#" title=""><img src="img/user.png" alt="" class="floatL"/></a>
                            <ul class="leftList">
                                <li><a href="#" title=""><strong>Julia Maria Shine</strong></a></li>
                                <li>Order status:</li>
                            </ul>
                            <ul class="rightList">
                                <li><a href="#" title=""> <strong>#2112</strong></a></li>
                                <li class="orderIcons"><span class="oUnfinished"></span><span class="oShipped tipN"
                                                                                              title="Shipped on Feb 2nd, 2012"></span><span
                                        class="oPaid tipN" title="Paid on Feb 1st, 2012"></span></li>
                            </ul>
                            <div class="clear"></div>
                        </div>

                        <div class="cLine"></div>

                        <div class="orderRow">
                            <ul class="leftList">
                                <li>Date and time:</li>
                                <li>Subtotal amount:</li>
                                <li>Taxes</li>
                            </ul>
                            <ul class="rightList">
                                <li><strong>Jan 31, 2012</strong> | 12:51</li>
                                <li><strong class="green">$5,514.36</strong></li>
                                <li><strong class="orange">- $1,158.54</strong></li>
                            </ul>
                            <div class="clear"></div>
                        </div>

                        <div class="cLine"></div>
                        <div class="totalAmount"><h6 class="floatL blue">Total:</h6><h6 class="floatR blue">
                            $12,157.99</h6>

                            <div class="clear"></div>
                        </div>
                    </div>
                </div>

                <!-- New Customers widget -->
                <div class="widget">
                    <div class="title"><img src="img/icons/dark/add.png" alt="" class="titleIcon"/><h6>New
                        Customers</h6></div>

                    <div class="cLine"></div>

                    <div class="wUserInfo">
                        <a href="#" title="" class="wUserPic"><img src="img/user.png" alt=""/></a>
                        <ul class="leftList">
                            <li><a href="#" title=""><strong>Valery Dow</strong></a></li>
                            <li><a href="#" title="">valery@dow.com</a></li>
                        </ul>
                        <ul class="rightList">
                            <li><a href="#" class="green"><strong>$4,048</strong></a></li>
                            <li><a href="#" class="red">96 purchases</a></li>
                        </ul>
                        <div class="clear"></div>
                    </div>

                    <div class="cLine"></div>

                    <div class="wUserInfo">
                        <a href="#" title="" class="wUserPic"><img src="img/user.png" alt=""/></a>
                        <ul class="leftList">
                            <li><a href="#" title=""><strong>Liam Paterson</strong></a></li>
                            <li><a href="#" title="">liam@paterson.com</a></li>
                        </ul>
                        <ul class="rightList">
                            <li><a href="#" class="green"><strong>$94,127.20</strong></a></li>
                            <li><a href="#" class="red">128 purchases</a></li>
                        </ul>
                        <div class="clear"></div>
                    </div>


                </div>


                <div class="clear"></div>

            </div>
            <div class="clear"></div>
        </div>


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
                                    <div >
                                        No orderitem
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