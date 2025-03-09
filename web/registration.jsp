<%-- 
    Document   : registration
    Created on : Mar 1, 2025, 3:16:58 PM
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        
        <title>Register - Mega City Cabs</title>
    </head>
    <body>
       
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
        
        <header>
        
        <div class="logo">🚖 Mega City Cabs </div>
        <nav>
            <a href="index.jsp">  Home </a>
            <a href="index.jsp#get-a-cab">  Get a Cab </a>
            <a href="index.jsp#about">  About </a>
            <a href="index.jsp#services">  Services </a>
            <a href="index.jsp#our-team">  Our Team </a>
            <a href="#">  Help </a>
            <a href="index.jsp#contact-us">  Contact Us </a>
        </nav>
        
    </header>
        
        
        <section class="register-container">
    
    <div class="register-image">
        <img src="Images/register.jpg" alt="Register Image">
    </div>

   
    <div class="register-form">
        <h2>Register</h2>
        <form action="CustomerRegServelet" method="POST">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone No</label>
                <input type="tel" id="phone" name="phone" required>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="nic">NIC</label>
                <input type="text" id="nic" name="nic" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>

   

            <div class="form-group checkbox">
                <input type="checkbox" id="terms" name="terms" required>
                <label for="terms">I agree to the Terms of Use</label>
            </div>

            <div class="button-group">
                <button type="submit" class="btn2">Register</button>
                <button type="button" class="btnsecondary2"onclick="window.location.href='login.jsp'">Login</button>
            </div>
        </form>
    </div>
</section>
    </body>
</html>
