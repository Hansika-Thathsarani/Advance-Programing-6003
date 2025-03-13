/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.persistence.dao;

import java.util.ArrayList;
import java.util.List;
import src.persistence.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import src.business.model.Ride;
import src.business.model.Vehicle;

/**
 *
 * @author Hansika Thathsarani
 */
public class RideDao {
    
        public List<String> getParkedLocations() {
        List<String> Locations = new ArrayList<>();
        String sql = "SELECT DISTINCT from_city FROM locations"; 
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String location = rs.getString("from_city");
                Locations.add(location);
            }

        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }

        return Locations;
    }
        
        
public boolean manageRide(String vehicleNo, String driver, String location, int price) {
    String vehicleModel = null;


    String lookupSql = "SELECT vehicleModel FROM vehicle_details WHERE vehicleNo = ?";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement lookupStmt = conn.prepareStatement(lookupSql)) {

        lookupStmt.setString(1, vehicleNo);
        ResultSet rs = lookupStmt.executeQuery();

        if (rs.next()) {
            vehicleModel = rs.getString("vehicleModel");
        } else {
            System.err.println("Vehicle not found with number: " + vehicleNo);
            return false;
        }

    } catch (SQLException e) {
        e.printStackTrace();
        System.err.println("SQL Error during vehicle lookup: " + e.getMessage());
        return false;
    }

   
    String insertSql = "INSERT INTO allocation (vehicle, driver, location, price, vehicleModel) VALUES (?, ?, ?, ?, ?)";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(insertSql)) {

        pstmt.setString(1, vehicleNo);
        pstmt.setString(2, driver);
        pstmt.setString(3, location);
        pstmt.setInt(4, price);
        pstmt.setString(5, vehicleModel);

        int rowsAffected = pstmt.executeUpdate();
        return rowsAffected > 0;

    } catch (SQLException e) {
        e.printStackTrace();
        System.err.println("SQL Error during insertion: " + e.getMessage());
        return false;
    }
}


        public List<String> getDestinationLocations() {
        List<String> Locations = new ArrayList<>();
        String sql = "SELECT DISTINCT to_city FROM locations"; 
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String location = rs.getString("to_city");
                Locations.add(location);
            }

        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }

        return Locations;
    }
        
        
        public List<String> getVehiclesByLocation(String pickupLocation) {
        List<String> vehicles = new ArrayList<>();
        String sql = "SELECT vehicle, vehicleModel FROM allocation WHERE location = ? ";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, pickupLocation);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String vehicleNo = rs.getString("vehicle");
                String vehicleModel = rs.getString("vehicleModel");
                vehicles.add(vehicleNo +" | "+ vehicleModel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vehicles;
    }
        
       public Integer getTripDistance(String pickupLocation, String detination) {
        int km = 0;
        String sql = "SELECT km FROM locations WHERE from_city = ? AND to_city =? ";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, pickupLocation);
             pstmt.setString(2, detination);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                km = rs.getInt("km");
              
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return km;
    }
       
        public Integer getPricebyVehicle(String vehicleNo) {
            int price = 0;
        String sql = "SELECT price FROM allocation WHERE vehicle = ? ";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, vehicleNo);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                 price = rs.getInt("price");
               
            
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return price;
    }
        
        
        
        
        
