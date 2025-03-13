/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package src.business.servelet;
import src.business.model.User;
import src.persistence.dao.UserDao;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hansika Thathsarani
 */
@WebServlet("/UserRegistrationServlet")
public class UserRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  processRequest(request, response);
 
        /*
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String password = request.getParameter("password");
        String userRole = request.getParameter("userRole");

        User newUser = new User(name, address, phone, email, nic, password, userRole);
        UserDao userDao = new UserDao();
        
        boolean success = userDao.registerUser(newUser);
        
if (success) {
    request.setAttribute("successMsg", "✓ User registered successfully!");
    RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
            dispatcher.forward(request, response);
}
 else {
            request.setAttribute("errorMsg", " ⌀ Registration failed! Email or NIC already exists.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
            dispatcher.forward(request, response);
        }*/ }
    
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String password = request.getParameter("password");
        String userRole = request.getParameter("userRole");

        User newUser = new User(name, address, phone, email, nic, password, userRole);
        UserDao userDao = new UserDao();
        
        boolean success = userDao.registerUser(newUser);
        
        if (success) {
            request.getSession().setAttribute("successMsg", "✓ User registered successfully!");
            response.sendRedirect("AdminView");

        }
 else {
            request.getSession().setAttribute("errorMsg", " ⌀ Registration failed! Email or NIC already exists.");
            response.sendRedirect("AdminView");
        } }
}