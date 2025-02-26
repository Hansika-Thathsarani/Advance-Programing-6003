<%-- 
    Document   : index
    Created on : Feb 22, 2025, 6:06:46 PM
    Author     : Hansika Thathsarani
--%>


<%@page import="src.persistence.utils.DBConnection"%>
<%@page import="java.sql.Connection"%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="Styles/Styles.css">
<title>Database Connection Test</title>
</head>
<body>
   <header>
        <div class="container">
            <div class="logo-container">
                <h1 class="logo">MegaCityCab</h1>
            </div>
            <nav class="vertical-menu">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Get Cab</a></li>
                    <li><a href="#">Team</a></li>
                    <li><a href="#">Reviews</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <section class="features">
        <h2>Why Choose Us?</h2>
        <div class="feature-cards">
            <div class="card">
                <div class="icon">&#x1F697;</div>
                <h3>Reliable Rides</h3>
                <p>Always on time, always ready to take you wherever you need to go.</p>
            </div>
            <div class="card">
                <div class="icon">&#x1F50B;</div>
                <h3>AI-Powered</h3>
                <p>Our service is driven by AI to give you a seamless and smart experience.</p>
            </div>
            <div class="card">
                <div class="icon">&#x1F4B5;</div>
                <h3>Affordable Fares</h3>
                <p>Enjoy the best rates in town without compromising on quality.</p>
            </div>
        </div>
    </section>
    
    <footer>
        <p>&copy; 2025 MegaCityCab | All Rights Reserved</p>
    </footer>
</body>
</html>