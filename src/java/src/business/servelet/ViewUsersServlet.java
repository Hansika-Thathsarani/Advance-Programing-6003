/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package src.business.servelet;

import src.business.model.User;
import src.persistence.dao.UserDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import src.business.model.Ride;
import src.business.model.Vehicle;
import src.persistence.dao.RideDao;
import src.persistence.dao.VehicleDao;

/**
 *
 * @author Hansika Thathsarani
 */
@WebServlet("/AdminView")
public class ViewUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 

        HttpSession session = request.getSession();
        String successMsg = (String) session.getAttribute("successMsg");
        System.out.println(successMsg);

        session.removeAttribute("successMsg");
 
        UserDao userDao = new UserDao();
        VehicleDao vehicleDao = new VehicleDao();
        RideDao rideDao = new RideDao();
        
        List<User> userList = userDao.getAllUsers();
        List<String> emailList = userDao.getEmails();
        List<String> driverList = userDao.getDrivers();
        
        List<String> vehicleList = vehicleDao.getVehicleNo();
        List<Vehicle> AllvehicleList = vehicleDao.getAllVehicles();
        
        List<String> parkedLocations = rideDao.getParkedLocations();
       List<Ride>allBookingList = null;
        try {
            allBookingList = rideDao.getAllBooking();
        } catch (SQLException ex) {
            Logger.getLogger(ViewUsersServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
                
                
        request.setAttribute("allusers", userList);
        request.setAttribute("emailList",emailList);
        request.setAttribute("vehicleList",vehicleList);
        request.setAttribute("AllvehicleList",AllvehicleList);
        request.setAttribute("driverList",driverList);
        request.setAttribute("parkedLocations",parkedLocations);
        
       request.setAttribute("allbookings",allBookingList);
        request.setAttribute("successMsg", successMsg);
 
        request.getRequestDispatcher("Admin.jsp").forward(request, response);
    }
}