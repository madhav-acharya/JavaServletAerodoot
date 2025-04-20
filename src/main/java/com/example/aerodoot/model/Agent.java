package com.example.aerodoot.model;

public class Agent {
    private int agentId;
    private String position;
    private String licenseNumber;
    private String profilePicture;
    private Integer companyId; // Nullable due to ON DELETE SET NULL
    private int userId;

    public Agent() {
        // Default constructor
    }

    public Agent(int agentId, String position, String licenseNumber, String profilePicture,
                 Integer companyId, int userId) {
        this.agentId = agentId;
        this.position = position;
        this.licenseNumber = licenseNumber;
        this.profilePicture = profilePicture;
        this.companyId = companyId;
        this.userId = userId;
    }

    // Getters and setters
    public int getAgentId() {
        return agentId;
    }

    public void setAgentId(int agentId) {
        this.agentId = agentId;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
