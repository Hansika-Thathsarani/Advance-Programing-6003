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
    
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="Styles/Styles.css">
<title>Mega City Cabs</title>
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
            <a href="#">  Contact Us </a>
        </nav>
        <button class="btn">Book Now</button>
    </header>
    <section class="home">
    <div class="home-content">
        <h1>Welcome to Mega City Cabs ✨ </h1>
        <h2>The Best way to get Wherever you're going..</h2>
        <p>
            Mega City Cabs offers the best and most reliable cab services in town. Our professional drivers
            ensure you reach your destination safely and on time. Whether you're heading to work, a meeting,
            or just exploring the city, we have you covered.Experience a seamless ride with our modern fleet and easy booking system. We prioritize your comfort
            and convenience, making sure you travel with ease every time you choose us.
        </p>
        <p>
            Our services are available 24/7, ensuring that you always have a ride whenever you need it. With
            competitive pricing and a range of vehicle options, we cater to all your transportation needs,
            whether it's a solo trip or a group journey.Safety is our top priority. All our cabs are equipped with the latest safety features, and our drivers
            undergo rigorous background checks and training to provide you with the best service possible.
        </p>
        <div class="buttons">
            <button class="btn sign-in">Login</button>
            <button class="btn login">Register</button>
        </div>
    </div>
    <div class="home-image">
        <img src="Images/home2.png" alt="Mega City Cabs" />
    </div>
</section>
    <section class="get-car">
    <div class="Get-image">
        <img src="Images/home.png" alt="Mega City Cabs" />
    </div>
    <div class="get-car-content">
        <p>Need a ride? Book your cab now and travel with ease!</p>
        <div class="get-car-button">
        <button class="btn book-now">Book Now</button>
    </div>
    </div> 
</section>

    <section class="about">
    <h2 class="offer-title">W H A T &nbsp; W E &nbsp; O F F E R</h2>
    <h3 class="work-title">How it will be work our company</h3>
    <div class="about-cards">
        <div class="card">
            <img src="Images/easy.png" alt="Mega City Cabs" />
            <h4>Easy Payment</h4>
            <p>Multiple payment options for a seamless experience.</p>
        </div>
        <div class="card">
            <img src="Images/search.png" alt="Mega City Cabs" />
            <h4>Search Location</h4>
            <p>Find your cab easily with our advanced location services.</p>
        </div>
        <div class="card">
            <img src="Images/safe.png" alt="Mega City Cabs" />
            <h4>Secure Journey</h4>
            <p>Your safety is our priority with verified drivers.</p>
        </div>
        <div class="card">
            <img src="Images/destination.png" alt="Mega City Cabs" />
            <h4>Make Trip</h4>
            <p>Plan and book your trips with ease and flexibility.</p>
        </div>
    </div>
</section>
    
</body>
</html>