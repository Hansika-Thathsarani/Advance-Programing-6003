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
@WebServlet(name = "VehicleRegisterationServelt", urlPatterns = {"/VehicleRegisterationServelt"})
public class VehicleRegisterationServelt extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            String vehicleNo = request.getParameter("add-vehicle-num");
            String vehicleModel = request.getParameter("add-vehicle-model");
            int seatCount =Integer.parseInt(request.getParameter("add-vehicle-seats"));
            String ownerName = request.getParameter("add-owner-name");
            String ownerNo = request.getParameter("add-owner-no");
            
            Vehicle vehicle = new Vehicle(vehicleModel, vehicleNo, ownerName, ownerNo, 0, null, null, 0, seatCount );
            VehicleDao vehicleDao = new VehicleDao();
            boolean registered = vehicleDao.registerVehicle(vehicle);
            
           if (registered) {
            request.getSession().setAttribute("successMsg", "✓ Vehicle registered successfully!");
            response.sendRedirect("AdminView");

        }
 else {
            request.getSession().setAttribute("errorMsg", " ⌀ Vehicle registraion failed.");
            response.sendRedirect("AdminView");
        }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
