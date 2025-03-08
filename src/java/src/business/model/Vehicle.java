/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.business.model;

/**
 *
 * @author Hansika Thathsarani
 */
public class Vehicle {
    
    private String vehicleModel;
    private String vehicleNo; 
    private String ownerName;
    private String ownerContact;
    private int driverId;
    private String driverName;
    private String city;
    private int price;

    // Default Constructor
    public Vehicle() {}

    // Parameterized Constructor
    public Vehicle( String vehicleModel, String vehicleNo, String ownerName, String ownerContact, int driverId, String driverName, String city, int price) {
        
        this.vehicleModel = vehicleModel;
        this.vehicleNo = vehicleNo;
        this.ownerName = ownerName;
        this.ownerContact = ownerContact;
        this.driverId = driverId;
        this.driverName = driverName;
        this.city = city;
        this.price = price;
    }

    // Getters and Setters
    
    public String getvehicleModel() {
        return vehicleModel;
    }

    public void setvehicleModel(String vehicleModel) {
        this.vehicleModel = vehicleModel;
    }

    public String getvehicleNo() {
        return vehicleNo;
    }

    public void setvehicleNo(String vehicleNo) {
        this.vehicleNo = vehicleNo;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getOwnerContact() {
        return ownerContact;
    }

    public void setOwnerContact(String ownerContact) {
        this.ownerContact = ownerContact;
    }
    
        public int getDriverId() {
        return driverId;
    }

    public void setDriverId(int driverId) {
        this.driverId = driverId;
    }
    
        public String getDrivrName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }
    
        public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
    public float getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
}
