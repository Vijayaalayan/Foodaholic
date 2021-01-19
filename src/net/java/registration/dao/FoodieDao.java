package net.java.registration.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import net.java.registration.model.Foodie;


public class FoodieDao {
	public int registerFoodie(Foodie foodie) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO foodaholic.foodie" +
            "  (id, name, email, number, place, password, guide) VALUES " +
            " (?,?, ?, ?, ?, ?,?);";

        int result = 0;
        int i=1;
//        SELECT id FROM foodie ORDER BY ID DESC LIMIT 1;
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/foodaholic?useSSL=false", "root", "toor");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
        	preparedStatement.setInt(1,++i );
            preparedStatement.setString(2, foodie.getName());
            preparedStatement.setString(3, foodie.getEmail());
            preparedStatement.setString(4, foodie.getNumber());
            preparedStatement.setString(5, foodie.getPlace());
            preparedStatement.setString(6, foodie.getPassword());
            preparedStatement.setString(7, foodie.getGuide());

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
