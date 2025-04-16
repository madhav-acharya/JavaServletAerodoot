package com.example.aerodoot.model;

public class Crew {
    private int crewID;
    private String role;
    private String licenseNumber;
    private int userID;

    public Crew() {}

    public Crew(int crewID, String role, String licenseNumber, int userID) {
        this.crewID = crewID;
        this.role = role;
        this.licenseNumber = licenseNumber;
        this.userID = userID;
    }

    public int getCrewID() { return crewID; }
    public void setCrewID(int crewID) { this.crewID = crewID; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getLicenseNumber() { return licenseNumber; }
    public void setLicenseNumber(String licenseNumber) { this.licenseNumber = licenseNumber; }

    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }
}
