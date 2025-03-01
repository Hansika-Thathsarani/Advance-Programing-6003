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
        
        <title>Register - Mega City Cabs</title>
    </head>
    <body>
        
        <header>
        <div class="logo">🚖 Mega City Cabs </div>
        <nav>
            <a href="#">  Home </a>
            <a href="#">  Get a Cab </a>
            <a href="#">  About </a>
            <a href="#">  Services </a>
            <a href="#">  Our Team </a>
            <a href="#">  Help </a>
            <a href="#">  Contact Us </a>
        </nav>
        
    </header>
        
        <section class="register-container">
    
    <div class="register-image">
        <img src="Images/register.jpg" alt="Register Image">
    </div>

   
    <div class="register-form">
        <h2>Register</h2>
        <form action="#" method="POST">
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

            <div class="form-group">
                <label for="role">User Role</label>
                <select id="role" name="role">
                    <option value="Customer">Customer</option>
                    <option value="Driver">Driver</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>

            
            <div class="form-group">
                <label for="license">License No</label>
                <input type="text" id="license" name="license">
            </div>

            <div class="form-group checkbox">
                <input type="checkbox" id="terms" name="terms" required>
                <label for="terms">I agree to the Terms of Use</label>
            </div>

            <div class="button-group">
                <button type="submit" class="btn2">Sign Up</button>
                <button type="button" class="btnsecondary2">Sign In</button>
            </div>
        </form>
    </div>
</section>
    </body>
</html>
