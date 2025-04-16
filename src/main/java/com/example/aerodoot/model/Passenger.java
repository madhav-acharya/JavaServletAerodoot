package com.example.aerodoot.model;

public class Passenger {
    private int passengerID;
    private String passportNumber;
    private int userID;

    public Passenger() {}

    public Passenger(int passengerID, String passportNumber, int userID) {
        this.passengerID = passengerID;
        this.passportNumber = passportNumber;
        this.userID = userID;
    }

    public int getPassengerID() { return passengerID; }
    public void setPassengerID(int passengerID) { this.passengerID = passengerID; }

    public String getPassportNumber() { return passportNumber; }
    public void setPassportNumber(String passportNumber) { this.passportNumber = passportNumber; }

    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }
}
