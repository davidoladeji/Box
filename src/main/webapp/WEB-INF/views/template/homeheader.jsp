<%@ page import="com.davidoladeji.box.model.Cart" %>
<%@ page import="com.davidoladeji.box.model.Orderitem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>${title} - Buy the Box :: Shopping boxes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300italic,400italic,600,600italic' rel='stylesheet'
          type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Crete+Round' rel='stylesheet' type='text/css'>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/flexslider.css" type="text/css" media="screen" rel="stylesheet"/>
    <link href="css/jquery.fancybox.css" rel="stylesheet">
    <link href="css/cloud-zoom.css" rel="stylesheet">

    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>


</head>
<body>
<!-- Header Start -->
<header>
    <div class="headerstrip">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <a href="index" class="logo pull-left"><img src="img/logo.png" alt="Buy The Box"
                                                            title="Buy The Box"></a>
                    <!-- Top Nav Start -->
                    <div class="pull-left">
                        <div class="navbar" id="topnav">
                            <div class="navbar-inner">
                                <ul class="nav">
                                    <li><a class="home active" href="#">Home</a>
                                    </li><security:authorize access="hasRole('ROLE_ADMIN') OR hasRole('ROLE_USER') OR hasRole('ROLE_EMPLOYEE') OR hasRole('ROLE_DRIVER')">
                                    <li><a class="myaccount" href="/profile">My Account</a>
                                    </li>
                                    <li><a class="shoppingcart" href="/cart">Shopping Cart</a>
                                    </li>
                                    <li><a class="checkout" href="/order">CheckOut</a>
                                    </li></security:authorize>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Top Nav End -->
                    <div class="pull-right">
                        <form:form  action="/search" commandName="productsearch" method="get" class="form-search top-search">
                            <form:input  path="searchterm" type="text" class="input-medium"></form:input>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="headerdetails">
            <security:authorize access="hasRole('ROLE_ADMIN') OR hasRole('ROLE_USER') OR hasRole('ROLE_EMPLOYEE') OR hasRole('ROLE_DRIVER')">
            <div class="pull-right">
                <ul class="nav topcart pull-left">
                    <li class="dropdown hover carticon ">

                        <% Cart currentCart = (Cart)session.getAttribute("cart"); %>

                        <% if (currentCart != null){ %>
                        <a href="#" class="dropdown-toggle"> Shopping Cart <span class="label label-orange font14"><%= currentCart.getOrderItems().size() %> item(s)</span>
                            - $<%= currentCart.getTotal() %><b class="caret"></b></a>
                        <ul class="dropdown-menu topcartopen ">
                            <li>
                                <table>
                                    <tbody>

                                    <% for (Orderitem item : currentCart.getOrderItems()){ %>
                                    <tr>
                                        <td class="image"><a href="product.html"><img width="50" height="50"
                                                                                      src="img/prodcut-40x40.png"
                                                                                      alt="product" title="product"></a>
                                        </td>
                                        <td class="name"><a href="product.html"><%= item.getProduct().getName() %></a></td>
                                        <td class="quantity">x&nbsp;<%= item.getQuantity() %></td>
                                        <td class="total">$<%= item.getTotalItemPrice() %></td>
                                        <td class="remove"><i class="icon-remove"></i></td>
                                    </tr>
                                    <%} %>

                                    </tbody>
                                </table>
                                <table>
                                    <tbody>
                                    <tr>
                                        <td class="textright"><b>Sub-Total:</b></td>
                                        <td class="textright">$<%= currentCart.getSubTotal() %></td>
                                    </tr>
                                    <tr>
                                        <td class="textright"><b>Eco Tax (-2.00):</b></td>
                                        <td class="textright">$2.00</td>
                                    </tr>
                                    <tr>
                                        <td class="textright"><b>VAT (17.5%):</b></td>
                                        <td class="textright">$<%= currentCart.getVatTotal() %></td>
                                    </tr>
                                    <tr>
                                        <td class="textright"><b>Total:</b></td>
                                        <td class="textright">$<%= currentCart.getTotal() %></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="well pull-right buttonwrap">
                                    <a class="btn btn-orange" href="/cart">View Cart</a>
                                    <a class="btn btn-orange" href="/order">Checkout</a>
                                </div>
                            </li>
                        </ul>
                        <% }else{ // if end %>

                        <a href="#" class="dropdown-toggle"> Shopping Cart is Empty
                        </a>
                        <%} %>
                    </li>
                </ul>
            </div>
            </security:authorize>
        </div>
        <div id="categorymenu">
            <nav class="subnav">
                <ul class="nav-pills categorymenu">
                    <li><a class="active" href="/">Home</a></li>
                    <li><a href="/products">Products</a></li>
                    <li><a href="#">Box Account</a>
                        <div>
                            <ul>
                                <security:authorize access="hasRole('ROLE_ADMIN') OR hasRole('ROLE_USER') OR hasRole('ROLE_EMPLOYEE') OR hasRole('ROLE_DRIVER')">
                                    <li><a href="/profile">My Account</a>
                                    </li>
                                    <li><a href="/wishlist">Wishlist</a>
                                    </li></security:authorize>
                                <security:authorize access="hasRole('ROLE_ANONYMOUS')">
                                    <li><a href="/login">Login</a>
                                    </li>
                                    <li><a href="/register">Register</a>
                                    </li>
                                </security:authorize>
                            </ul>
                        </div>
                    </li>
                    <security:authorize access="hasRole('ROLE_ADMIN') OR hasRole('ROLE_USER') OR hasRole('ROLE_EMPLOYEE') OR hasRole('ROLE_DRIVER')">
                        <li><a href="/j_spring_security_logout">Logout</a></li>
                    </security:authorize>
                    <security:authorize access="hasRole('ROLE_ADMIN') OR hasRole('ROLE_EMPLOYEE') OR hasRole('ROLE_DRIVER')">
                        <li><a href="/admin/dashboard">Admin</a></li>
                    </security:authorize>
                </ul>
            </nav>
        </div>
    </div>
</header>
<!-- Header End -->