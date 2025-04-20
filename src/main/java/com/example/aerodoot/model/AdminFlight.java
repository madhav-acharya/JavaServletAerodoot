package com.example.aerodoot.model;

public class AdminFlight {
    private int adminId;
    private int flightId;

    public AdminFlight() {
        // Default constructor
    }

    public AdminFlight(int adminId, int flightId) {
        this.adminId = adminId;
        this.flightId = flightId;
    }

    // Getters and setters
    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }
}
