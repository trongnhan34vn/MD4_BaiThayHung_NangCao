package service.CartService;

import model.Cart;
import service.ProductService.IProductService;
import service.ProductService.ProductIMPL;
import util.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartServiceIMPL implements ICartService {
    IProductService productService = new ProductIMPL();

    @Override
    public List<Cart> findAll() {
        List<Cart> cartList = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConnectionDB.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM Cart");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Cart cart = new Cart();
                cart.setCartId(resultSet.getInt("CartID"));
                int productId = resultSet.getInt("ProductID");
                cart.setProduct(productService.findById(productId));
                cart.setQuantity(resultSet.getInt("Quantity"));
                cartList.add(cart);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                ConnectionDB.closeConnection(conn);
            }
        }
        return cartList;
    }

    @Override
    public void save(Cart cart) {
        if (findById(cart.getCartId()) == null) {
            if (!checkExist(cart)) {
                createCart(cart);
                System.out.println("create service");
            }
        } else {
            updateCart(cart);
            System.out.println("update service");
        }
    }

    private boolean checkExist(Cart cart) {
        for (Cart c: findAll()) {
            if(c.getProduct().getProductId() == cart.getProduct().getProductId()) {
                return true;
            }
        }
        return false;
    }

    private void updateCart(Cart cart) {
        Connection conn = null;
        try {
            conn = ConnectionDB.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("UPDATE Cart SET Quantity = " + cart.getQuantity() +" WHERE CartID = " + cart.getCartId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                ConnectionDB.closeConnection(conn);
            }
        }
    }

    private void createCart(Cart cart) {
        Connection conn = null;
        try {
            conn = ConnectionDB.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO Cart (ProductId, Quantity) VALUES (?, ?)");
            preparedStatement.setInt(1, cart.getProduct().getProductId());
            preparedStatement.setInt(2, cart.getQuantity());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
           if (conn != null) {
               ConnectionDB.closeConnection(conn);
           }
        }
    }

    @Override
    public Cart findById(int id) {
        for (Cart cart : findAll()) {
            if (id == cart.getCartId()) {
                return cart;
            }
        }
        return null;
    }

    @Override
    public void remove(int id) {

    }
}
