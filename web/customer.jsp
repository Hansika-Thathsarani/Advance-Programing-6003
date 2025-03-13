<%-- 
    Document   : customer
    Created on : Mar 3, 2025, 3:34:25 PM
    Author     : Hansika Thathsarani
--%>

<%@page import="src.business.model.Ride"%>
<%@page import="java.util.List"%>
<%@page import="src.business.model.User"%>
<%@page import="src.persistence.utils.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>\
<%@page import="javax.servlet.http.HttpSession" %>
<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp"); 
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="Styles/Styles.css">
    <title>Customer Panel - Mega City Cabs</title>
</head>
<body>
    <header>
        <div class="logo">🚖 Mega City Cabs - Customer Panel </div>
        <nav class="admin-nav">
            <a href="#" class="active" onclick="showSection('booking')">Book a Ride</a>
            <a href="#"  onclick="showSection('profile')">My Profile</a>
            <a href="#" onclick="showSection('my-rides')">My Rides</a>
        
            <a href="#" onclick="window.location.href='Help.jsp'">Support & Help Center</a>
        </nav>
        <button class="btn" onclick="window.location.href='index.jsp'">Log Out</button>
    </header>

    <div class="content">
        
        <section id="profile" class="section">
            <h2>Welcome, <span id="customer-name"><%=loggedInUser. getName() %></span> 👋</h2>
            <div class="customer-profile-container">
    
    <div class="profile-tile">
        <h3>Edit Profile</h3>
        <div class="tile-content">
            <form class="profile-form" action="UpdateProfileServlet" method="POST">
                <label for="full-name">Full Name</label>
                <input type="text" id="full-name" name="full-name" value="<%= loggedInUser.getName() %>"required>
                
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="<%= loggedInUser.getEmail() %>" required>
                
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" value="<%= loggedInUser.getPhone() %>" required>
                
                <button type="submit" class="submit-btn">Save Changes</button>
            </form>
        </div>
    </div>
    
   
    <div class="profile-tile">
        <h3>Password Change</h3>
        <div class="tile-content">
            <form class="password-form">
                <label for="current-password">Current Password</label>
                <input type="password" id="current-password" name="current-password" placeholder="Enter current password" required>
                
                <label for="new-password">New Password</label>
                <input type="password" id="new-password" name="new-password" placeholder="Enter new password" required>
                
                <label for="confirm-password">Confirm New Password</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm new password" required>
                
                <button type="submit" class="submit-btn">Change Password</button>
            </form>
        </div>
    </div>
    
 
    <div class="profile-tile">
        <h3>Card Details</h3>
        <div class="profile-info">
            <h3>Manage Payment Methods</h3>
            <p>Saved Payment Methods:</p>
            <ul class="payment-list">
                <li>💳 Visa **** 1234</li>
                <li>💳 Mastercard **** 5678</li>
            </ul>
        </div>
        <h3>Add New Payment Method</h3>
        <div class="tile-content">
            <form class="card-form">
                <label for="card-number">Card Number</label>
                <input type="text" id="card-number" name="card-number" placeholder="Enter your card number" required>
                
                <label for="expiry-date">Expiry Date</label>
                <input type="text" id="expiry-date" name="expiry-date" placeholder="MM/YY" required>
                
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="Enter CVV" required>
                
                <button type="submit" class="submit-btn">Add Card</button>
            </form>
        </div>
    </div>
</div>
        </section>

