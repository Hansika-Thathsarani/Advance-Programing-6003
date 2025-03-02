<%-- 
    Document   : Admin
    Created on : Mar 2, 2025, 2:01:00 PM
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
        
        <title>Admin Panel - Mega City Cabs</title>
    </head>
    <body>
        <header>
        <div class="logo">🚖 Mega City Cabs - Admin Panel </div>
        <nav class="admin-nav">
            <a href="#" class="active" onclick="showSection('manage-booking')">Manage Booking</a>
            <a href="#" onclick="showSection('manage-users')">Manage Users</a>
            <a href="#" onclick="showSection('manage-vehicles')">Manage Vehicles</a>
            <a href="#" onclick="showSection('billing-report')">Billing & Report</a>
        </nav>
            <button class="btn" onclick="window.location.href='index.jsp'">Log Out</button>
    </header>
     <div class="content">
        
         
         <!<!-------------------------------------------------------------------------- manage booking -->
         
        <section id="manage-booking" class="section active">
            <h2>Manage Bookings</h2>
    <div class="booking-container">
        <table>
            <thead>
                <tr>
                    <th>Booking No</th>
                    <th>Date</th>
                    <th>Customer Name</th>
                    <th>Pickup Location</th>
                    <th>Destination</th>
                    <th>Status</th>
                    <th>Driver</th>
                    <th>Cab</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                
                <tr>
                    <td>#1001</td>
                    <td>2025-03-02</td>
                    <td>John Doe</td>
                    <td>Downtown</td>
                    <td>Airport</td>
                    <td><span class="status pending">Pending</span></td>
                    <td>
                        <select>
                            <option>Select Driver</option>
                            <option>James Anderson</option>
                            <option>Michael Brown</option>
                        </select>
                    </td>
                    <td>
                        <select>
                            <option>Select Cab</option>
                            <option>Toyota Prius</option>
                            <option>Honda Accord</option>
                        </select>
                    </td>
                    <td>
                        <button class="cancel-btn">Cancel</button>
                    </td>
                </tr>
                
            </tbody>
        </table>
    </div>
        </section>

         
     <!<!-------------------------------------------------------------------------- manage Drivers -->     
         
         
         
  <section id="manage-users" class="section">
        
    <h2>Manage Users</h2>

    <div class="user-table-container">
        <div class="user-actions">
            
            <div class="user-action add-user">
                <h3>Add New User</h3>
                <form id="add-user-form" class="user-form">
                    <label for="add-user-name">Name:</label>
                    <input type="text" id="add-user-name" required>

                    <label for="add-user-nic">NIC No:</label>
                    <input type="text" id="add-user-nic" required>

                    <label for="add-user-contact">Contact No:</label>
                    <input type="text" id="add-user-contact" required>

                    <label for="add-user-role">User Role:</label>
                    <select id="add-user-role" required>
                        <option value="driver">Driver</option>
                        <option value="admin">Admin</option>
                    </select>

                    <button type="submit" class="submit-btn">Add User</button>
                </form>
            </div>

           
            <div class="user-action edit-user">
                <h3>Edit User</h3>
                <form id="edit-user-form" class="user-form">
                    <input type="hidden" id="edit-user-id">

                    <label for="edit-user-name">Name:</label>
                    <input type="text" id="edit-user-name" required>

                    <label for="edit-user-nic">NIC No:</label>
                    <input type="text" id="edit-user-nic" required>

                    <label for="edit-user-contact">Contact No:</label>
                    <input type="text" id="edit-user-contact" required>

                    <label for="edit-user-role">User Role:</label>
                    <select id="edit-user-role" required>
                        <option value="driver">Driver</option>
                        <option value="admin">Admin</option>
                    </select>

                    <button type="submit" class="submit-btn">Update User</button>
                </form>
            </div>
        </div>
    </div>
  
    <div class="user-table-container">
        <h3>View Users</h3>
        <div class="filter-container">
            <label for="user-role-filter">Filter by Role:</label>
            <select id="user-role-filter">
                <option value="all">All</option>
                <option value="driver">Driver</option>
                <option value="admin">Admin</option>
            </select>
        </div>
        
        <table class="user-table">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>NIC No</th>
                    <th>Contact No</th>
                    <th>User Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="view-users-table-body">
                
                <tr data-role="customer">
                    <td>#U1001</td>
                    <td>Jane Doe</td>
                    <td>123456789V</td>
                    <td>+94 712345678</td>
                    <td>Customer</td>
                    <td>
                        <button class="remove-btn">Remove</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>


 <!<!-------------------------------------------------------------------------- manage Vehicles -->        
     
     
        <section id="manage-vehicles" class="section">
            <h2>Manage Vehicles</h2>

    
    <div class="vehicle-table-container">
        <div class="vehicle-actions">
           
            <div class="vehicle-action add-vehicle">
                <h3>Add New Vehicle</h3>
                <form id="add-vehicle-form" class="vehicle-form">
                    <label for="add-vehicle-num">Vehicle Number Plate:</label>
                    <input type="text" id="add-vehicle-num" required>

                    <label for="add-vehicle-model">Vehicle Model:</label>
                    <input type="text" id="add-vehicle-model" required>

                    <label for="add-vehicle-seats">Seat Capacity:</label>
                    <input type="number" id="add-vehicle-seats" required>
                    
                    <label for="add-vehicle-owner">Owner Name:</label>
                    <input type="text" id="add-vehicle-owner" required>
                    
                    <label for="add-vehicle-OwnerPhone">Owner Contact No:</label>
                    <input type="text" id="add-vehicle-OwnerPhone" required>

                    <button type="submit" class="submit-btn">Add Vehicle</button>
                </form>
            </div>

            
            <div class="vehicle-action edit-vehicle">
                <h3>Edit Vehicle</h3>
                <form id="edit-vehicle-form" class="vehicle-form">
                    <input type="hidden" id="edit-vehicle-id">

                    <label for="edit-vehicle-num">Vehicle Number Plate:</label>
                    <input type="text" id="edit-vehicle-num" required>

                    <label for="edit-vehicle-model">Vehicle Model:</label>
                    <input type="text" id="edit-vehicle-model" required>

                    <label for="edit-vehicle-seats">Seat Capacity:</label>
                    <input type="number" id="edit-vehicle-seats" required>
                    
                    <label for="edit-vehicle-Owner">Owner Name:</label>
                    <input type="text" id="edit-vehicle-Owner" required>
                    
                    <label for="edit-vehicle-OwnerPhone">Owner Contact No:</label>
                    <input type="text" id="edit-vehicle-OwnerPhone" required>

                    <button type="submit" class="submit-btn">Update Vehicle</button>
                </form>
            </div>
        </div>
    </div>

    
    <div class="vehicle-table-container">
        <h3>View Vehicles</h3>
        
        <table class="vehicle-table">
            <thead>
                <tr>
                    <th>Vehicle ID</th>
                    <th>Number Plate</th>
                    <th>Model</th>
                    <th>Seat Capacity</th>
                    <th>Owner Name</th>
                    <th>Owner Contact No</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="view-vehicles-table-body">
                
                <tr>
                    <td>#V1001</td>
                    <td>ABC-1234</td>
                    <td>Toyota Prius</td>
                    <td>4</td>
                    <td>Sorth Norpal</td>
                    <td>0715163570</td>
                    <td>
                        <button class="remove-btn">Remove</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
        </section>

 
