/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package src.business.servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.business.model.User;
import src.persistence.dao.UserDao;

/**
 *
 * @author Hansika Thathsarani
 */
@WebServlet(name = "UserUpdateServlt", urlPatterns = {"/UserUpdateServlt"})
public class UserUpdateServlt extends HttpServlet {
    
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("edit-mail");
        String nic = request.getParameter("edit-nic");
        String phone = request.getParameter("edit-contact");
        String role = request.getParameter("edit-user-role");
        
        User user = new User(null, null, phone, email, nic, null, role );
        
        UserDao userDao = new UserDao();
        boolean updated = userDao.updateUser(user);
        
         if (updated) {
            request.getSession().setAttribute("successMsg", "✓ User updated successfully!");
            response.sendRedirect("AdminView");

        }
 else {
            request.getSession().setAttribute("errorMsg", " ⌀ Updated failed.");
            response.sendRedirect("AdminView");
        }
    }
}
 