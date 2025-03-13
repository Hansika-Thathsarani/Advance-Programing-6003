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
import javax.servlet.http.HttpSession;
import src.business.model.User;
import src.persistence.dao.UserDao;


/**
 *
 * @author Hansika Thathsarani
 */


@WebServlet("/LoginServelet")
public class LoginServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        User user = userDao.authenticateUser(name, password);
       
        
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user.getName());
            session.setAttribute("userRole", user.getuserRole());
            session.setAttribute("phone", user.getPhone());
            session.setAttribute("loggedInUser", user);

            
            switch (user.getuserRole()) {
                case "Customer" -> response.sendRedirect("CustomerServlet");
                case "Admin" -> response.sendRedirect("AdminView");
                case "Driver" -> response.sendRedirect("DriverServlet");
                default -> response.sendRedirect("login.jsp?error=invalid_role");
            }
        } else {
            request.setAttribute("errorMsg", "Invalid username or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
