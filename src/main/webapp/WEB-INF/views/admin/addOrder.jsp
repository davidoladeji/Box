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

        <!-- Validation form -->
        <form:form id="validate" commandName="orders" class="form" method="post" action="/admin/addOrder">
            <fieldset>
                <div class="widget">
                    <div class="title"><img src="img/icons/dark/alert.png" alt="" class="titleIcon"/><h6>Create an
                        Order</h6></div>
                    <div class="formRow">
                        <label>Select Customer:<span class="req">*</span> </label>
                        <div class="formRight searchDrop">
                            <form:select path="account" data-placeholder="Choose a Customer..." class="chzn-select" style="width:350px;" tabindex="2">
                                <c:forEach items="${customersList}" var="customer">
                                    <form:option value="${customer}" label="${customer.firstname}, ${customer.surname}"/>
                                </c:forEach>
                            </form:select>
                        <div class="clear"></div>
                    </div>




                    <div class="formRow">
                        <label>Order Status:<span class="req">*</span> </label>
                        <div class="formRight">

                        <form:select path="orderStatus" type="text" class="validate[required]" >
                            <c:forEach items="${orderstatuses}" var="orderstatus">
                                <form:option path="orderStatus" value="${orderstatus.id}" label="${orderstatus.name}" />
                            </c:forEach>
                        </form:select>
                    </div>
                        <div class="clear"></div>
                    </div>

                        <div class="formRow">
                            <label>Choice Warehouse:<span class="req">*</span> </label>
                            <div class="formRight">

                                <form:select path="warehouse.id" type="text" class="validate[required]" >
                                    <c:forEach items="${warehousesList}" var="warehouse">
                                        <form:option path="warehouse.id" value="${warehouse.id}" label="${warehouse.location.name}" />
                                    </c:forEach>
                                </form:select>
                            </div>
                        <div class="clear"></div>
                    </div>

                        <div class="formRow">
                            <label>Total Price:<span class="req">*</span> </label>
                            <div class="formRight">
                            <form:input path="price" type="text" class="validate[required]" />
                            </div>
                            <div class="clear"></div>
                        </div>


                        <div class="formRow">
                            <label>Select Items in Order</label>
                            <div class="formRight">
                                <form:select path="orderItem" data-placeholder="Choose Items to add to order" style="" class="chzn-select" multiple="true" tabindex="6">
                                    <option value=""></option>
                                    <optgroup label="ALL PRODUCTS">
                                        <c:forEach items="${productsList}" var="product">
                                        <form:option  value="${product.id}" label="${product.name}"/>
                                        </c:forEach>
                                    </optgroup>
                                </form:select>
                            </div>
                            <div class="clear"></div>
                        </div>

                    <div class="formSubmit"><input type="submit" value="submit" class="redB"/></div>
                    <div class="clear"></div>

                </div>

            </fieldset>
        </form:form>


    </div>

    <!-- Footer line -->
    <%@ include file="template/Footer.html" %>

</div>

<div class="clear"></div>

</body>
</html>