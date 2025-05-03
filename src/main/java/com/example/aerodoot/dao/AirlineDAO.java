package com.example.aerodoot.dao;

import com.example.aerodoot.model.Airline;
import com.example.aerodoot.util.DbConnectionUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AirlineDAO {
    public static int createAirline(Airline airline) throws SQLException {
        String sql = "INSERT INTO Airline (name, headquarters, contactNumber, email) VALUES (?, ?, ?, ?)";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, airline.getName());
            ps.setString(2, airline.getHeadquarters());
            ps.setString(3, airline.getContactNumber());
            ps.setString(4, airline.getEmail());

            int rowsExecuted = ps.executeUpdate();
            if (rowsExecuted > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1); // Return the generated airlineId
                }
            }
        } catch (SQLException e) {
            System.err.println("Error creating airline: " + e.getMessage());
        }
        return -1;
    }

    public static Airline getAirlineById(int airlineId) throws SQLException {
        String sql = "SELECT * FROM Airline WHERE airlineId = ?";
        Airline airline = null;

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, airlineId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                airline = new Airline();
                airline.setAirlineId(rs.getInt("airlineId"));
                airline.setName(rs.getString("name"));
                airline.setHeadquarters(rs.getString("headquarters"));
                airline.setContactNumber(rs.getString("contactNumber"));
                airline.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching airline by ID: " + e.getMessage());
        }
        return airline;
    }
    public static List<Airline> getAllAirlines() throws SQLException {
        List<Airline> airlines = new ArrayList<>();
        String sql = "SELECT * FROM Airline";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Airline airline = new Airline();
                airline.setAirlineId(rs.getInt("airlineId"));
                airline.setName(rs.getString("name"));
                airline.setHeadquarters(rs.getString("headquarters"));
                airline.setContactNumber(rs.getString("contactNumber"));
                airline.setEmail(rs.getString("email"));
                airlines.add(airline);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching airlines: " + e.getMessage());
        }
        return airlines;
    }
    public static int updateAirline(Airline airline) throws SQLException {
        String sql = "UPDATE Airline SET name = ?, headquarters = ?, contactNumber = ?, email = ? WHERE airlineId = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, airline.getName());
            ps.setString(2, airline.getHeadquarters());
            ps.setString(3, airline.getContactNumber());
            ps.setString(4, airline.getEmail());
            ps.setInt(5, airline.getAirlineId());

            int updatedRows = ps.executeUpdate();

            if (updatedRows > 0) {
                return 0;
            }

        } catch (SQLException e) {
            System.err.println("Error updating airline: " + e.getMessage());
        }
        return -1;
    }


}
