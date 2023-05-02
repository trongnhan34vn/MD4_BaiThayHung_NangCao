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

                    <!-- PRODUCT : START -->
                    <div class="media product">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="images/pizza.jpg" alt="pizza">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Pizza</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. At dicta asperiores veniam
                                repellat unde debitis quisquam magnam magni ut deleniti!</p>
                            <input name="quantity-product-1" type="number" value="1" min="1">
                            <a data-product="1" href="#" class="price"> 12 USD </a>
                        </div>
                    </div>
                    <!-- PRODUCT : END -->

                    <!-- PRODUCT : START -->
                    <div class="media product">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="images/Hamburger.jpg" alt="hamburger">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Hamburger</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. At dicta asperiores veniam
                                repellat unde debitis quisquam magnam magni ut deleniti!</p>
                            <span class="price"> 12 USD</span>
                        </div>
                    </div>
                    <!-- PRODUCT : END -->

                    <!-- PRODUCT : START -->
                    <div class="media product">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="images/bread.jpg" alt="bread">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Bread</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. At dicta asperiores veniam
                                repellat unde debitis quisquam magnam magni ut deleniti!</p>
                            <input name="quantity-product-1" type="number" value="1" min="1">
                            <a data-product="1" href="#" class="price"> 12 USD </a>
                        </div>
                    </div>
                    <!-- PRODUCT : END -->

                    <!-- PRODUCT : START -->
                    <div class="media product">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="images/Cake.jpg" alt="cake">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Cake</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. At dicta asperiores veniam
                                repellat unde debitis quisquam magnam magni ut deleniti!</p>
                            <input name="quantity-product-1" type="number" value="1" min="1">
                            <a data-product="1" href="#" class="price"> 12 USD </a>
                        </div>
                    </div>
                    <!-- PRODUCT : END -->
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
