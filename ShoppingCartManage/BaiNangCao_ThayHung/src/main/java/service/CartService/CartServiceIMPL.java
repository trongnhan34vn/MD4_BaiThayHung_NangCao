package service.CartService;

import model.Cart;
import service.ProductService.IProductService;
import service.ProductService.ProductIMPL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartServiceIMPL implements ICartService{
    IProductService productService = new ProductIMPL();
    @Override
    public List<Cart> findAll() {
        List<Cart> cartList = new ArrayList<>();
        Connection conn = null;
        try {
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
        }catch (Exception e) {
            e.printStackTrace();
        }
        return cartList;
    }

    @Override
    public void save(Cart cart) {

    }

    @Override
    public Cart findById(int id) {
        return null;
    }

    @Override
    public void remove(int id) {

    }
}
