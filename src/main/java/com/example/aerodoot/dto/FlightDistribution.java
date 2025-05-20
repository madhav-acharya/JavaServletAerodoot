package com.example.aerodoot.dto;

public class FlightDistribution {
    private String location;
    private int count;

    public FlightDistribution(String location, int count) {
        this.location = location;
        this.count = count;
    }

    public String getLocation() {
        return location;
    }

    public int getCount() {
        return count;
    }
}
