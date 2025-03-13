/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.business.model;

import java.sql.Timestamp;

/**
 *
 * @author Hansika Thathsarani
 */
public class Ride {
    
        public Ride() {
        
    }
    
    private String bookingID;
    private String customer;
    private Timestamp dateTime;
    private String pickupLocation;
    private String destination;
    private String driver;
    private String vehilcle;
    private String status;
    private int price;

    public Ride(String bookingID, String customer, Timestamp dateTime, String pickupLocation, String destination, String driver, String vehilcle, String status, int price) {
        this.bookingID = bookingID;
        this.customer = customer;
        this.dateTime = dateTime;
        this.pickupLocation = pickupLocation;
        this.destination = destination;
        this.driver = driver;
        this.vehilcle = vehilcle;
        this.status = status;
        this.price = price;
    }


    


    public String getBookingID() {
        return bookingID;
    }

    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getVehilcle() {
        return vehilcle;
    }

    public void setVehilcle(String vehilcle) {
        this.vehilcle = vehilcle;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    

    
}
