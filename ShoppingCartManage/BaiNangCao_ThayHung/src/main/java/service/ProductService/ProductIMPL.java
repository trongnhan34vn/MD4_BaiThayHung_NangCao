package service.ProductService;

import model.Cart;
import model.Product;
import util.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductIMPL implements IProductService{
    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConnectionDB.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM Product");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductId(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                product.setProductImg(resultSet.getString("Img"));
                product.setDescription(resultSet.getString("Description"));
                product.setPrice(resultSet.getFloat("Price"));
                product.setQuantity(resultSet.getInt("Quantity"));
                product.setStatus(resultSet.getBoolean("Status"));
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                ConnectionDB.closeConnection(conn);
            }
        }
        return productList;
    }

    @Override
    public void save(Product product) {

    }

    @Override
    public Product findById(int id) {
        for (Product product : findAll()) {
            if (product.getProductId() == id) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void remove(int id) {

    }
}
