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
        <h2>Login</h2>
        <form action="LoginServelet" method="POST">
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
                <a href="#" onclick="openForgotPassword()">Forgot Password?</a>
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
        
<div id="forgotPasswordModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeForgotPassword()">&times;</span>
        <h3>Reset Password</h3>
        <form action="ForgotPasswordServlet" method="POST">
            <label for="email">Enter your email</label>
            <input type="email" id="email" name="email" required>
            <button type="submit">Submit</button>
        </form>
    </div>
</div>        
        
        <script>
    function openForgotPassword() {
        document.getElementById("forgotPasswordModal").style.display = "block";
    }

    function closeForgotPassword() {
        document.getElementById("forgotPasswordModal").style.display = "none";
    }
</script>
        
    </body>
</html>