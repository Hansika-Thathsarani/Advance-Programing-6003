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
    
 <!-- Header -->   

    <header>
        <div class="logo">🚖 Mega City Cabs </div>
        <nav>
           <a href="#home">Home</a>
           <a href="#get-a-cab">Get a Cab</a>
           <a href="#about">About</a>
           <a href="#services">Services</a>
           <a href="#our-team">Our Team</a>
           <a href="Help.jsp">Help</a>
           <a href="#contact-us">Contact Us</a>
        </nav>
           <button class="btn" onclick="window.location.href='login.jsp'">Book Now</button>
    </header>
 
 <!-- Home -->
 
    <section id="home" class="home">
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
            <button class="btn sign-in"onclick="window.location.href='login.jsp'">Login</button>
            <button class="btn login"onclick="window.location.href='registration.jsp'">Register</button>
        </div>
    </div>
    <div class="home-image">
        <img src="Images/home2.png" alt="Mega City Cabs" />
    </div>
        
 <!-- Get a Cab -->
               
</section>
    <section id="get-a-cab" class="get-car">
    <div class="Get-image">
        <img src="Images/home.png" alt="Mega City Cabs" />
    </div>
    <div class="get-car-content">
        <p>Need a ride? Book your cab now and travel with ease!</p>
        <div class="get-car-button">
        <button class="btn book-now"onclick="window.location.href='login.jsp'">Book Now</button>
    </div>
    </div> 
</section>

 <!-- About -->
 
 
    <section id="about" class="about">
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
 
 <!-- Services -->
 
 <section id="services" class="services">
    <h2 class="services-title">Our Services</h2>
    <div class="services-container">
        <div class="service-card">
            <img src="Images/24-hours.png" alt="24x7 Service" class="service-icon" />
            <h4>24x7 Service</h4>
            <p>We are available anytime, anywhere, ensuring your journey is never delayed.</p>
        </div>
        <div class="service-card">
            <img src="Images/cost.png" alt="Price Transparency" class="service-icon" />
            <h4>Price Transparency</h4>
            <p>No hidden charges! Get fair pricing for all your trips.</p>
        </div>
        <div class="service-card">
            <img src="Images/taxi-service.png" alt="Cabs Availability" class="service-icon" />
            <h4>Cabs Availability</h4>
            <p>Find a cab whenever you need it with our extensive network.</p>
        </div>
        <div class="service-card">
            <img src="Images/airport.png" alt="Airport Transfer" class="service-icon" />
            <h4>Airport Transfer</h4>
            <p>Hassle-free and timely airport transfers for a smooth journey.</p>
        </div>
        <div class="service-card">
            <img src="Images/suitcases.png" alt="Baggage Transport" class="service-icon" />
            <h4>Baggage Transport</h4>
            <p>Secure and reliable baggage transport for your convenience.</p>
        </div>
        <div class="service-card">
            <img src="Images/transfer.png" alt="City Transfer" class="service-icon" />
            <h4>City Transfer</h4>
            <p>Easy city transfers to help you reach your destination comfortably.</p>
        </div>
    </div>
</section>
 
 <!-- Team -->
 
 <section id="our-team" class="our-team">
    <h2>Our Top Drivers</h2>
    <div class="carousel">
        <div class="slides">
            <input type="radio" name="radio-btn" id="slide1" checked>
            <input type="radio" name="radio-btn" id="slide2">
            <input type="radio" name="radio-btn" id="slide3">

            <div class="slide first">
                <img src="Images/driver1.jpeg" alt="Driver 1">
                <h3>John Doe</h3>
                <h4>Sofia Gabrel</h4>
                <p>"John is an excellent driver! Always punctual and very polite."</p>
                <div class="stars">★★★★★</div>
                <h4>James Anderson</h4>
                <p>"Excellent service! The ride was smooth, and the driver was very professional."</p>
                <div class="stars">★★★★</div>
                <h4>David Johnson</h4>
                <p>"Friendly and punctual! The best cab experience I've had in a long time."</p>
                <div class="stars">★★★★★</div>
            </div>

            <div class="slide">
                <img src="Images/driver2.jpeg" alt="Driver 2">
                <h3>Sarah Williams</h3>
                <h4>Sophia Martinez</h4>
                <p>"Great experience! The best cab driver I've ever had."</p>
                <div class="stars">★★★★</div>
                <h4>Emma Brown</h4>
                <p>"Safe and reliable! I always choose this service for my daily commute."</p>
                <div class="stars">★★★★★</div>
                
            </div>

            <div class="slide">
                <img src="Images/driver3.jpeg" alt="Driver 3">
                <h3>Michael Brown</h3>
                <h4>Liam Wilson</h4>
                <p>"Friendly and professional. Made my ride comfortable and smooth."</p>
                <div class="stars">★★★★</div>
                <h4>Olivia Davis</h4>
                <p>"The driver was courteous and knew the best routes to avoid traffic."</p>
                <div class="stars">★★★★★</div>
                <h4>Ethan Thomas</h4>
                <p>"Highly recommend! The cab was clean, and the driver was very polite."</p>
                <div class="stars">★★★★</div>
            </div>

            
            <div class="navigation-auto">
                <div class="auto-btn1"></div>
                <div class="auto-btn2"></div>
                <div class="auto-btn3"></div>
            </div>
        </div>

        <div class="manual-navigation">
            <label for="slide1" class="manual-btn"></label>
            <label for="slide2" class="manual-btn"></label>
            <label for="slide3" class="manual-btn"></label>
        </div>
    </div>
</section>
 
 <!-- Contact -->
 
 <section id="contact-us" class="contact-us">
    <div class="contact-info">
        <h2>Mega City Cabs</h2>
        <p><strong>📍 Address:</strong> 123 Main Street, Mega City</p>
        <p><strong>📞 Contact No:</strong> +1 234 567 890</p>
        <p><strong>✉  Email:</strong> contact@megacitycabs.com</p>
    </div>
    <div class="contact-image">
        <img src="Images/contact.avif" alt="Mega City Cabs">
    </div>
</section>
 
 <footer>
    <p>&copy; 2025 Mega City Cabs. All Rights Reserved.</p>
</footer>
   
</body>
</html>