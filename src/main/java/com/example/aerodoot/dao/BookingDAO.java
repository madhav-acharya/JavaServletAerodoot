package com.example.aerodoot.dao;

import com.example.aerodoot.model.Booking;
import com.example.aerodoot.util.DbConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookingDAO {
    public static int createBooking(Booking booking) throws SQLException {
        String sql = "INSERT INTO Booking (bookingDate, classType, seatsBooked, seatNumbers, totalPrice, bookingStatus, flightId, passengerId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setTimestamp(1, booking.getBookingDate());
            ps.setString(2, booking.getClassType());
            ps.setInt(3, booking.getSeatsBooked());
            ps.setString(4, booking.getSeatNumbers());
            ps.setBigDecimal(5, booking.getTotalPrice());
            ps.setString(6, booking.getBookingStatus());
            ps.setInt(7, booking.getFlightId());
            ps.setInt(8, booking.getPassengerId());

            int rowsExecuted = ps.executeUpdate();
            if (rowsExecuted > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1); // Return generated bookingId
                }
            }
        } catch (SQLException e) {
            System.err.println("Error creating booking: " + e.getMessage());
        }
        return -1;
    }
}
