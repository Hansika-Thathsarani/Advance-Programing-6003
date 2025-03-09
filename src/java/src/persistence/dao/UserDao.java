/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.persistence.dao;

import src.persistence.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import src.business.model.User;


/**
 *
 * @author Hansika Thathsarani
 */


public class UserDao {

    public boolean registerUser(User user) {
        String sql = "INSERT INTO user_details (name, address, phoneNo, email, nic, password, userRole) VALUES (?, ?, ?, ?, ?, ?, ?)";

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
            e.printStackTrace(); 
            return false;
        }
    }

    public User authenticateUser(String name, String password) {
        String sql = "SELECT name, userRole,email,phoneNo FROM user_details WHERE name = ? AND password = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, name);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String userRole = rs.getString("userRole");
                    String phone = rs.getString("phoneNo");
                    String email = rs.getString("email");
                    return new User(name, null, phone, email, null, password, userRole); 
                } else {
                    System.out.println("No user found with the given name and password.");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return null; 
    }
    
    public boolean updateUser(User user) {
        String sql = "UPDATE user_details SET name = ?, address = ?, phoneNo = ?, email = ? WHERE name = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getName());
            stmt.setString(2, user.getAddress());
            stmt.setString(3, user.getPhone());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getName()); 

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
