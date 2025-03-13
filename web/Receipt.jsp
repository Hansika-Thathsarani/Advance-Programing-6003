<%-- 
    Document   : Admin
    Created on : Mar 2, 2025, 2:01:00 PM
    Author     : Hansika Thathsarani
--%>

<%@page import="java.util.List"%>
<%@page import="java.lang.Integer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="Styles/Styles.css">
    <title>Receipt - Mega City Cabs</title>
        <title>JSP Page</title>
    </head>
    <body>
 
  <% 
List<String> data = (List<String>) request.getAttribute("data"); 
%>
             <div class="payment-slip">
        <h2>Payment Receipt</h2>
        
        <button class="print-btn" onclick="window.location.href='CustomerBookingServlet'">Back</button>
        <button class="print-btn" onclick="window.print()">Print Receipt</button>
        
        <div class="slip-content">
            
            
            <% if (data != null) { %>

           <div class="detail"><strong>Booking ID:</strong><%= data.get(0) %></div>
    <div class="detail"><strong>Name:</strong> <%= data.get(1) %></div>
    <div class="detail"><strong>Date & Time:</strong> <%= data.get(2) %></div>
    <div class="detail"><strong>Pickup Location:</strong> <%= data.get(3) %></div>
    <div class="detail"><strong>Destination:</strong> <%= data.get(4) %></div>
    <div class="detail"><strong>Total Mileage:</strong> <%= data.get(5) %> km</div>
    <div class="detail"><strong>Total Fare:</strong> LKR <%= data.get(6) %>.00</div>
            
            
            <% } %>
            


 
        </div>

    </div>


    </body>
</html>