<!---------------------------------------------- booking----------------------------------->
        
        <section id="booking" class="section active">
            
    <h2>Ready to Go? Reserve Your Ride Today!</h2>
    <div class="booking-container2">
    
    <div class="booking-image">
        <img src="Images/register.jpg" alt="Booking Image">
    </div>
    <div class="book-ride-container">
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <form class="book-ride-form" action="CustomerBookingServlet" method="post"  >
        <input type="hidden" name="type" value="lookup">
        <label for="pickup-location">Pickup Location</label>
        <select id="add-user-role" name="pickup-location" required>
                          <%
                                                List<String> pickupLocation = (List<String>) request.getAttribute("pickupLocations");
                                                if (pickupLocation != null) {
                                                    for (String pickup : pickupLocation) {
                                            %>
                                             <option value="<%= pickup%>"><%= pickup%></option>
                                            <%
                                                    }
                                                }
                                            %>
          </select>

        <label for="destination">Destination</label>
        <select id="add-user-role" name="destination" required>
                          <%
                                                List<String> destinationLocation = (List<String>) request.getAttribute("destinationLocations");
                                                if (destinationLocation != null) {
                                                    for (String destination : destinationLocation) {
                                            %>
                                             <option value="<%= destination%>"><%= destination%></option>
                                            <%
                                                    }
                                                }
                                            %>
          </select>
        <button type="submit" name="" value="find-vehicle" class="submit-btn">Find Vehicle</button>
   

        </form>
          
          
          
          
          
          
          
          <form class="book-ride-form"  action ="CustomerBookingServlet" method="post" >
    <input type="hidden" name="type" value="submit">
        <label for="select-vehicle">Select Vehicle</label>
        <select id="select-vehicle" name="select-vehicle"  >
            <%
                                                List<String> availableVehicles = (List<String>) request.getAttribute("availableVehicles");
                                                if (availableVehicles != null) {
                                                    for (String vehicle : availableVehicles) {
                                            %>
                                             <option value="<%= vehicle%>"><%= vehicle%></option>
                                            <%
                                                    }
                                                }
                                            %>
        </select>
       <label for="date">Date</label>
        <input type="date" id="date" name="bookingDate" >

        <label for="time">Time</label>
            <select id="bookingHour" class="form-control me-2" name="bookingHour" >
                <option value="">Hour</option>
                <% for (int i = 0; i < 24; i++) {%>
                <option value="<%= String.format("%02d", i)%>"><%= String.format("%02d", i)%></option>
                <% } %>
            </select>

            <select id="bookingMinute" class="form-control" name="bookingMinute" >
                <option value="">Minute</option>
                <% for (int i = 0; i < 60; i++) {%>
                <option value="<%= String.format("%02d", i)%>"><%= String.format("%02d", i)%></option>
                <% }%>
            </select>
      
        
        <div class="rate-info " >
            <p name="selectedValue">Trip & Distance:   <%
                        String selectedPickupLocation = (String) request.getAttribute("selectedPickupLocation");
                        if (selectedPickupLocation != null) {
                            out.print(selectedPickupLocation + " to"); 
                        } else {
                            out.print("- Select your trip locations -");
                        }
                %> 

                 <%
                        String selectedDestination = (String) request.getAttribute("selecteddestinationLocations");
                        if (selectedDestination != null) {
                            out.print(selectedDestination); 
                        } else {
                            out.print("");
                        }
                %>

                <%
                        Integer tripDistances = (Integer) request.getAttribute("tripDistance");
                        if (tripDistances != null) {
                            out.print(" (" + tripDistances + " km)"); 
                        } else {
                            out.print(" ");
                        }
                  %>
            </p>


             <input type="hidden" name="selectedValue" value="  <%
                       
                        if (selectedPickupLocation != null) {
                            out.print(selectedPickupLocation + " to"); 
                        } else {
                            out.print("- Select your trip locations -");
                        }
                %> <%
                     
                        if (selectedDestination != null) {
                            out.print(selectedDestination); 
                        } else {
                            out.print("");
                        }
                %> ">

            

                  <label for="payment-method">Select Payment Method</label>
                 </div>
                    <select id="payment-method" name="payment-method" required>
                        <option value="credit-card">Visa **** 1234</option>
                        <option value="debit-card">Mastercard **** 5678</option>
                        <option value="cash">Cash</option>
                    </select>
               

        <button type="submit" name=""  value="submit" class="submit-btn" >Check Out</button>
       
    </form>

                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
        </div>
        </section>
                  

                  
                  
                  

    <!---------------------------------------------- MY booking----------------------------------->    
        <section id="my-rides" class="section">
            <h2>My Rides</h2>
            <table>
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Date & Time</th>
                        <th>Pickup location</th>
                        <th>Destination</th>
                        <th>Driver</th>
                        <th>Vehicle</th>
                        <th>Amount</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
  <%
                          List<Ride> rides = (List<Ride>) request.getAttribute("myRides");
                          if (rides != null) {
                              for (Ride ride : rides) {
                      %>
                      
                            <td><%= ride.getBookingID()%></td>
                          <td><%= ride.getDateTime() %></td>
                          <td><%= ride.getPickupLocation() %></td>
                          <td><%= ride.getDestination() %></td>
                          <td><%= ride.getDriver() %></td>
                          <td><%= ride.getVehilcle() %></td>
                          <td><%= ride.getPrice() %></td>
                          <td><a href="DeleteMyBooking?id=<%= ride.getBookingID() %>" class="remove-btn">Delete</a></td>
                        
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
        </section>
    
    

    <!---------------------------------------------- Print----------------------------------->     
    
        <section id="payment" class="section">
             <div class="payment-slip">
        <h2>Payment Receipt</h2>
        <div class="slip-content">
            <div class="detail"><strong>Booking ID:</strong><%
                        String bookingID = (String) request.getAttribute("bookingId");
                        if (bookingID != null) {
                            out.print(bookingID ); 
                        } else {
                            out.print(" - ");
                        }
                %> </div>
            <div class="detail"><strong>Name:</strong> James Anderson</div>
            <div class="detail"><strong>Date:</strong> 2025-03-03</div>
            <div class="detail"><strong>Time:</strong> 10:00 AM</div>
            <div class="detail"><strong>Pickup Location:</strong> Galle</div>
            <div class="detail"><strong>Destination:</strong> Colombo</div>
            <div class="detail"><strong>Total Mileage:</strong> 40km</div>
            <div class="detail"><strong>Total Fare:</strong> LKR 5000.00</div>
        </div>
        <button class="print-btn" onclick="window.print()">Print Slip</button>
    </div>
        </section>
    </div>

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
