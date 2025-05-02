package com.example.aerodoot.dao;

import com.example.aerodoot.dto.PassengerDashboardData;
import com.example.aerodoot.model.Passenger;
import com.example.aerodoot.model.User;
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

    public static Passenger getPassengerByUserId(int userId) throws SQLException {
        String sql = "SELECT * FROM Passenger WHERE userId = ?";

        try (Connection con = DbConnectionUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Passenger passenger = new Passenger();
                passenger.setPassengerId(rs.getInt("passengerId"));
                passenger.setPassportNumber(rs.getString("passportNumber"));
                passenger.setDateOfBirth(rs.getDate("dateOfBirth"));
                passenger.setGender(rs.getString("gender"));
                passenger.setAddress(rs.getString("address"));
                passenger.setProfilePicture(rs.getBytes("profilePicture"));
                passenger.setUserId(rs.getInt("userId"));
                return passenger;
            } else {
                return null; // No passenger found for given userId
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static PassengerDashboardData getPassengerDataByUserId(int userId) throws SQLException {
        User user = UserDAO.getUserByUserIdOnly(userId);
        Passenger passenger = getPassengerByUserId(userId);

        return new PassengerDashboardData(user, passenger);
    }

    public static int PassengerUpdataData(Passenger passenger) throws SQLException {
        String sql = "UPDATE Passenger SET passportNumber = ?, dateOfBirth = ?, gender = ?, address = ?, profilePicture = ? WHERE userId = ?";

        try (Connection con = DbConnectionUtil.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, passenger.getPassportNumber());
            stmt.setDate(2, new java.sql.Date(passenger.getDateOfBirth().getTime()));
            stmt.setString(3, passenger.getGender());
            stmt.setString(4, passenger.getAddress());
            stmt.setBytes(5, passenger.getProfilePicture());
            stmt.setInt(6, passenger.getUserId());

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                return 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  -17;
    }
}
