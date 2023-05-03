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
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
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
                                    <input name="quantity-product-1" type="number" value="1" min="1">
                                    <input type="submit" data-product="1" class="price"> ${product.price}>
                                </div>
                            </form>
                        </div>
                        <!-- PRODUCT : END -->
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- LIST PRODUCT : END -->
    </div>
    <script src="../assets/script/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../assets/script/bootstrap.min.js"></script>
</div>
</body>
</html>
