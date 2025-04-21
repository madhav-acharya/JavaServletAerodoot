package com.example.aerodoot.model;

import java.sql.Date;

public class Passenger {
    private int passengerId;
    private String passportNumber;
    private Date dateOfBirth;
    private String gender; // "MALE", "FEMALE", or "OTHER"
    private String address;
    private byte[] profilePicture;
    private int userId;

    public Passenger() {
        // Default constructor
    }

    public Passenger(int passengerId, String passportNumber, Date dateOfBirth,
                     String gender, String address, byte[] profilePicture, int userId) {
        this.passengerId = passengerId;
        this.passportNumber = passportNumber;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.address = address;
        this.profilePicture = profilePicture;
        this.userId = userId;
    }

    public Passenger(String passportNumber, Date dateOfBirth,
                     String gender, String address, byte[] profilePicture, int userId) {
        this.passportNumber = passportNumber;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.address = address;
        this.profilePicture = profilePicture;
        this.userId = userId;
    }

    // Getters and setters
    public int getPassengerId() {
        return passengerId;
    }

    public void setPassengerId(int passengerId) {
        this.passengerId = passengerId;
    }

    public String getPassportNumber() {
        return passportNumber;
    }

    public void setPassportNumber(String passportNumber) {
        this.passportNumber = passportNumber;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public byte[] getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(byte[] profilePicture) {
        this.profilePicture = profilePicture;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
