<%--
  Created by IntelliJ IDEA.
  User: nhan
  Date: 02/05/2023
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
                <tr>
                    <th scope="row">1</th>
                    <td>Pizza</td>
                    <td>12 USD</td>
                    <td><input name="cart-item-quantity-1" type="number" value="1" min="1"></td>
                    <td><strong>12 USD</strong></td>
                    <td>
                        <a class="label label-info update-cart-item" href="#" data-product="">Update</a>
                        <a class="label label-danger delete-cart-item" href="#"
                           data-product="">Delete</a>
                    </td>
                </tr>
                </tbody>
                <tfoot id="my-cart-footer">
                <!-- CART FOOTER -->
                <tr>
                    <th colspan="6">Empty product in your cart</th>
                </tr>
                <tr>
                    <td colspan="4">There are <b>1</b> items in your shopping cart.</td>
                    <td colspan="2" class="total-price text-left">12 USD</td>
                </tr>
                </tfoot>
            </table>

        </div>
    </div>
    <div class="alert alert-success" role="alert" id="mnotification">Updated <b>successfull</b></div>
</div>
<!-- CART : END -->
<script src="../assets/script/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../assets/script/bootstrap.min.js"></script>
</body>
</html>
