/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package src.business.servelet;

import src.persistence.utils.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hansika Thathsarani
 */
@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String tempPassword = UUID.randomUUID().toString().substring(0, 8); // Generate a temporary password
        
        try (Connection conn = DBConnection.getConnection()) {
            // Check if email exists
            String checkQuery = "SELECT * FROM user_details WHERE email=?";
            PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();
            
            if (rs.next()) {
                // Update user's password with temporary one
                String updateQuery = "UPDATE user_details SET password=? WHERE email=?";
                PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                updateStmt.setString(1, tempPassword);
                updateStmt.setString(2, email);
                updateStmt.executeUpdate();

                request.setAttribute("successMsg", "Temporary password sent to your email: " + tempPassword);
            } else {
                request.setAttribute("errorMsg", "Email not found. Please try again.");
            }
        } catch (Exception e) {
            request.setAttribute("errorMsg", "Error processing request.");
            e.printStackTrace();
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
