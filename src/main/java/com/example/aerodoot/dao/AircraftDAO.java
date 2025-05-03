package com.example.aerodoot.dao;

import com.example.aerodoot.model.Aircraft;
import com.example.aerodoot.util.DbConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AircraftDAO {
    public static int createAircraft(Aircraft aircraft) throws SQLException {
        String sql = "INSERT INTO Aircraft (model, manufacturer, seatCapacityEconomy, seatCapacityBusiness, lastMaintenanceDate, airlineId) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, aircraft.getModel());
            ps.setString(2, aircraft.getManufacturer());
            ps.setInt(3, aircraft.getSeatCapacityEconomy());
            ps.setInt(4, aircraft.getSeatCapacityBusiness());
            ps.setDate(5, aircraft.getLastMaintenanceDate());
            ps.setInt(6, aircraft.getAirlineId());

            int rowsExecuted = ps.executeUpdate();
            if (rowsExecuted > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1); // Return generated aircraftId
                }
            }
        } catch (SQLException e) {
            System.err.println("Error creating aircraft: " + e.getMessage());
        }
        return -1;
    }
    public static Aircraft getAircraftById(int aircraftId) throws SQLException {
        String sql = "SELECT * FROM Aircraft WHERE aircraftId = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, aircraftId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Aircraft aircraft = new Aircraft();
                aircraft.setAircraftId(rs.getInt("aircraftId"));
                aircraft.setModel(rs.getString("model"));
                aircraft.setManufacturer(rs.getString("manufacturer"));
                aircraft.setSeatCapacityEconomy(rs.getInt("seatCapacityEconomy"));
                aircraft.setSeatCapacityBusiness(rs.getInt("seatCapacityBusiness"));
                aircraft.setLastMaintenanceDate(rs.getDate("lastMaintenanceDate"));
                aircraft.setAirlineId(rs.getInt("airlineId"));
                return aircraft;
            }
        } catch (SQLException e) {
            System.err.println("Error fetching aircraft by ID: " + e.getMessage());
        }
        return null;
    }


}
