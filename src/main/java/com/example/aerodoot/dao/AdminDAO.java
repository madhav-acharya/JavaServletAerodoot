package com.example.aerodoot.dao;

import com.example.aerodoot.dto.BookingAnalysisByClass;
import com.example.aerodoot.dto.BookingTrend;
import com.example.aerodoot.dto.FlightDistribution;
import com.example.aerodoot.dto.RevenueByRoute;
import com.example.aerodoot.model.Admin;
import com.example.aerodoot.util.DbConnectionUtil;
import com.mysql.cj.jdbc.JdbcConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    public static int createAdmin(Admin admin) {
        String sql = "INSERT INTO Admin (adminRole, userId) VALUES (?, ?)";

        try (Connection con = DbConnectionUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)
        ) {
            ps.setString(1, admin.getAdminRole()); // Should be "SUPER_ADMIN" or "ADMIN"
            ps.setInt(2, admin.getUserId());

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1); // returns auto-generated adminId
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error creating admin: " + e.getMessage());
        }
        return -1; // return -1 if creation fails
    }

    // Method to get total flights
    public int getTotalFlights() throws SQLException {
        String query = "SELECT COUNT(*) AS total_flights FROM Flight";
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("total_flights");
            }
        }
        return 0;
    }

    // Method to get active bookings
    public int getActiveBookings() throws SQLException {
        String query = "SELECT COUNT(*) AS active_bookings FROM Booking WHERE bookingStatus IN ('PENDING', 'CONFIRMED')";
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("active_bookings");
            }
        }
        return 0;
    }

    // Method to get total revenue
    public double getTotalRevenue() throws SQLException {
        String query = "SELECT SUM(totalPrice) AS total_revenue FROM Booking WHERE bookingStatus IN ('CONFIRMED', 'COMPLETED')";
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getDouble("total_revenue");
            }
        }
        return 0.0;
    }

    // Method to get total passengers
    public int getTotalPassengers() throws SQLException {
        String query = "SELECT COUNT(*) AS total_passengers FROM Passenger";
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("total_passengers");
            }
        }
        return 0;
    }

    // Method to get booking trends (last 30 days)
    public List<BookingTrend> getBookingTrends() throws SQLException {
        String query = "SELECT DATE(bookingDate) AS booking_day, COUNT(*) AS booking_count FROM Booking WHERE bookingDate > CURDATE() - INTERVAL 30 DAY GROUP BY booking_day";
        List<BookingTrend> bookingTrends = new ArrayList<>();
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                BookingTrend trend = new BookingTrend(rs.getString("booking_day"), rs.getInt("booking_count"));
                bookingTrends.add(trend);
            }
        }
        return bookingTrends;
    }

    // Method to get flight distribution (by location)
    public List<FlightDistribution> getFlightDistribution() throws SQLException {
        String query = "SELECT departureLocation, COUNT(*) AS flights_count FROM Flight GROUP BY departureLocation";
        List<FlightDistribution> flightDistributions = new ArrayList<>();
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                FlightDistribution distribution = new FlightDistribution(rs.getString("departureLocation"), rs.getInt("flights_count"));
                flightDistributions.add(distribution);
            }
        }
        return flightDistributions;
    }

    public List<BookingAnalysisByClass> getBookingAnalysisByClass() throws SQLException {
        String query = "SELECT classType, EXTRACT(MONTH FROM bookingDate) AS month, COUNT(*) AS booking_count " +
                "FROM Booking " +
                "GROUP BY classType, EXTRACT(MONTH FROM bookingDate) " +
                "ORDER BY month";
        List<BookingAnalysisByClass> bookingAnalysis = new ArrayList<>();
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                BookingAnalysisByClass analysis = new BookingAnalysisByClass(
                        rs.getString("classType"),
                        rs.getInt("booking_count"),
                        rs.getInt("month")  // Add the month info to the DTO
                );
                bookingAnalysis.add(analysis);
            }
        }
        return bookingAnalysis;
    }

    // Method for Revenue by Route (source-destination)
    public List<RevenueByRoute> getRevenueByRoute() throws SQLException {
        String query = "SELECT departureLocation, arrivalLocation, SUM(totalPrice) AS total_revenue " +
                "FROM Booking JOIN Flight ON Booking.flightId = Flight.flightId " +
                "WHERE bookingStatus in ('CONFIRMED', 'COMPLETED')" +
                "GROUP BY departureLocation, arrivalLocation";
        List<RevenueByRoute> revenueByRoute = new ArrayList<>();
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                RevenueByRoute routeRevenue = new RevenueByRoute(
                        rs.getString("departureLocation"),
                        rs.getString("arrivalLocation"),
                        rs.getDouble("total_revenue"));
                revenueByRoute.add(routeRevenue);
            }
        }
        return revenueByRoute;
    }

}
