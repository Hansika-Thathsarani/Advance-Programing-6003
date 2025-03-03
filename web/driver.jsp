<%-- 
    Document   : driver
    Created on : Mar 3, 2025, 9:10:09 AM
    Author     : Hansika Thathsarani
--%>

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
            <a href="#" class="active" onclick="showSection('profile')">My Profile</a>
            <a href="#" onclick="showSection('assigned-rides')">Assigned Rides</a>
            <a href="#" onclick="showSection('report')">Earning Reports</a>
            <a href="#" onclick="showSection('history')">Ride History</a>
        </nav>
            <button class="btn" onclick="window.location.href='index.jsp'">Log Out</button>
        </header>
        <div class="content">
            
        <!-------------------------------------------------------------------------- profile -->
         
  <section id="profile" class="section active">
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
   
   <section id="assigned-rides" class="section">
       <h2>Assigned Rides</h2>

    <div class="rides-table-container">
        <table class="rides-table">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Date & Time</th>
                    <th>Pickup Location</th>
                    <th>Destination</th>
                    <th>Customer Name</th>
                    <th>Contact No</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody id="rides-table-body">
                
                <tr>
                    <td>#B1001</td>
                    <td>2025-03-05 10:30 AM</td>
                    <td>Colombo</td>
                    <td>Kandy</td>
                    <td>Jane Doe</td>
                    <td>+94 712345678</td>
                    <td>
                        <select class="status-dropdown">
                            <option value="pending">Pending</option>
                            <option value="ongoing">Ongoing</option>
                            <option value="completed">Completed</option>
                            <option value="canceled">Canceled</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>#B1002</td>
                    <td>2025-03-06 02:00 PM</td>
                    <td>Negombo</td>
                    <td>Galle</td>
                    <td>John Smith</td>
                    <td>+94 762345678</td>
                    <td>
                        <select class="status-dropdown">
                            <option value="pending">Pending</option>
                            <option value="ongoing">Ongoing</option>
                            <option value="completed">Completed</option>
                            <option value="canceled">Canceled</option>
                        </select>
                    </td>
                </tr>
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

    <div class="filter-container">
        <label for="history-date">Select Date:</label>
        <input type="date" id="history-date">

        <label for="history-status">Filter by Status:</label>
        <select id="history-status">
            <option value="all">All</option>
            <option value="completed">Completed</option>
            <option value="canceled">Canceled</option>
        </select>

        <button class="filter-btn">Filter</button>
    </div>

    <div class="history-table-container">
        <h3>Ride Records</h3>
        <table class="history-table">
            <thead>
                <tr>
                    <th>Ride ID</th>
                    <th>Date & Time</th>
                    <th>Pickup Location</th>
                    <th>Destination</th>
                    <th>Customer</th>
                    <th>Fare (LKR)</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>#R1001</td>
                    <td>2025-03-01 | 10:30 AM</td>
                    <td>Colombo</td>
                    <td>Kandy</td>
                    <td>John Doe</td>
                    <td>5,000</td>
                    <td class="status completed">Completed</td>
                </tr>
                <tr>
                    <td>#R1002</td>
                    <td>2025-03-02 | 02:00 PM</td>
                    <td>Galle</td>
                    <td>Negombo</td>
                    <td>Jane Smith</td>
                    <td>3,500</td>
                    <td class="status canceled">Canceled</td>
                </tr>
                <tr>
                    <td>#R1003</td>
                    <td>2025-03-03 | 05:45 PM</td>
                    <td>Matara</td>
                    <td>Colombo</td>
                    <td>Michael Lee</td>
                    <td>6,500</td>
                    <td class="status completed">Completed</td>
                </tr>
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