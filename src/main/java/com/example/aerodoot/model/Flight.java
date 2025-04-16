package com.example.aerodoot.model;

import java.time.LocalDateTime;

public class Flight {
    private int flightID;
    private String flightNumber;
    private String departureLocation;
    private String arrivalLocation;
    private LocalDateTime departureTime;
    private LocalDateTime arrivalTime;
    private String status;
    private double economyPrice;
    private double businessPrice;

    public Flight() {}

    public Flight(int flightID, String flightNumber, String departureLocation, String arrivalLocation,
                  LocalDateTime departureTime, LocalDateTime arrivalTime, String status,
                  double economyPrice, double businessPrice) {
        this.flightID = flightID;
        this.flightNumber = flightNumber;
        this.departureLocation = departureLocation;
        this.arrivalLocation = arrivalLocation;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.status = status;
        this.economyPrice = economyPrice;
        this.businessPrice = businessPrice;
    }

    public int getFlightID() { return flightID; }
    public void setFlightID(int flightID) { this.flightID = flightID; }

    public String getFlightNumber() { return flightNumber; }
    public void setFlightNumber(String flightNumber) { this.flightNumber = flightNumber; }

    public String getDepartureLocation() { return departureLocation; }
    public void setDepartureLocation(String departureLocation) { this.departureLocation = departureLocation; }

    public String getArrivalLocation() { return arrivalLocation; }
    public void setArrivalLocation(String arrivalLocation) { this.arrivalLocation = arrivalLocation; }

    public LocalDateTime getDepartureTime() { return departureTime; }
    public void setDepartureTime(LocalDateTime departureTime) { this.departureTime = departureTime; }

    public LocalDateTime getArrivalTime() { return arrivalTime; }
    public void setArrivalTime(LocalDateTime arrivalTime) { this.arrivalTime = arrivalTime; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public double getEconomyPrice() { return economyPrice; }
    public void setEconomyPrice(double economyPrice) { this.economyPrice = economyPrice; }

    public double getBusinessPrice() { return businessPrice; }
    public void setBusinessPrice(double businessPrice) { this.businessPrice = businessPrice; }
}