<!<!-------------------------------------------------------------------------- billing report -->  

 
        <section id="billing-report" class="section">
            <h2>Billing & Reports</h2>

    <!-- Billing Rate Management -->
    <div class="billing-container">
        <div class="billing-section">
            <h3>Manage Per KM Rate</h3>
            <form id="billing-form" class="billing-form">
                <label for="per-km-rate">Per KM Rate (LKR):</label>
                <input type="number" id="per-km-rate" min="0" step="0.1" required>

                <button type="submit" class="submit-btn">Update Rate</button>
            </form>
        </div>
    </div>

    <!-- Report Overview -->
    <div class="report-container">
        <h3>Report Overview</h3>
        <div class="report-grid">
            <div class="report-card">
                <h4>Total Bookings</h4>
                <p id="total-bookings">120</p>
            </div>
            <div class="report-card">
                <h4>Total Cancellations</h4>
                <p id="total-cancellations">15</p>
            </div>
            <div class="report-card">
                <h4>Total Revenue (LKR)</h4>
                <p id="total-revenue">150,000</p>
            </div>
            <div class="report-card">
                <h4>Average Trip Distance (KM)</h4>
                <p id="avg-distance">12.5</p>
            </div>
        </div>
    </div>
</section>
</section>



    <script>
        function showSection(sectionId) {
            
            document.querySelectorAll('.section').forEach(section => {
                section.classList.remove('active');
            });

            // Show the selected section
            document.getElementById(sectionId).classList.add('active');

            // Highlight the active button
            document.querySelectorAll('.admin-nav a').forEach(btn => {
                btn.classList.remove('active');
            });
            event.target.classList.add('active');
        }
    </script>
    </body>
</html>
