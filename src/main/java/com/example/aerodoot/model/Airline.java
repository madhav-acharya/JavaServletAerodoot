package com.example.aerodoot.model;

public class Airline {
    private int airlineId;
    private String name;
    private String headquarters;
    private String contactNumber;
    private String email;

    public Airline() {
        // Default constructor
    }

    public Airline(int airlineId, String name, String headquarters,
                   String contactNumber, String email) {
        this.airlineId = airlineId;
        this.name = name;
        this.headquarters = headquarters;
        this.contactNumber = contactNumber;
        this.email = email;
    }

    // Getters and setters
    public int getAirlineId() {
        return airlineId;
    }

    public void setAirlineId(int airlineId) {
        this.airlineId = airlineId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHeadquarters() {
        return headquarters;
    }

    public void setHeadquarters(String headquarters) {
        this.headquarters = headquarters;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
