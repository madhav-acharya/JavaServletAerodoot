package com.example.aerodoot.dao;

import com.example.aerodoot.model.Airline;
import com.example.aerodoot.util.DbConnectionUtil;

import java.sql.*;

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

}
