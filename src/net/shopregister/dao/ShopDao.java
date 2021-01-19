package net.shopregister.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import net.shopregister.model.Shop;

public class ShopDao {
	public int registerShop(Shop shop) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO foodaholic.shopkeeper" +
            "  (id, shopName, email, number, password, place, latlon) VALUES " +
            " (?,?, ?, ?, ?, ?,?);";

        int result = 0;
        int i=1;
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/foodaholic?useSSL=false", "root", "toor");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
        	preparedStatement.setInt(1,i++ );
            preparedStatement.setString(2, shop.getShopName());
            preparedStatement.setString(3, shop.getEmail());
            preparedStatement.setString(4, shop.getNumber());
            preparedStatement.setString(5, shop.getPassword());
            preparedStatement.setString(6, shop.getPlace());
            preparedStatement.setString(7, shop.getLatlon());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            e.printStackTrace();
        }
        return result;
    }
}
