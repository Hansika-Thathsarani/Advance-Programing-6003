/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.persistence.dao;


import src.business.model.Vehicle;
import src.persistence.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

/**
 *
 * @author Hansika Thathsarani
 */
public class VehicleDao {
        public boolean registerVehicle(Vehicle vehicle) {
        String sql = "INSERT INTO vehicle_details (vehicleNo, vehicleModel, seatCapacity , ownerName, ownerContact) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, vehicle.getvehicleNo()) ;
            pstmt.setString(2, vehicle.getvehicleModel() );
            pstmt.setInt(3, vehicle.getSeatCount() );
            pstmt.setString(4, vehicle.getOwnerName());
            pstmt.setString(5, vehicle.getOwnerContact());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error: " + e.getMessage());
            return false;
        }
    }
        
        
public boolean updateVehicleDetails(Vehicle vehicle) {
        String sql = "UPDATE vehicle_details  SET seatCapacity = ?, ownerName = ?, ownerContact = ? WHERE vehicleNo = ?";

        try (Connection conn = DBConnection.getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, vehicle.getSeatCount()) ;
            pstmt.setString(2, vehicle.getOwnerName());
            pstmt.setString(3, vehicle.getOwnerContact());
            pstmt.setString(4, vehicle.getvehicleNo());
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error: " + e.getMessage());
            return false;
        }
    }


    public List<String> getVehicleNo() {
    List<String> vehicle = new ArrayList<>();
    String sql = "SELECT vehicleNo FROM vehicle_details"; 

    try (Connection conn = DBConnection.getConnection(); 
         PreparedStatement pstmt = conn.prepareStatement(sql); 
         ResultSet rs = pstmt.executeQuery()) { 

        while (rs.next()) {
            String no= rs.getString("vehicleNo"); 
            vehicle.add(no); 
        }
    } catch (SQLException e) {
      
        e.printStackTrace();
        System.err.println("SQL Error: " + e.getMessage());
    }
    return vehicle;
}
    
    
         public List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        String sql = "SELECT  * FROM vehicle_details";
 
        try (Connection conn = DBConnection.getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql); 
                ResultSet rs = pstmt.executeQuery()) {
 
            while (rs.next()) {
                Vehicle vehicle =new Vehicle();
                vehicle.setvehicleModel(rs.getString("vehicleModel"));
                vehicle.setvehicleNo(rs.getString("vehicleNo"));
                vehicle.setOwnerName(rs.getString("ownerName"));
                vehicle.setOwnerContact(rs.getString("ownerContact"));
                vehicle.setDriverId(0);
                vehicle.setDriverName(null);
                vehicle.setCity(null);
                vehicle.setPrice(0);
                vehicle.setSeatCount(rs.getInt("seatCapacity"));
                
                
                vehicles.add(vehicle);
            }
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return vehicles;
    }
         
         
         
public boolean deleteVehicle(String VehicleNo) {
        String sql = "DELETE FROM vehicle_details WHERE vehicleNo = ?"; 

        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) { 

            pstmt.setString(1, VehicleNo);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {

            e.printStackTrace();
            System.err.println("SQL Error: " + e.getMessage());
            return false;
        }
    
}
}
