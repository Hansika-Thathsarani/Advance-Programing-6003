<%-- 
    Document   : driver
    Created on : Mar 3, 2025, 9:10:09 AM
    Author     : Hansika Thathsarani
--%>

<%@page import="src.business.model.Ride"%>
<%@page import="java.util.List"%>
<%@page import="src.persistence.utils.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>\

<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Styles/Styles.css">
        
        <title>Driver Panel - Mega City Cabs</title>
    </head>
    <body>
        <header>
        <div class="logo">🚖 Mega City Cabs - Driver Panel </div>
        <nav class="admin-nav">
            <!-- <a href="#" class="active" onclick="showSection('profile')">My Profile</a>--> 
            <a href="#" class="active" onclick="showSection('assigned-rides')">Assigned Rides</a>
            <a href="#" onclick="showSection('report')">Earning Reports</a>
            <!--<a href="#" onclick="showSection('history')">Ride History</a>*/-->
        </nav>
            <button class="btn" onclick="window.location.href='index.jsp'">Log Out</button>
        </header>
        <div class="content">
            
        <!-------------------------------------------------------------------------- profile -->
         
  <section id="profile" class="section ">
            <h2>Driver Profile</h2>

    <div class="driver-container">
  
        <div class="profile-section">
            <h3>Manage Profile</h3>
            <form id="driver-profile-form" class="profile-form">
                <label for="driver-name">Full Name:</label>
                <input type="text" id="driver-name" required>

                <label for="driver-contact">Contact No:</label>
                <input type="text" id="driver-contact" required>

                <label for="driver-license">License No:</label>
                <input type="text" id="driver-license" required>

                <label for="driver-email">Email:</label>
                <input type="email" id="driver-email" required>

                <label for="driver-photo">Profile Picture:</label>
                <input type="file" id="driver-photo" accept="image/*">

                <button type="submit" class="submit-btn">Update Profile</button>
            </form>
            
            <h3>Change Password</h3>
            <form id="change-password-form" class="profile-form">
                <label for="current-password">Current Password:</label>
                <input type="password" id="current-password" required>

                <label for="new-password">New Password:</label>
                <input type="password" id="new-password" required>

                <button type="submit" class="submit-btn">Update Password</button>
            </form>
        </div>

        <div class="profile-pic-section">
            <h3>Profile Picture</h3>
            <div class="profile-pic-container">
                <img id="driver-profile-pic" src="default-profile.png" alt="Driver Profile Picture">
            </div>
        </div>
    </div>
        </section>
            
     <!-------------------------------------------------------------------------- assigned ride -->       
   
   <section id="assigned-rides" class="section active">
    <h2>Assigned Rides</h2>

    <div class="rides-table-container">
        <table class="rides-table">
            <thead>
                <tr>
                    <th>Booking No</th>
                    <th>Date & Time</th>
                    <th>Customer Name</th>
                    <th>Pickup Location</th>
                    <th>Destination</th>
                    <th>Vehicle</th>
                    <th>Amount(LKR)</th>

                </tr>
            </thead>
            <tbody id="rides-table-body">
                 <%
                          List<Ride> allBookings = (List<Ride>) request.getAttribute("driverBookingsList");
                          if (allBookings != null) {
                              for (Ride ride : allBookings) {
                      %>
                      <td><%= ride.getBookingID() %></td>
                          <td><%= ride.getDateTime() %></td>
                          <td><%= ride.getCustomer() %></td>
                          <td><%= ride.getPickupLocation() %></td>
                          <td><%= ride.getDestination() %></td>
                          <td><%= ride.getVehilcle() %></td>
                          <td><%= ride.getPrice() %></td>
                          
                      </tr>
                      <%
                          }
                      } else {
                      %>
                      <tr>
                          <td colspan="8" class="text-center">No bookings found.</td>
                      </tr>
                      <%
                          }
                      %>
            </tbody>
        </table>
    </div>
</section>

    
     <!-------------------------------------------------------------------------- earning report -->       
   
     <section id="report" class="section">
         <h2>Earning Reports</h2>

    <div class="report-summary">
        <div class="report-card">
            <h3>Total Rides</h3>
            <p id="total-rides">150</p>
        </div>

        <div class="report-card">
            <h3>Total Earnings</h3>
            <p id="total-earnings">LKR 120,000</p>
        </div>

        <div class="report-card">
            <h3>Canceled Rides</h3>
            <p id="canceled-rides">10</p>
        </div>
    </div>

    <div class="earnings-table-container">
        <h3>Earnings Breakdown</h3>
        <table class="earnings-table">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Rides Completed</th>
                    <th>Earnings (LKR)</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>2025-03-01</td>
                    <td>5</td>
                    <td>4,000</td>
                </tr>
                <tr>
                    <td>2025-03-02</td>
                    <td>3</td>
                    <td>2,500</td>
                </tr>
                <tr>
                    <td>2025-03-03</td>
                    <td>7</td>
                    <td>6,000</td>
                </tr>
            </tbody>
        </table>
    </div>
         
     </section>
 
      <!-------------------------------------------------------------------------- history -->       
      <section id="history" class="section">
   
    <h2>Ride History</h2>

    <div class="history-table-container">
        <h3>Ride Records</h3>
        <table class="history-table">
             <thead>
                <tr>
                    <th>Booking No</th>
                    <th>Date & Time</th>
                    <th>Customer Name</th>
                    <th>Pickup Location</th>
                    <th>Destination</th>
                    <th>Vehicle</th>
                    <th>Amount(LKR)</th>

                </tr>
            </thead>
            <tbody id="rides-table-body">
                 <%
         
                          if (allBookings != null) {
                              for (Ride ride : allBookings) {
                      %>
                      <td><%= ride.getBookingID() %></td>
                          <td><%= ride.getDateTime() %></td>
                          <td><%= ride.getCustomer() %></td>
                          <td><%= ride.getPickupLocation() %></td>
                          <td><%= ride.getDestination() %></td>
                          <td><%= ride.getVehilcle() %></td>
                          <td><%= ride.getPrice() %></td>
                          
                      </tr>
                      <%
                          }
                      } else {
                      %>
                      <tr>
                          <td colspan="8" class="text-center">No bookings found.</td>
                      </tr>
                      <%
                          }
                      %>
            </tbody>
        </table>
    </div>
</section>
          
     <script>
        function showSection(sectionId) {
            
            document.querySelectorAll('.section').forEach(section => {
                section.classList.remove('active');
            });

            
            document.getElementById(sectionId).classList.add('active');

            
            document.querySelectorAll('.admin-nav a').forEach(btn => {
                btn.classList.remove('active');
            });
            event.target.classList.add('active');
        }
    </script>       
    </body>
</html>