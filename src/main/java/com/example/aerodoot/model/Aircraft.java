package com.example.aerodoot.model;

import java.sql.Date;

public class Aircraft {
    private int aircraftId;
    private String model;
    private String manufacturer;
    private int seatCapacityEconomy;
    private int seatCapacityBusiness;
    private Date lastMaintenanceDate;
    private int airlineId;

    public Aircraft() {
        // Default constructor
    }

    public Aircraft(int aircraftId, String model, String manufacturer,
                    int seatCapacityEconomy, int seatCapacityBusiness,
                    Date lastMaintenanceDate, int airlineId) {
        this.aircraftId = aircraftId;
        this.model = model;
        this.manufacturer = manufacturer;
        this.seatCapacityEconomy = seatCapacityEconomy;
        this.seatCapacityBusiness = seatCapacityBusiness;
        this.lastMaintenanceDate = lastMaintenanceDate;
        this.airlineId = airlineId;
    }

    // Getters and setters
    public int getAircraftId() {
        return aircraftId;
    }

    public void setAircraftId(int aircraftId) {
        this.aircraftId = aircraftId;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public int getSeatCapacityEconomy() {
        return seatCapacityEconomy;
    }

    public void setSeatCapacityEconomy(int seatCapacityEconomy) {
        this.seatCapacityEconomy = seatCapacityEconomy;
    }

    public int getSeatCapacityBusiness() {
        return seatCapacityBusiness;
    }

    public void setSeatCapacityBusiness(int seatCapacityBusiness) {
        this.seatCapacityBusiness = seatCapacityBusiness;
    }

    public Date getLastMaintenanceDate() {
        return lastMaintenanceDate;
    }

    public void setLastMaintenanceDate(Date lastMaintenanceDate) {
        this.lastMaintenanceDate = lastMaintenanceDate;
    }

    public int getAirlineId() {
        return airlineId;
    }

    public void setAirlineId(int airlineId) {
        this.airlineId = airlineId;
    }
}
