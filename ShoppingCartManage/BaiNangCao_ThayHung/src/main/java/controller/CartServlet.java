package controller;

import model.Cart;
import service.CartService.CartServiceIMPL;
import service.CartService.ICartService;
import service.ProductService.IProductService;
import service.ProductService.ProductIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CartServlet", value = "/cart-servlet")
public class CartServlet extends HttpServlet {
    ICartService cartService = new CartServiceIMPL();
    IProductService productService = new ProductIMPL();
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                break;
            case "delete":
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCart(request, response);
                break;
        }
    }

    private void createCart(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("id"));
        int quantityNew = Integer.parseInt(request.getParameter("quantity"));
        for (Cart cart: cartService.findAll()) {
            if (cart.getProduct().getProductId() == productId) {
                cart.setQuantity(cart.getQuantity() + quantityNew);
                break;
            } else {
                Cart newCart = new Cart();
                newCart.setQuantity(quantityNew);
                newCart.setProduct(productService.findById(productId));
                newCart.setCartId(getCartId());
                cartService.save(newCart);
            }
        }
    }

    private int getCartId() {
        if (cartService.findAll().isEmpty()) {
            return 1;
        } else {
            return cartService.findAll().get(cartService.findAll().size() - 1).getCartId() + 1;
        }
    }
}