public int newBooking(Ride booking) throws SQLException {

  
        String sql = "INSERT INTO booking_details (customer, date_time, pickup, destination, driver, vehicle, status, price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";


        try (Connection conn = DBConnection.getConnection(); 
            PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) { 
            ps.setString(1, booking.getCustomer());
            ps.setTimestamp(2, booking.getDateTime());
            ps.setString(3, booking.getPickupLocation());
            ps.setString(4, booking.getDestination());
            ps.setString(5, booking.getDriver());
            ps.setString(6, booking.getVehilcle());
            ps.setString(7,"Pending") ;
            ps.setInt(8, booking.getPrice() );

            int affectedRows = ps.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("no rows");
            }

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int logId = generatedKeys.getInt(1);
                    System.out.println("success" + logId);
                    return logId;
                } else {
                    throw new SQLException("failed");
                }
            }
        }
    }



       public List<Ride> getMyBooking(String userName) throws SQLException {
        List<Ride> rides = new ArrayList<>(); // List to store Receipt objects
        String sql = "SELECT * FROM booking_details WHERE customer = ? ORDER BY booking_ID DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userName);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) { 
                    Ride ride = new Ride(); 

                    // Populate the Receipt object with data from the ResultSet
                    ride.setBookingID(rs.getString("booking_ID"));
                    ride.setCustomer(rs.getString("customer"));
                    ride.setDateTime(rs.getTimestamp("date_time"));
                    ride.setPickupLocation(rs.getString("pickup"));
                    ride.setDestination(rs.getString("destination"));
                    ride.setDriver(rs.getString("driver"));
                    ride.setVehilcle(rs.getString("vehicle"));
                    ride.setStatus(rs.getString("status"));
                    ride.setPrice(rs.getInt("price"));

                    rides.add(ride); 
                }
            }
        }

        if (rides.isEmpty()) {
            throw new SQLException("Booking not found for: " + userName);
        }

        return rides; 
    }
       
       
public String getDriverbyVehicle(String vehicleNo, String location) {
            String driver = "";
        String sql = "SELECT driver FROM allocation WHERE vehicle = ? AND location = ? ";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, vehicleNo);
            pstmt.setString(2, location);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                 driver = rs.getString("driver");
               
            
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return driver;
    }
 



         public List<Ride> getAllBooking() throws SQLException {
        List<Ride> receipts = new ArrayList<>(); // List to store Receipt objects
        String sql = "SELECT * FROM booking_details ORDER BY booking_ID DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
  

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) { 
                    Ride ride = new Ride(); 

                    ride.setBookingID(rs.getString("booking_ID"));
                    ride.setCustomer(rs.getString("customer"));
                    ride.setDateTime(rs.getTimestamp("date_time"));
                    ride.setPickupLocation(rs.getString("pickup"));
                    ride.setDestination(rs.getString("destination"));
                    ride.setDriver(rs.getString("driver"));
                    ride.setVehilcle(rs.getString("vehicle"));
                    ride.setStatus(rs.getString("status"));
                    ride.setPrice(rs.getInt("price"));

                    receipts.add(ride); 
                }
            }
        }

        if (receipts.isEmpty()) {
            throw new SQLException("Booking not found");
        }

        return receipts; 
    }

         
         
                public List<Ride> getDriverBooking(String userName) throws SQLException {
        List<Ride> rides = new ArrayList<>(); // List to store Receipt objects
        String sql = "SELECT * FROM booking_details WHERE driver = ? ORDER BY booking_ID DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userName);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) { 
                    Ride ride = new Ride(); 

                    // Populate the Receipt object with data from the ResultSet
                    ride.setBookingID(rs.getString("booking_ID"));
                    ride.setCustomer(rs.getString("customer"));
                    ride.setDateTime(rs.getTimestamp("date_time"));
                    ride.setPickupLocation(rs.getString("pickup"));
                    ride.setDestination(rs.getString("destination"));
                    ride.setDriver(rs.getString("driver"));
                    ride.setVehilcle(rs.getString("vehicle"));
                    ride.setStatus(rs.getString("status"));
                    ride.setPrice(rs.getInt("price"));

                    rides.add(ride); 
                }
            }
        }

        if (rides.isEmpty()) {
            throw new SQLException("Booking not found for: " + userName);
        }

        return rides; 
    }

                
                public boolean deleteRide(int id) {
        String sql = "DELETE FROM booking_details WHERE booking_ID = ?"; 

        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) { 

            pstmt.setInt(1, id);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {

            e.printStackTrace();
            System.err.println("SQL Error: " + e.getMessage());
            return false;
        }
    
}
    
}
