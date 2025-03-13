<%-- 
    Document   : Help
    Created on : Mar 13, 2025, 10:36:11 PM
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
<title>Mega City Cabs-HELP</title>
</head>
<body>
    
 <!-- Header -->   

 <header>
     <div class="logo">🚖 Mega City Cabs - Support & Help Center </div>
     <button class="btn" onclick="history.back()">Back</button>
 </header>
 
     <main class="containerH">

        
        <section id="introduction" class="sectionU">
            <h1>Welcome to Mega City Cabs User Guide</h1>
            <p>Navigate our cab booking platform easily by following these simple instructions and tips.</p>
        </section>

      
        <section id="features" class="sectionU">
            <h2>Key Features</h2>
            <ul class="features-list">
                <li>🚖 Real-time cab booking and tracking</li>
                <li>💻 User-friendly interface</li>
                <li>🔒 Secure online payments</li>
                <li>📞 24/7 customer support</li>
            </ul>
        </section>

        
        <section id="getting-started" class="sectionU">
            <h2>Getting Started</h2>
            <ol class="steps">
                <li><strong>🔑 Sign Up / Login:</strong> Create an account or log in.</li>
                <li><strong>📍 Enter Your Details:</strong> Provide pickup & drop-off locations.</li>
                <li><strong>🚕 Choose a Cab:</strong> Select a cab that fits your needs.</li>
                <li><strong>✅ Confirm Booking:</strong> Review and confirm your ride.</li>
            </ol>
        </section>

        
        <section id="payment" class="sectionU">
            <h2>💳 Payment Options</h2>
            <p>We support multiple payment methods including credit/debit cards, PayPal, and mobile wallets. All transactions are securely processed.</p>
        </section>

        
        <section id="faq" class="sectionU">
            <h2>❓ Frequently Asked Questions</h2>
            <div class="faq-item">
                <h3>📍 How do I track my cab?</h3>
                <p>Once you book a cab, you can track its location in real-time on our website or mobile app.</p>
            </div>
            <div class="faq-item">
                <h3>🔑 What if I forget my password?</h3>
                <p>Click on the "Forgot Password" link on the login page to reset your password.</p>
            </div>
            <div class="faq-item">
                <h3>📞 How can I reach customer support?</h3>
                <p>Contact our support team via the contact form or by calling our hotline.</p>
            </div>
        </section>

       
        <section id="contact" class="sectionU">
            <h2>📞 Contact Us</h2>
                    </section>

    </main>

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
