package com.example.aerodoot.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.sql.Time;

public class Flight {
    private int flightId;
    private String flightNumber;
    private String departureLocation;
    private String arrivalLocation;
    private Timestamp departureTime;
    private Timestamp arrivalTime;
    private Time duration;
    private String status; // Enum: SCHEDULED, DELAYED, CANCELLED, IN_AIR, LANDED, BOARDING
    private int availableSeatsEconomy;
    private int availableSeatsBusiness;
    private BigDecimal economyPrice;
    private BigDecimal businessPrice;
    private int aircraftId;
    private int airlineId;

    public Flight() {
        // Default constructor
    }

    public Flight(int flightId, String flightNumber, String departureLocation, String arrivalLocation,
            Timestamp departureTime, Timestamp arrivalTime, Time duration, String status,
            int availableSeatsEconomy, int availableSeatsBusiness,
            BigDecimal economyPrice, BigDecimal businessPrice,
            int aircraftId, int airlineId) {
        this.flightId = flightId;
        this.flightNumber = flightNumber;
        this.departureLocation = departureLocation;
        this.arrivalLocation = arrivalLocation;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.duration = duration;
        this.status = status;
        this.availableSeatsEconomy = availableSeatsEconomy;
        this.availableSeatsBusiness = availableSeatsBusiness;
        this.economyPrice = economyPrice;
        this.businessPrice = businessPrice;
        this.aircraftId = aircraftId;
        this.airlineId = airlineId;
    }

    // Getters and setters
    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getDepartureLocation() {
        return departureLocation;
    }

    public void setDepartureLocation(String departureLocation) {
        this.departureLocation = departureLocation;
    }

    public String getArrivalLocation() {
        return arrivalLocation;
    }

    public void setArrivalLocation(String arrivalLocation) {
        this.arrivalLocation = arrivalLocation;
    }

    public Timestamp getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Timestamp departureTime) {
        this.departureTime = departureTime;
    }

    public Timestamp getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(Timestamp arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public Time getDuration() {
        return duration;
    }

    public void setDuration(Time duration) {
        this.duration = duration;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getAvailableSeatsEconomy() {
        return availableSeatsEconomy;
    }

    public void setAvailableSeatsEconomy(int availableSeatsEconomy) {
        this.availableSeatsEconomy = availableSeatsEconomy;
    }

    public int getAvailableSeatsBusiness() {
        return availableSeatsBusiness;
    }

    public void setAvailableSeatsBusiness(int availableSeatsBusiness) {
        this.availableSeatsBusiness = availableSeatsBusiness;
    }

    public BigDecimal getEconomyPrice() {
        return economyPrice;
    }

    public void setEconomyPrice(BigDecimal economyPrice) {
        this.economyPrice = economyPrice;
    }

    public BigDecimal getBusinessPrice() {
        return businessPrice;
    }

    public void setBusinessPrice(BigDecimal businessPrice) {
        this.businessPrice = businessPrice;
    }

    public int getAircraftId() {
        return aircraftId;
    }

    public void setAircraftId(int aircraftId) {
        this.aircraftId = aircraftId;
    }

    public int getAirlineId() {
        return airlineId;
    }

    public void setAirlineId(int airlineId) {
        this.airlineId = airlineId;
    }
}
