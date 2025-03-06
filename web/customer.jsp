<%-- 
    Document   : customer
    Created on : Mar 3, 2025, 3:34:25 PM
    Author     : Hansika Thathsarani
--%>

<%@page import="src.persistence.utils.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>\

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
            <a href="#" class="active" onclick="showSection('profile')">My Profile</a>
            <a href="#" onclick="showSection('booking')">Book a Ride</a>
            <a href="#" onclick="showSection('my-rides')">My Rides</a>
            <a href="#" onclick="showSection('payment')">payment</a>            
            <a href="#" onclick="showSection('help')">Support & Help Center</a>
        </nav>
        <button class="btn" onclick="window.location.href='index.jsp'">Log Out</button>
    </header>

    <div class="content">
        
        <section id="profile" class="section active">
            <h2>Welcome, <span id="customer-name">John Doe</span> 👋</h2>
            <div class="customer-profile-container">
    
    <div class="profile-tile">
        <h3>Edit Profile</h3>
        <div class="tile-content">
            <form class="profile-form">
                <label for="full-name">Full Name</label>
                <input type="text" id="full-name" name="full-name" placeholder="Enter your full name" required>
                
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
                
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" placeholder="Enter your phone number" required>
                
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
        
        <section id="booking" class="section">
            
    <h2>Ready to Go? Reserve Your Ride Today!</h2>
    <div class="booking-container2">
    
    <div class="booking-image">
        <img src="Images/register.jpg" alt="Booking Image">
    </div>
    <div class="book-ride-container">
            <form class="book-ride-form">
        
        <label for="pickup-location">Pickup Location</label>
        <input type="text" id="pickup-location" name="pickup-location" placeholder="Enter pickup location" required>

        <label for="destination">Destination</label>
        <input type="text" id="destination" name="destination" placeholder="Enter destination" required>

        <label for="date">Date</label>
        <input type="date" id="date" name="date" required>

        <label for="time">Time</label>
        <input type="time" id="time" name="time" required>

        <label for="select-vehicle">Select Vehicle</label>
        <select id="select-vehicle" name="select-vehicle" required>
            <option value="toyota">Toyota</option>
            <option value="eon">Eon</option>
            <option value="kdh">KDH</option>
        </select>

        <label for="payment-method">Select Payment Method</label>
        <select id="payment-method" name="payment-method" required>
            <option value="credit-card">Visa **** 1234</option>
            <option value="debit-card">Mastercard **** 5678</option>
            <option value="cash">Cash</option>
        </select>
        
        <div class="rate-info">
            <p>Total KM: <span class="rate">  20km</span></p>
        </div>

        <div class="rate-info">
            <p>Total Fare (LKR): <span class="rate">5000.00</span></p>
        </div>

        <button type="submit" class="submit-btn">Book Ride</button>
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
                        <th>Date</th>
                        <th>Time</th>
                        <th>Pickup location</th>
                        <th>Destination</th>
                        <th>Passenger Count</th>
                        <th>Fare(LKR)</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a href="ride-details.html?bookingId=1234">#1234</a></td>
                        <td>2025-03-03</td>
                        <td>10:00 AM</td>
                        <td>Galle</td>
                        <td>Colombo</td>
                        <td>4</td>
                        <td>5000.00</td>
                        <td class="status completed">Completed</td>
                    </tr>
                    <tr>
                        <td>#5678</td>
                        <td>2025-03-05</td>
                        <td>3:00 PM</td>
                        <td>Galle</td>
                        <td>Colombo</td>
                        <td>3</td>
                        <td>4000.00</td>
                        <td>Pending</td>
                    </tr>
                </tbody>
            </table>
        </section>

    <!---------------------------------------------- Print----------------------------------->     
    
        <section id="payment" class="section">
             <div class="payment-slip">
        <h2>Payment Receipt</h2>
        <div class="slip-content">
            <div class="detail"><strong>Booking ID:</strong> #1234</div>
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
