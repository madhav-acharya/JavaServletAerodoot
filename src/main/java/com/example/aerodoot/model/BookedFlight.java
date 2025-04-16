package com.example.aerodoot.model;

public class BookedFlight {
    private int bookingID;
    private int flightID;

    public BookedFlight() {}

    public BookedFlight(int bookingID, int flightID) {
        this.bookingID = bookingID;
        this.flightID = flightID;
    }

    public int getBookingID() { return bookingID; }
    public void setBookingID(int bookingID) { this.bookingID = bookingID; }

    public int getFlightID() { return flightID; }
    public void setFlightID(int flightID) { this.flightID = flightID; }
}
