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
import java.util.List;
import java.util.ArrayList;
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
        String sql = "UPDATE user_details SET nic = ?, phoneNo = ?, userRole = ? WHERE email = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getNic());
            stmt.setString(2, user.getPhone());
            stmt.setString(3, user.getuserRole());
            stmt.setString(4, user.getEmail()); 

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
        public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT  * FROM user_details";
 
        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
 
            while (rs.next()) {
                User user =new User();
                user.setName(rs.getString("name"));
                user.setAddress(rs.getString("address"));
                user.setPhone(rs.getString("phoneNo"));
                user.setEmail(rs.getString("email"));
                user.setNic(rs.getString("nic"));
                user.setPassword(rs.getString("password"));
                user.setuserRole(rs.getString("userRole"));
                
                
                users.add(user);
            }
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return users;
    }
    
    public boolean deleteUser(int userId) {
    String sql = "DELETE FROM user_details WHERE id = ?";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setInt(1, userId);
        int rowsDeleted = stmt.executeUpdate();
        return rowsDeleted > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}

    
    
    
    public List<String> getEmails() {
    List<String> emails = new ArrayList<>();
    String sql = "SELECT email FROM user_details"; 

    try (Connection conn = DBConnection.getConnection(); 
         PreparedStatement pstmt = conn.prepareStatement(sql); 
         ResultSet rs = pstmt.executeQuery()) { 

        while (rs.next()) {
            String mail= rs.getString("email"); 
            emails.add(mail); 
        }
    } catch (SQLException e) {
      
        e.printStackTrace();
        System.err.println("SQL Error: " + e.getMessage());
    }
    return emails;
}
    
        public List<String> getDrivers() {
    List<String> names = new ArrayList<>();
    String sql = "SELECT name FROM user_details WHERE userRole = 'Driver' "; 

    try (Connection conn = DBConnection.getConnection(); 
         PreparedStatement pstmt = conn.prepareStatement(sql); 
         ResultSet rs = pstmt.executeQuery()) { 

        while (rs.next()) {
            String name= rs.getString("name"); 
            names.add(name); 
        }
    } catch (SQLException e) {
      
        e.printStackTrace();
        System.err.println("SQL Error: " + e.getMessage());
    }
    return names;
}
        
        
public boolean deleteUser(String Email) {
        String sql = "DELETE FROM user_details WHERE email = ?"; 

        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) { 

            pstmt.setString(1, Email);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {

            e.printStackTrace();
            System.err.println("SQL Error: " + e.getMessage());
            return false;
        }
    
}
    
}
