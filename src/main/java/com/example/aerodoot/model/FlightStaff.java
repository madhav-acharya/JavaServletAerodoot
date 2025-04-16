package com.example.aerodoot.model;

public class FlightStaff {
    private int bookingID;
    private int flightID;
    private int staffID;
    private int userID;

    public FlightStaff() {}

    public FlightStaff(int bookingID, int flightID, int staffID, int userID) {
        this.bookingID = bookingID;
        this.flightID = flightID;
        this.staffID = staffID;
        this.userID = userID;
    }

    public int getBookingID() { return bookingID; }
    public void setBookingID(int bookingID) { this.bookingID = bookingID; }

    public int getFlightID() { return flightID; }
    public void setFlightID(int flightID) { this.flightID = flightID; }

    public int getStaffID() { return staffID; }
    public void setStaffID(int staffID) { this.staffID = staffID; }

    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }
}
