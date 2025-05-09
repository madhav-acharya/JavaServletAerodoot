package com.example.aerodoot.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Booking {
    private int bookingId;
    private Timestamp bookingDate;
    private String classType; // ENUM: ECONOMY, BUSINESS
    private int seatsBooked;
    private BigDecimal totalPrice;
    private String bookingStatus; // ENUM: PENDING, CONFIRMED, CANCELLED, COMPLETED
    private int flightId;
    private int passengerId;

    public Booking() {
        // Default constructor
    }

    public Booking(int bookingId, Timestamp bookingDate, String classType, int seatsBooked,
                   BigDecimal totalPrice, String bookingStatus,
                   int flightId, int passengerId) {
        this.bookingId = bookingId;
        this.bookingDate = bookingDate;
        this.classType = classType;
        this.seatsBooked = seatsBooked;
        this.totalPrice = totalPrice;
        this.bookingStatus = bookingStatus;
        this.flightId = flightId;
        this.passengerId = passengerId;
    }

    // Getters and setters
    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public Timestamp getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Timestamp bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getClassType() {
        return classType;
    }

    public void setClassType(String classType) {
        this.classType = classType;
    }

    public int getSeatsBooked() {
        return seatsBooked;
    }

    public void setSeatsBooked(int seatsBooked) {
        this.seatsBooked = seatsBooked;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public int getPassengerId() {
        return passengerId;
    }

    public void setPassengerId(int passengerId) {
        this.passengerId = passengerId;
    }
}
