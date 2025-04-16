package com.example.aerodoot.model;

import java.time.LocalDate;

public class Aircraft {
    private int aircraftID;
    private String model;
    private int capacity;
    private String manufacturer;
    private LocalDate lastMaintenanceDate;

    public Aircraft() {}

    public Aircraft(int aircraftID, String model, int capacity, String manufacturer, LocalDate lastMaintenanceDate) {
        this.aircraftID = aircraftID;
        this.model = model;
        this.capacity = capacity;
        this.manufacturer = manufacturer;
        this.lastMaintenanceDate = lastMaintenanceDate;
    }

    public int getAircraftID() { return aircraftID; }
    public void setAircraftID(int aircraftID) { this.aircraftID = aircraftID; }

    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }

    public int getCapacity() { return capacity; }
    public void setCapacity(int capacity) { this.capacity = capacity; }

    public String getManufacturer() { return manufacturer; }
    public void setManufacturer(String manufacturer) { this.manufacturer = manufacturer; }

    public LocalDate getLastMaintenanceDate() { return lastMaintenanceDate; }
    public void setLastMaintenanceDate(LocalDate lastMaintenanceDate) { this.lastMaintenanceDate = lastMaintenanceDate; }
}
