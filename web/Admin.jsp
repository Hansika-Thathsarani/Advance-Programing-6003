<%-- 
    Document   : Admin
    Created on : Mar 2, 2025, 2:01:00 PM
    Author     : Hansika Thathsarani
--%>

<%@page import="src.business.model.Ride"%>
<%@page import="src.business.model.Vehicle"%>
<%@page import="java.util.List"%>
<%@page import="src.business.model.User"%>
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
            <a href="#" class="active" onclick="showSection('manage-users')">Manage Users</a>
            <a href="#" onclick="showSection('manage-vehicles')">Manage Vehicles</a>
            <a href="#" onclick="showSection('billing-report')">Manage Ride Rate</a>
            <a href="#" onclick="showSection('manage-booking')">Manage Booking</a>
        </nav>
            <button class="btn" onclick="window.location.href='index.jsp'">Log Out</button>
    </header>
        <section class="message-container">
            <% String successMsg = (String) request.getAttribute("successMsg"); %>
            <% String errorMsg = (String) request.getAttribute("errorMsg"); %>
            
            <% if (successMsg != null) { %>
                <div class="success-message">
            <span><%= successMsg %></span>
            <button class="close-btn" onclick="this.parentElement.style.display='none'">&times;</button>
                </div>
            <% } %>
            
            <% if (errorMsg != null) { %>
                <div class="error-message">
            <span><%= errorMsg %></span>
            <button class="close-btn" onclick="this.parentElement.style.display='none'">&times;</button>
                </div>
            <% } %>
        </section>
        
     <div class="content">
         
        
         
    <!-------------------------------------------------------------------------- manage booking -->
         
        <section id="manage-booking" class="section">
            <h2>Manage Bookings</h2>
    <div class="booking-container">
        <table>
            <thead>
                <tr>
                    <th>Booking No</th>
                    <th>Date&Time</th>
                    <th>Customer Name</th>
                    <th>Pickup Location</th>
                    <th>Destination</th>
                    <th>Driver</th>
                    <th>Cab</th>
                    <th>Amount</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                                <tbody id="view-users-table-body">
                      <%
                          List<Ride> allBookings = (List<Ride>) request.getAttribute("allbookings");
                          if (allBookings != null) {
                              for (Ride ride : allBookings) {
                      %>
                      <td><%= ride.getBookingID() %></td>
                          <td><%= ride.getDateTime() %></td>
                          <td><%= ride.getCustomer() %></td>
                          <td><%= ride.getPickupLocation() %></td>
                          <td><%= ride.getDestination() %></td>
                          <td><%= ride.getDriver() %></td>
                          <td><%= ride.getVehilcle() %></td>
                          <td><%= ride.getPrice() %></td>
                         <td><a href="DeleteBookingServelt?id=<%= ride.getBookingID() %>" class="remove-btn">Delete</a></td>
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

         
  <!-------------------------------------------------------------------------- manage Drivers -->     
         
         

  <section id="manage-users" class="section active">

      <h2>Manage Users</h2>

      <div class="user-table-container">
          <div class="user-actions">

              <div class="user-action add-user">
                  <h3>Add New User</h3>
                  <form id="add-user-form" class="user-form" action="UserRegistrationServlet" method="POST">
                      <label for="add-user-name">Name:</label>
                      <input type="text" id="add-user-name" name="name" required>

                      <label for="add-user-address">Address:</label>
                      <input type="text" id="add-user-address" name="address" required>

                      <label for="add-user-contact">Contact No:</label>
                      <input type="text" id="add-user-contact" name="phone" required>

                      <label for="add-user-email">Email:</label>
                      <input type="email" id="add-user-email" name="email" required>

                      <label for="add-user-nic">NIC No:</label>
                      <input type="text" id="add-user-nic" name="nic" required>

                      <label for="add-user-password">Password:</label>
                      <input type="password" id="add-user-password" name="password" required>

                      <label for="add-user-role">User Role:</label>
                      <select id="add-user-role" name="userRole" required>
                          <option value="Driver">Driver</option>
                          <option value="Admin">Admin</option>
                          <option value="Customer">Customer</option>
                      </select>

                      <button type="submit" class="submit-btn">Add User</button>
                  </form>
              </div>


              <div class="user-action edit-user">
                  <h3>Edit User</h3>
                  <form id="edit-user-form" class="user-form" action="UserUpdateServlt" method="post" >
                      <input type="hidden" id="edit-user-id">

                      <label for="edit-user-mail">Email:</label>
                      <select class="form-control" id="edit-user-mail"  name="edit-mail" required>
                          <%
                                                List<String> email = (List<String>) request.getAttribute("emailList");
                                                if (email != null) {
                                                    for (String mail : email) {
                                            %>
                                             <option value="<%= mail%>"><%= mail%></option>
                                            <%
                                                    }
                                                }
                                            %>
                      </select>
                     
                      <label for="edit-user-nic">NIC No:</label>
                      <input type="text" id="edit-user-nic" name="edit-nic" required>

                      <label for="edit-user-contact">Contact No:</label>
                      <input type="text" id="edit-user-contact" name="edit-contact" required>

                      <label for="edit-user-role">User Role:</label>
                      <select id="edit-user-role" name="edit-user-role" required>
                          <option value="driver">Driver</option>
                          <option value="admin">Admin</option>
                          <option value="Customer">Customer</option>
                      </select>

                      <button type="submit" class="submit-btn">Update User</button>
                  </form>
              </div>
          </div>


    
          <div class="table-container">
              <table class="user-table">
                  <thead>
                      <tr>
                          <th>Name</th>
                          <th>Address</th>
                          <th>Contact No</th>
                          <th>Email</th>
                          <th>NIC No</th>
                          <th>Password</th>
                          <th>User Role</th>
                          <th>Actions</th>
                      </tr>
                  </thead>
                  <tbody id="view-users-table-body">
                      <%
                          List<User> users = (List<User>) request.getAttribute("allusers");
                          if (users != null) {
                              for (User user : users) {
                      %>
                      <tr data-role="<%= user.getuserRole()%>">
                          <td><%= user.getName()%></td>
                          <td><%= user.getAddress()%></td>
                          <td><%= user.getPhone()%></td>
                          <td><%= user.getEmail()%></td>
                          <td><%= user.getNic()%></td>
                          <td><%= user.getPassword()%></td>
                          <td><%= user.getuserRole()%></td>
                          <td><a href="DeleteUserServelet?mail=<%= user.getEmail()%>" class="remove-btn">Delete</a></td>
                      </tr>
                      <%
                          }
                      } else {
                      %>
                      <tr>
                          <td colspan="8" class="text-center">No users found.</td>
                      </tr>
                      <%
                          }
                      %>
                  </tbody>
              </table>
          </div>

          <script>
              document.addEventListener("DOMContentLoaded", function () {
                  attachRemoveEvent();
                  document.getElementById("user-role-filter").addEventListener("change", filterUsers);
              });

              function attachRemoveEvent() {
                  document.querySelectorAll(".remove-btn").forEach(button => {
                      button.addEventListener("click", function () {
                          const userId = this.getAttribute("data-userid");
                
                          if (confirm("Are you sure you want to remove this user?")) {
                              fetch("DeleteUserServlet", {
                                  method: "POST",
                                  headers: { "Content-Type": "application/x-www-form-urlencoded" },
                                  body: `userId=${userId}`
                              })
                              .then(response => response.json())
                              .then(data => {
                                  if (data.success) {
                                      alert("User removed successfully!");
                                      this.closest("tr").remove(); 
                                  } else {
                                      alert("Error removing user. Please try again.");
                                  }
                              })
                              .catch(error => console.error("Error:", error));
                          }
                      });
                  });
              }

              function filterUsers() {
                  const filterValue = document.getElementById("user-role-filter").value;
                  document.querySelectorAll("#view-users-table-body tr").forEach(row => {
                      const role = row.getAttribute("data-role");
                      if (filterValue === "all" || role === filterValue) {
                          row.style.display = "table-row";
                      } else {
                          row.style.display = "none";
                      }
                  });
              }
          </script>
      </div>
  </section>



 <!-------------------------------------------------------------------------- manage Vehicles -->        
     
     
        <section id="manage-vehicles" class="section">
            <h2>Manage Vehicles</h2>

    
    <div class="vehicle-table-container">
        <div class="vehicle-actions">
           
            <div class="vehicle-action add-vehicle">
                <h3>Add New Vehicle</h3>
                <form id="add-vehicle-form" class="vehicle-form" method="post" action="VehicleRegisterationServelt"  >
                    <label for="add-vehicle-num">Vehicle Number Plate:</label>
                    <input type="text" id="add-vehicle-num" name="add-vehicle-num" required>

                    <label for="add-vehicle-model">Vehicle Model:</label>
                    <input type="text" id="add-vehicle-model" name="add-vehicle-model" required>

                    <label for="add-vehicle-seats">Seat Capacity:</label>
                    <input type="number" id="add-vehicle-seats" name="add-vehicle-seats" required>
                    
                    <label for="add-vehicle-owner">Owner Name:</label>
                    <input type="text" id="add-vehicle-owner" name="add-owner-name" required>
                    
                    <label for="add-vehicle-OwnerPhone">Owner Contact No:</label>
                    <input type="text" id="add-vehicle-OwnerPhone" name="add-owner-no" required>

                    <button type="submit" class="submit-btn">Add Vehicle</button>
                </form>
            </div>

            
            <div class="vehicle-action edit-vehicle">
                <h3>Edit Vehicle</h3>
                <form id="edit-vehicle-form" class="vehicle-form" action="VehicleUpdateServelt" method="post" >
                    <input type="hidden" id="edit-vehicle-id">

                    <label for="edit-vehicle-num">Vehicle Number Plate:</label>
                    <select class="form-control" id="edit-vehicle-num"  name="edit-vehicle-num" required>
                          <%
                                                List<String> vehicle = (List<String>) request.getAttribute("vehicleList");
                                                if (vehicle != null) {
                                                    for (String vehicleNo : vehicle) {
                                            %>
                                             <option value="<%= vehicleNo%>"><%= vehicleNo%></option>
                                            <%
                                                    }
                                                }
                                            %>
                      </select>

                    <label for="edit-vehicle-seats">Seat Capacity:</label>
                    <input type="number" id="edit-vehicle-seats" name="edit-vehicle-seats" required>
                    
                    <label for="edit-vehicle-Owner">Owner Name:</label>
                    <input type="text" id="edit-vehicle-Owner" name="edit-owner-name" required>
                    
                    <label for="edit-vehicle-OwnerPhone">Owner Contact No:</label>
                    <input type="text" id="edit-vehicle-OwnerPhone" name="edit-owner-phone" required>

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
                    <th>Number Plate</th>
                    <th>Model</th>
                    <th>Seat Capacity</th>
                    <th>Owner Name</th>
                    <th>Owner Contact No</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="view-vehicles-table-body">
                
               <%
                          List<Vehicle> vehicles = (List<Vehicle>) request.getAttribute("AllvehicleList");
                          if (vehicles != null) {
                              for (Vehicle allvehicle : vehicles) {
                      %>
                        <td><%= allvehicle.getvehicleNo() %></td>
                          <td><%= allvehicle.getvehicleModel()%></td>
                          <td><%= allvehicle.getSeatCount()%></td>
                          <td><%= allvehicle.getOwnerName() %></td>
                          <td><%= allvehicle.getOwnerContact() %></td>
                        <td><a href="DeleteVehicleServlet?vehicle=<%= allvehicle.getvehicleNo() %>" class="remove-btn">Delete</a></td>
                      </tr>
                      <%
                          }
                      } else {
                      %>
                      <tr>
                          <td colspan="8" class="text-center">No users found.</td>
                      </tr>
                      <%
                          }
                      %>
            </tbody>
        </table>
    </div>
        </section>

 
<!-------------------------------------------------------------------------- billing report -->  

 
        <section id="billing-report" class="section">

            <h2>Manage Ride Rate</h2>
   <!-- comment 
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
           -->
            
 <div class="billing-container">
        <div class="billing-section">
            <!-- 
            <h3>Manage Ride Rate</h3> 
            -->     
            <form id="billing-form" class="billing-form" action="ManageRideServelet" method="post"  >
                    <label for="select-vehicle">Select Vehicle:</label>
                    <select class="form-control" id="asgn-vehicle-num"  name="asgn-vehicle-num" required>
                          <%
                                                
                                                if (vehicle != null) {
                                                    for (String vehicleNo : vehicle) {
                                            %>
                                             <option value="<%= vehicleNo%>"><%= vehicleNo%></option>
                                            <%
                                                    }
                                                }
                                            %>
                      </select>

                    <label for="select-driver">Select Driver:</label>
                    <select id="select-driver" name="asgn-driver"  required>
                        <%
                                                 List<String> drivers = (List<String>) request.getAttribute("driverList");
                                                if (drivers != null) {
                                                    for (String driver : drivers) {
                                            %>
                                             <option value="<%= driver%>"><%= driver%></option>
                                            <%
                                                    }
                                                }
                                            %>
                    </select>

                    <label for="add-location">Parked Location:</label>
                    <select id="select-location" name="asgn-location" required>
                        <%
                                                 List<String> parkedLocations = (List<String>) request.getAttribute("parkedLocations");
                                                if (parkedLocations != null) {
                                                    for (String location : parkedLocations) {
                                            %>
                                             <option value="<%= location%>"><%= location%></option>
                                            <%
                                                    }
                                                }
                                            %>
                    </select>
                    
                    <label for="price">Price(LKR):</label>
                    <input type="number" id="price" name="asgn-price" required>

                <button type="submit" class="submit-btn">Update Rate</button>
            </form>
        </div>
    </div>

    
</section>
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
