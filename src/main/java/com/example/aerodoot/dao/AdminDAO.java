package com.example.aerodoot.dao;

import com.example.aerodoot.model.Booking;
import com.example.aerodoot.util.DbConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {
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
        String query = "SELECT SUM(totalPrice) AS total_revenue FROM Booking WHERE bookingStatus = 'COMPLETED'";
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

    // Data Transfer Object for Booking Trends
    public static class BookingTrend {
        private String date;
        private int count;

        public BookingTrend(String date, int count) {
            this.date = date;
            this.count = count;
        }

        public String getDate() {
            return date;
        }

        public int getCount() {
            return count;
        }
    }

    // Data Transfer Object for Flight Distribution
    public static class FlightDistribution {
        private String location;
        private int count;

        public FlightDistribution(String location, int count) {
            this.location = location;
            this.count = count;
        }

        public String getLocation() {
            return location;
        }

        public int getCount() {
            return count;
        }
    }
}
