/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package src.business.servelet;

import src.persistence.utils.DBConnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.business.model.User;
import src.persistence.dao.UserDao;

/**
 *
 * @author Hansika Thathsarani
 */
@WebServlet("/EditCustomerServelet")
public class EditCustomerServelet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

       
        User loggedInUser = (User) session.getAttribute("loggedUser");

        
        String newFullName = request.getParameter("fullName");
        String newEmail = request.getParameter("email");
        String newPhone = request.getParameter("phone");

        
        loggedInUser.setName(newFullName);
        loggedInUser.setEmail(newEmail);
        loggedInUser.setPhone(newPhone);

        
        UserDao userDao = new UserDao();
        boolean isUpdated = userDao.updateUser(loggedInUser);

        if (isUpdated) {
            session.setAttribute("loggedUser", loggedInUser);
            request.setAttribute("message", "Profile updated successfully!");
        } else {
            request.setAttribute("error", "Update failed. Please try again.");
        }

        request.getRequestDispatcher("customer.jsp").forward(request, response);
    }
}