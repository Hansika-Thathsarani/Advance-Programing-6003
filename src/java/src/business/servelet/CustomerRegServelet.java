/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package src.business.servelet;

import java.io.IOException;
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

@WebServlet("/CustomerRegServelet")
public class CustomerRegServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String password = request.getParameter("password");
        String userRole = "Customer";

        User user = new User(name, address, phone, email, nic, password,userRole);

        UserDao userDao = new UserDao();
        boolean success = userDao.registerUser(user);

        if (success) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("registration.jsp");
        }
    }
}
