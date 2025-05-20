package com.example.aerodoot.dto;

public class RevenueByRoute {
    private String departureLocation;
    private String arrivalLocation;
    private double totalRevenue;

    public RevenueByRoute(String departureLocation, String arrivalLocation, double totalRevenue) {
        this.departureLocation = departureLocation;
        this.arrivalLocation = arrivalLocation;
        this.totalRevenue = totalRevenue;
    }

    public String getDepartureLocation() {
        return departureLocation;
    }

    public String getArrivalLocation() {
        return arrivalLocation;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }
    public String getRouteName() {
        return departureLocation + " to " + arrivalLocation;
    }
}
