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
                    <th>Name</th>
                    <th>Descrtiption</th>
                    <th>Weight</th>
                    <th>Price</th>
                    <th>Sale</th>
                    <th>Item/Box</th>
                    <th>Enabled</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <!-- gradeA, gradeU, gradeX, gradeC -->
                <c:forEach items="${productsList}" var="product" varStatus="loopStatus">
                        <tr class="{loopStatus.index % 2 == 0 ? 'gradeC' : 'gradeX'">
                            <td class="center">${loopStatus.index+1}</td>
                            <td>${product.name}</td>
                            <td>${product.description}</td>
                            <td class="center">${product.weight}</td>
                            <td class="center">${product.regularPrice}</td>
                            <td class="center">${product.salesPrice}</td>
                            <td class="center">${product.itemsperbox}</td>
                            <c:if test="${product.enabled == true}">
                                <td class="success center"><img src="img/icons/dark/check.png" alt=""></td>
                            </c:if>
                            <c:if test="${product.enabled == false}">
                                <td class="warning center"><img src="img/icons/dark/close.png" alt=""></td>
                            </c:if>


                            <td class="image"><a href="#"><img title="product" alt="product" src="img/product-40x40.png"
                                                               height="50" width="50"></a></td>
                            <td><a href="/admin/editProduct/${product.id}"> <img src="img/icons/color/pencil.png" alt=""></a> <a href="/admin/addStock/${product.id}"><img src="img/icons/color/notebook.png" alt=""></a><a href="/admin/deleteProduct/${product.id}"><img src="img/icons/color/cross.png" alt=""></a></td>
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