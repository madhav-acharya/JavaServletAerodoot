package com.example.aerodoot.dao;

import com.example.aerodoot.model.Booking;
import com.example.aerodoot.util.DbConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    public static int createBooking(Booking booking) throws SQLException {
        String sql = "INSERT INTO Booking ( classType, seatsBooked, totalPrice, bookingStatus, flightId, passengerId) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, booking.getClassType());
            ps.setInt(2, booking.getSeatsBooked());
            ps.setBigDecimal(3, booking.getTotalPrice());
            ps.setString(4, booking.getBookingStatus());
            ps.setInt(5, booking.getFlightId());
            ps.setInt(6, booking.getPassengerId());

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

    public static Booking getBookingById(int bookingId) throws SQLException {
        String sql = "SELECT * FROM Booking WHERE bookingId = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bookingId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("bookingId"));
                booking.setBookingDate(rs.getTimestamp("bookingDate"));
                booking.setClassType(rs.getString("classType"));
                booking.setSeatsBooked(rs.getInt("seatsBooked"));
                booking.setTotalPrice(rs.getBigDecimal("totalPrice"));
                booking.setBookingStatus(rs.getString("bookingStatus"));
                booking.setFlightId(rs.getInt("flightId"));
                booking.setPassengerId(rs.getInt("passengerId"));
                return booking;
            }
        } catch (SQLException e) {
            System.err.println("Error fetching booking by ID: " + e.getMessage());
        }
        return null;
    }

    public static List<Booking> getAllBookings() throws SQLException {
        List<Booking> bookingList = new ArrayList<>();
        String sql = "SELECT * FROM Booking";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("bookingId"));
                booking.setBookingDate(rs.getTimestamp("bookingDate"));
                booking.setClassType(rs.getString("classType"));
                booking.setSeatsBooked(rs.getInt("seatsBooked"));
                booking.setTotalPrice(rs.getBigDecimal("totalPrice"));
                booking.setBookingStatus(rs.getString("bookingStatus"));
                booking.setFlightId(rs.getInt("flightId"));
                booking.setPassengerId(rs.getInt("passengerId"));
                bookingList.add(booking);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching all bookings: " + e.getMessage());
        }
        return bookingList;
    }

    public static int updateBooking(Booking booking) throws SQLException {
        String sql = "UPDATE Booking SET bookingDate = ?, classType = ?, seatsBooked = ?, totalPrice = ?, bookingStatus = ?, flightId = ?, passengerId = ? WHERE bookingId = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setTimestamp(1, booking.getBookingDate());
            ps.setString(2, booking.getClassType());
            ps.setInt(3, booking.getSeatsBooked());
            ps.setBigDecimal(4, booking.getTotalPrice());
            ps.setString(5, booking.getBookingStatus());
            ps.setInt(6, booking.getFlightId());
            ps.setInt(7, booking.getPassengerId());
            ps.setInt(8, booking.getBookingId());

            int updatedRows = ps.executeUpdate();
            if (updatedRows > 0) {
                return 0;
            }
        } catch (SQLException e) {
            System.err.println("Error updating booking: " + e.getMessage());
        }
        return -1;
    }

    public static int updateBookingStatus(int bookingId, String bookingStatus) throws SQLException {
        String sql = "UPDATE Booking SET bookingStatus = ? WHERE bookingId = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, bookingStatus);
            ps.setInt(2, bookingId);

            int updatedRows = ps.executeUpdate();
            if (updatedRows > 0) {
                return 0;
            }
        } catch (SQLException e) {
            System.err.println("Error updating booking status: " + e.getMessage());
        }
        return -1;
    }

    public static boolean deleteBooking(int bookingId) {
        String sql = "DELETE FROM Booking WHERE bookingId = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bookingId);
            int rowsDeleted = ps.executeUpdate();
            System.out.println("Booking deleted");
            return rowsDeleted > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting booking: " + e.getMessage());
            return false;
        }
    }
}
