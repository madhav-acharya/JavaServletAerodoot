package com.example.aerodoot.model;

import java.time.LocalDate;

public class Booking {
    private int bookingID;
    private LocalDate bookingDate;
    private String seatNumber;
    private String classType;
    private String paymentStatus;
    private int passengerID;

    public Booking() {}

    public Booking(int bookingID, LocalDate bookingDate, String seatNumber, String classType, String paymentStatus, int passengerID) {
        this.bookingID = bookingID;
        this.bookingDate = bookingDate;
        this.seatNumber = seatNumber;
        this.classType = classType;
        this.paymentStatus = paymentStatus;
        this.passengerID = passengerID;
    }

    public int getBookingID() { return bookingID; }
    public void setBookingID(int bookingID) { this.bookingID = bookingID; }

    public LocalDate getBookingDate() { return bookingDate; }
    public void setBookingDate(LocalDate bookingDate) { this.bookingDate = bookingDate; }

    public String getSeatNumber() { return seatNumber; }
    public void setSeatNumber(String seatNumber) { this.seatNumber = seatNumber; }

    public String getClassType() { return classType; }
    public void setClassType(String classType) { this.classType = classType; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public int getPassengerID() { return passengerID; }
    public void setPassengerID(int passengerID) { this.passengerID = passengerID; }
}
