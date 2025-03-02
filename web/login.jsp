<%-- 
    Document   : login
    Created on : Mar 2, 2025, 10:06:58 AM
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
        
        <title>Login - Mega City Cabs</title>
    </head>
    <body>
        
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
        <h2>Login</h2>
        <form action="#" method="POST">
            <div class="form-group">
                <label for="name">User Name</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="buttonloginG">
                <button type="submit" class="buttonlogin">LOGIN</button>                
            </div>
            
            <div class="forgot">
                <label for="forgotpassword">Forgot Password?</label>
            </div>
            
            <div class="orSignlable">
                <label for="forgotpassword">Or Register Using </label>
            </div>
            
            <div class="forgot">
                <label for="forgotpassword"onclick="window.location.href='registration.jsp'">Register</label>
            </div>
            
        </form>
    </div>
</section>
    </body>
</html>