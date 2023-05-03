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
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "show":
                showCart(request, response);
                break;
            case "delete":
                deleteCartItem(request, response);
                break;
        }
    }
    private void deleteCartItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idDel = Integer.parseInt(request.getParameter("id"));
        cartService.remove(idDel);
        request.setAttribute("productList", productService.findAll());
        request.setAttribute("cartList",  cartService.findAll());
        request.setAttribute("message", "success!");
        request.getRequestDispatcher("view/Home.jsp").forward(request,response);
    }

    private void showCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("productList", productService.findAll());
        request.setAttribute("cartList",  cartService.findAll());
        request.getRequestDispatcher("view/Home.jsp").forward(request,response);
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
            case "update":
                updateCart(request, response);
                break;
        }
    }
    private void updateCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idU = Integer.parseInt(request.getParameter("id"));
        Cart cartU = cartService.findById(idU);
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        cartU.setQuantity(quantity);
        cartService.save(cartU);
        request.setAttribute("cartList", cartService.findAll());
        request.setAttribute("productList", productService.findAll());
        request.setAttribute("message", "success!");
        request.getRequestDispatcher("view/Home.jsp").forward(request, response);
    }

    private void createCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        int quantityNew = Integer.parseInt(request.getParameter("quantity"));
        if (!cartService.findAll().isEmpty()) {
            for (Cart cart: cartService.findAll()) {
                if (cart.getProduct().getProductId() == productId) {
                    cart.setQuantity(cart.getQuantity() + quantityNew);
                    cartService.save(cart);
                    break;
                } else {
                    Cart newCart = new Cart();
                    newCart.setQuantity(quantityNew);
                    newCart.setProduct(productService.findById(productId));
                    newCart.setCartId(getCartId());
                    cartService.save(newCart);
                }
            }
        } else {
            Cart newCart = new Cart();
            newCart.setQuantity(quantityNew);
            newCart.setProduct(productService.findById(productId));
            newCart.setCartId(getCartId());
            cartService.save(newCart);
        }
        request.setAttribute("cartList", cartService.findAll());
        request.setAttribute("productList", productService.findAll());
        request.getRequestDispatcher("view/Home.jsp").forward(request, response);
    }

    private int getCartId() {
        if (cartService.findAll().isEmpty()) {
            return 1;
        } else {
            return cartService.findAll().get(cartService.findAll().size() - 1).getCartId() + 1;
        }
    }
}
