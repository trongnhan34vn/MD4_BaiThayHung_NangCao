<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nhan
  Date: 02/05/2023
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/bootstrap-shit.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <!-- TITLE : START -->
    <div class="page-header">
        <h1>Project 04 - Shopping Cart <small>ReactJS</small></h1>
    </div>
    <!-- TITLE : END -->

    <div class="row">
        <!-- LIST PRODUCT : START -->
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h1 class="panel-title">List Products</h1>
                </div>

                <div class="panel-body" id="list-product">
                    <c:forEach items="${productList}" var="product">
                        <!-- PRODUCT : START -->
                        <div class="media product">
                            <div class="media-left">
                                <a href="#">
                                    <img class="media-object" src="images/pizza.jpg" alt="pizza">
                                </a>
                            </div>
                            <form action="cart-servlet" method="post">
                                <div class="media-body">
                                    <h4 class="media-heading">${product.productName}</h4>
                                    <p>${product.description}</p>
                                    <input type="hidden" name="id" value="${product.productId}">
                                    <input type="hidden" name="action" value="create">
                                    <input name="quantity" type="number" value="1" min="1" style="display: block">
                                </div>
                                <input type="submit" value="${product.price}" data-product="1" class="price">
                            </form>
                        </div>
                        <!-- PRODUCT : END -->
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- LIST PRODUCT : END -->
        <!-- CART : START -->
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h1 class="panel-title">Your Cart</h1>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="4%">#</th>
                            <th>Pokemon</th>
                            <th width="15%">Price</th>
                            <th width="4%">Quantity</th>
                            <th width="20%">Subtotal</th>
                            <th width="25%">Action</th>
                        </tr>
                        </thead>
                        <tbody id="my-cart-body">
                        <!-- CART BODY -->
                        <c:forEach items="${cartList}" var="cartItem" >
                            <tr>
                                <form action="cart-servlet" method="post">
                                    <th scope="row">${cartItem.getCartId()}</th>
                                    <td>${cartItem.getProduct().getProductName()}</td>
                                    <td>${cartItem.getProduct().getPrice()} USD</td>
                                    <td><input name="quantity" type="number" value="${cartItem.getQuantity()}" min="1"></td>
                                    <td><strong>${cartItem.getProduct().getPrice() * cartItem.getQuantity()}</strong></td>
                                    <td>
                                        <input type="hidden" name="action" value="update" />
                                        <input type="hidden" name="id" value="${cartItem.getCartId()}">
                                        <input id="update-cart-item" type="submit" value="Update" class="label label-info update-cart-item">
                                        <a class="label label-danger delete-cart-item" href="cart-servlet?action=delete&id=${cartItem.getCartId()}"
                                           data-product="">Delete</a>
                                    </td>
                                </form>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot id="my-cart-footer">
                        <!-- CART FOOTER -->
                        <tr>
                            <th colspan="6">Empty product in your cart</th>
                        </tr>
                        <c:if test="${cartList != null}" >
                            <tr>
                                <td colspan="4">There are <b>${cartList.size()}</b> items in your shopping cart.</td>
                                <c:set var="total" value="${0}" />
                                <c:forEach items="${cartList}" var="cart" >
                                    <c:set var="total" value="${total + cart.getProduct().getPrice() * cart.getQuantity()}" />
                                </c:forEach>
                                <td colspan="2" class="total-price text-left">${total} USD</td>
                            </tr>
                        </c:if>
                        </tfoot>
                    </table>

                </div>
            </div>
            <c:if test="${message != null}">
                <div class="alert alert-success" role="alert" id="mnotification">Updated <b>successfull</b></div>
            </c:if>
        </div>
        <!-- CART : END -->
    </div>
    <script src="../assets/script/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../assets/script/bootstrap.min.js"></script>
</div>
</body>
</html>
