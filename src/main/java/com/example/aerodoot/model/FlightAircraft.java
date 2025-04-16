package com.example.aerodoot.model;

public class FlightAircraft {
    private int bookingID;
    private int flightID;
    private int aircraftID;

    public FlightAircraft() {}

    public FlightAircraft(int bookingID, int flightID, int aircraftID) {
        this.bookingID = bookingID;
        this.flightID = flightID;
        this.aircraftID = aircraftID;
    }

    public int getBookingID() { return bookingID; }
    public void setBookingID(int bookingID) { this.bookingID = bookingID; }

    public int getFlightID() { return flightID; }
    public void setFlightID(int flightID) { this.flightID = flightID; }

    public int getAircraftID() { return aircraftID; }
    public void setAircraftID(int aircraftID) { this.aircraftID = aircraftID; }
}
