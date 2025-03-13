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
import src.business.model.Vehicle;
import src.persistence.dao.VehicleDao;

/**
 *
 * @author Hansika Thathsarani
 */
@WebServlet(name = "VehicleUpdateServelt", urlPatterns = {"/VehicleUpdateServelt"})
public class VehicleUpdateServelt extends HttpServlet {
    
       @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  processRequest(request, response);
    }

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
         String vehicleNo = request.getParameter("edit-vehicle-num");
        int seatCount = Integer.parseInt( request.getParameter("edit-vehicle-seats"));
        String ownerName = request.getParameter("edit-owner-name");
        String ownerNo = request.getParameter("edit-owner-phone");
        
        Vehicle vehicle = new Vehicle(null, vehicleNo, ownerName, ownerNo, 0, null, null, 0, seatCount );
            VehicleDao vehicleDao = new VehicleDao();
            boolean updated = vehicleDao.updateVehicleDetails(vehicle);
            
           if (updated) {
            request.getSession().setAttribute("successMsg", "✓ Vehicle updated successfully!");
            response.sendRedirect("AdminView");

        }
 else {
            request.getSession().setAttribute("errorMsg", " ⌀ Updated failed.");
            response.sendRedirect("AdminView");
        }
    }



}
