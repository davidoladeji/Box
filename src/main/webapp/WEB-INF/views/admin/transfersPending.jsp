<%@ page import="com.davidoladeji.box.model.Orders" %>
<%@ page import="com.davidoladeji.box.repository.OrderRepository" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            <div class="title"><img src="img/icons/dark/full2.png" alt="" class="titleIcon"/><h6>All Products</h6>
            </div>
            <table cellpadding="0" cellspacing="0" border="0" class="display dTable">
                <thead>
                <tr>
                    <th style="width: 1%;" class="center">S/N</th>
                    <th>Transfer from</th>
                    <th style="width: 8%;" class="center">Actions</th>
                </tr>
                </thead>
                <tbody>
                <!-- gradeA, gradeU, gradeX, gradeC -->
                <c:forEach items="${orderitemPendingList}" var="orderitem" varStatus="loopStatus">
                        <tr class="{loopStatus.index % 2 == 0 ? 'gradeC' : 'gradeX'">
                            <td class="center">${loopStatus.index+1}</td>
                            <td>${orderitem.orders.warehouse.location.name}(${orderitem.orders.warehouse.codename})</td>
                            <td><a href="/admin/editOrderItemTransfer/${orderitem.id}"> <img src="img/icons/color/pencil.png" alt=""></a><a href="/admin/deleteOrderItemTransfer/${orderitem.id}"><img src="img/icons/color/cross.png" alt=""></a></td>
                        </tr>
                </c:forEach>
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