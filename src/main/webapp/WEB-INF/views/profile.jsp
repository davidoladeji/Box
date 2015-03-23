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
            <div class="row">

                <!-- My Account-->
                <div class="span9 pull-right">
                    <h1 class="heading1"><span class="maintext">My Accounts</span><span class="subtext">View All your account information</span>
                    </h1>

                    <h3 class="heading3">My Accounts</h3>

                    <div class="myaccountbox">
                        <ul>
                            <li>
                                <a href="#"> Edit your account information</a>
                            </li>
                            <li>
                                <a href="#"> Change your password</a>
                            </li>
                        </ul>
                    </div>
                    <h3 class="heading3">My Orders</h3>

                    <div class="myaccountbox">
                        <ul>
                            <li>
                                <a href="/orderHistory"> View your order history</a>
                            </li>
                            <li>
                                <a href="/track"> Track Orders</a>
                            </li>
                        </ul>
                    </div>


                </div>


            </div>
        </div>
    </section>
</div>
<%@ include file="template/footer.html" %>
</body>
</html>