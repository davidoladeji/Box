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
            <div class="title"><img src="img/icons/dark/full2.png" alt="" class="titleIcon"/><h6>All Customers</h6>
            </div>
            <table cellpadding="0" cellspacing="0" border="0" class="display dTable">
                <thead>
                <tr>
                    <th>S/N</th>
                    <th>Firstname</th>
                    <th>Surname</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Mobile</th>
                    <th>Date of Birth</th>
                    <th>Postcode</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>

                <c:if test="${customersList.size() > 0}">
                    <c:forEach items="${customersList}" var="customer" varStatus="loopStatus">


                        <tr class="${loopStatus.index % 2 == 0 ? 'gradeA' : 'gradeC'}">

                            <td>${loopStatus.index+1}</td>
                            <td>${customer.firstname}</td>
                            <td>${customer.firstname}</td>
                            <td>${customer.email}</td>
                            <c:if test="${customer.gender == 1}">
                                <td>${genderList.get(0).name}</td>
                            </c:if>
                            <c:if test="${customer.gender == 2}">
                                <td>${genderList.get(1).name}</td>
                            </c:if>
                            <td>${customer.mobile}</td>
                            <td>${customer.dob}</td>
                            <td>${customer.postcode}</td>
                            <td>Actions</td>
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