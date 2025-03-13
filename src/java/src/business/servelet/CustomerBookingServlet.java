/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package src.business.servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.business.model.Ride;
import src.business.model.User;
import src.persistence.dao.RideDao;

/**
 *
 * @author Hansika Thathsarani
 */
@WebServlet(name = "CustomerBookingServlet", urlPatterns = {"/CustomerBookingServlet"})
public class CustomerBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        try {
            HttpSession session = request.getSession(false);
            String loggedUserName = (String) session.getAttribute("user");
            RideDao rideDao = new RideDao();
            
            
            /*Data View*/
            List<Ride> myRides = rideDao.getMyBooking(loggedUserName);
            request.setAttribute("myRides", myRides);

            request.getRequestDispatcher("customer.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerBookingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
       

    }


    

    
    
    /// FIRE CODE
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse rsp)
            throws ServletException, IOException {
        RideDao rideDao = new RideDao();

        String location = "", selectedVehicleNumber;
        String destination = "'";
        Integer Tripdistance = 0, selectedVehiclePrice, TotalPrice;
        String selectedVehicle = req.getParameter("select-vehicle");
        String selectedValue = req.getParameter("selectedValue");

        String formType = req.getParameter("type");

        if ("lookup".equals(formType)) {

            location = req.getParameter("pickup-location");
            destination = req.getParameter("destination");
            List<String> availableVehicles = rideDao.getVehiclesByLocation(location);
            req.setAttribute("availableVehicles", availableVehicles);

            List<String> pickupLocations = rideDao.getParkedLocations();
            List<String> destinationLocations = rideDao.getDestinationLocations();

            req.setAttribute("pickupLocations", pickupLocations);
            req.setAttribute("destinationLocations", destinationLocations);
            req.setAttribute("selectedPickupLocation", location);
            req.setAttribute("selecteddestinationLocations", destination);

            Tripdistance = rideDao.getTripDistance(location, destination);
            req.setAttribute("tripDistance", Tripdistance);

        } else if ("submit".equals(formType)) {
            try {
                HttpSession session = req.getSession(false);
                String loggedUserName = (String) session.getAttribute("user");

                String bookingDate = req.getParameter("bookingDate");
                String bookingHour = req.getParameter("bookingHour");
                String bookingMinute = req.getParameter("bookingMinute");
                String bookingTime = bookingHour + ":" + bookingMinute + ":00";
                String bookingDateTime = bookingDate + " " + bookingTime;

                String from = selectedValue.split("to")[0].trim();
                String to = selectedValue.split("to")[1].trim();

                Tripdistance = rideDao.getTripDistance(from, to);
                selectedVehicleNumber = selectedVehicle.split(" \\| ")[0].trim();
                selectedVehiclePrice = rideDao.getPricebyVehicle(selectedVehicleNumber);
                TotalPrice = (int) ((double) selectedVehiclePrice * (double) Tripdistance);
                
                String driver = rideDao.getDriverbyVehicle(selectedVehicleNumber,from);

                Ride newBook = new Ride("", loggedUserName, Timestamp.valueOf(bookingDateTime), from, to, driver, selectedVehicle, "Pending", TotalPrice);

         

                Integer added = rideDao.newBooking(newBook);

                System.out.print(added);
                if (added > 0) {

                    List<String> data = new ArrayList<>();
                    data.add(String.valueOf(added));
                    data.add(loggedUserName);
                    data.add(bookingDateTime);
                    data.add(from);
                    data.add(to);
                    data.add(String.valueOf(Tripdistance));
                    data.add(String.valueOf(TotalPrice));

                    System.out.print(data);

                    req.setAttribute("data", data);
                    RequestDispatcher dispatcher = req.getRequestDispatcher("Receipt.jsp");
                    dispatcher.forward(req, rsp);
                } else {
                    req.setAttribute("errorMsg", " ⌀ Booking failed!.");
                    RequestDispatcher dispatcher = req.getRequestDispatcher("customer.jsp");
                    dispatcher.forward(req, rsp);
                }
            } catch (SQLException ex) {
                Logger.getLogger(CustomerBookingServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        req.getRequestDispatcher("/customer.jsp").forward(req, rsp);
    }

}
