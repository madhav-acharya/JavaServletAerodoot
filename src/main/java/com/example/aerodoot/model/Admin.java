package com.example.aerodoot.model;

public class Admin {
    private int adminId;
    private String adminRole; // Values: "SUPER_ADMIN", "ADMIN"
    private int userId;

    public Admin() {
        // Default constructor
    }

    public Admin(int adminId, String adminRole, int userId) {
        this.adminId = adminId;
        this.adminRole = adminRole;
        this.userId = userId;
    }

    // Getters and setters
    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getAdminRole() {
        return adminRole;
    }

    public void setAdminRole(String adminRole) {
        this.adminRole = adminRole;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
