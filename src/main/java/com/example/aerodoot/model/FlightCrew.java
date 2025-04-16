package com.example.aerodoot.model;

public class FlightCrew {
    private int bookingID;
    private int flightID;
    private int crewID;

    public FlightCrew() {}

    public FlightCrew(int bookingID, int flightID, int crewID) {
        this.bookingID = bookingID;
        this.flightID = flightID;
        this.crewID = crewID;
    }

    public int getBookingID() { return bookingID; }
    public void setBookingID(int bookingID) { this.bookingID = bookingID; }

    public int getFlightID() { return flightID; }
    public void setFlightID(int flightID) { this.flightID = flightID; }

    public int getCrewID() { return crewID; }
    public void setCrewID(int crewID) { this.crewID = crewID; }
}
