package com.example.aerodoot.model;

public class Staff {
    private int staffID;
    private String position;
    private String role;
    private int userID;

    public Staff() {}

    public Staff(int staffID, String position, String role, int userID) {
        this.staffID = staffID;
        this.position = position;
        this.role = role;
        this.userID = userID;
    }

    public int getStaffID() { return staffID; }
    public void setStaffID(int staffID) { this.staffID = staffID; }

    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }
}
