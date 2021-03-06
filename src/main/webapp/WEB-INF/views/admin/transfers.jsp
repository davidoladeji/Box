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
                    <th>Chosen Warhouse</th>
                    <th>Distance</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <!-- gradeA, gradeU, gradeX, gradeC -->
                <c:forEach items="${transferList}" var="transfer" varStatus="loopStatus">
                        <tr class="{loopStatus.index % 2 == 0 ? 'gradeC' : 'gradeX'">
                            <td class="center">${loopStatus.index+1}</td>
                            <td>${transfer.departureWarehouse}</td>
                            <td>${transfer.destinationWarehouse}</td>
                            <td class="center">${transfer.mileage}</td>
                            <c:if test="${transfer.transferStatusId == 1}">
                                <td class="success center">${transferStatusList.get(0).name}</td>
                            </c:if>
                            <c:if test="${transfer.transferStatusId == 2}">
                                <td class="warning center">${transferStatusList.get(1).name}</td>
                            </c:if>

                            <c:if test="${transfer.transferStatusId == 3}">
                                <td class="warning center">${transferStatusList.get(2).name}</td>
                            </c:if>
                            <c:if test="${transfer.transferStatusId == 4}">
                                <td class="warning center">${transferStatusList.get(3).name}</td>
                            </c:if>



                            <td><a href="/admin/editTransfer/${transfer.id}"> <img src="img/icons/color/pencil.png" alt=""></a><a href="/admin/deleteTransfer/${transfer.id}"><img src="img/icons/color/cross.png" alt=""></a></td>
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