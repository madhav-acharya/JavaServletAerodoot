package com.example.aerodoot.dao;

import com.example.aerodoot.model.Passenger;
import com.example.aerodoot.util.DbConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PassengerDAO {
    public static int createPassenger(Passenger passenger) {
        String sql = "INSERT INTO Passenger (passportNumber, dateOfBirth, gender, address, profilePicture, userId) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DbConnectionUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, passenger.getPassportNumber());
            ps.setDate(2, new java.sql.Date(passenger.getDateOfBirth().getTime()));
            ps.setString(3, passenger.getGender());
            ps.setString(4, passenger.getAddress());
            ps.setBytes(5, passenger.getProfilePicture());
            ps.setInt(6, passenger.getUserId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }
}
