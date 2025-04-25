package com.example.aerodoot.dto;

import com.example.aerodoot.model.Passenger;
import com.example.aerodoot.model.User;

public class PassengerDashboardData {
    private User user;
    private Passenger passenger;

    public PassengerDashboardData(User user, Passenger passenger) {
        this.user = user;
        this.passenger = passenger;
    }

    public User getUser() {
        return user;
    }

    public Passenger getPassenger() {
        return passenger;
    }
}
