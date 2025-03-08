/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.persistence.dao;


import src.persistence.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import src.business.model.User;


/**
 *
 * @author Hansika Thathsarani
 */

public class UserDao {
    
    public boolean registerUser(User user) {
        String sql = "INSERT INTO user_details (name, address, phoneNo, email, nic, password,userRole) VALUES (?, ?, ?, ?, ?, ?,?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getName());
            stmt.setString(2, user.getAddress());
            stmt.setString(3, user.getPhone());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getNic());
            stmt.setString(6, user.getPassword());
            stmt.setString(7, user.getuserRole());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            return false;
        }
    }
}
