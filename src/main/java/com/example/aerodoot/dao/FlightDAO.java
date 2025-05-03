package com.example.aerodoot.dao;

import com.example.aerodoot.model.Flight;
import com.example.aerodoot.util.DbConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FlightDAO {
    public static int createFlight(Flight flight) throws SQLException {
        String sql = "INSERT INTO Flight (flightNumber, departureLocation, arrivalLocation, departureTime, arrivalTime, duration, status, availableSeatsEconomy, availableSeatsBusiness, economyPrice, businessPrice, aircraftId, airlineId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, flight.getFlightNumber());
            ps.setString(2, flight.getDepartureLocation());
            ps.setString(3, flight.getArrivalLocation());
            ps.setTimestamp(4, flight.getDepartureTime());
            ps.setTimestamp(5, flight.getArrivalTime());
            ps.setTime(6, flight.getDuration());
            ps.setString(7, flight.getStatus());
            ps.setInt(8, flight.getAvailableSeatsEconomy());
            ps.setInt(9, flight.getAvailableSeatsBusiness());
            ps.setBigDecimal(10, flight.getEconomyPrice());
            ps.setBigDecimal(11, flight.getBusinessPrice());
            ps.setInt(12, flight.getAircraftId());
            ps.setInt(13, flight.getAirlineId());

            int rowsExecuted = ps.executeUpdate();
            if (rowsExecuted > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1); // Return generated flightId
                }
            }
        } catch (SQLException e) {
            System.err.println("Error creating flight: " + e.getMessage());
        }
        return -1;
    }

    public static Flight getFlightById(int flightId) throws SQLException {
        String sql = "SELECT * FROM Flight WHERE flightId = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, flightId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Flight flight = new Flight();
                flight.setFlightId(rs.getInt("flightId"));
                flight.setFlightNumber(rs.getString("flightNumber"));
                flight.setDepartureLocation(rs.getString("departureLocation"));
                flight.setArrivalLocation(rs.getString("arrivalLocation"));
                flight.setDepartureTime(rs.getTimestamp("departureTime"));
                flight.setArrivalTime(rs.getTimestamp("arrivalTime"));
                flight.setDuration(rs.getTime("duration"));
                flight.setStatus(rs.getString("status"));
                flight.setAvailableSeatsEconomy(rs.getInt("availableSeatsEconomy"));
                flight.setAvailableSeatsBusiness(rs.getInt("availableSeatsBusiness"));
                flight.setEconomyPrice(rs.getBigDecimal("economyPrice"));
                flight.setBusinessPrice(rs.getBigDecimal("businessPrice"));
                flight.setAircraftId(rs.getInt("aircraftId"));
                flight.setAirlineId(rs.getInt("airlineId"));
                return flight;
            }
        } catch (SQLException e) {
            System.err.println("Error fetching flight by ID: " + e.getMessage());
        }
        return null;
    }
    public static List<Flight> getAllFlights() throws SQLException {
        List<Flight> flightList = new ArrayList<>();
        String sql = "SELECT * FROM Flight";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Flight flight = new Flight();
                flight.setFlightId(rs.getInt("flightId"));
                flight.setFlightNumber(rs.getString("flightNumber"));
                flight.setDepartureLocation(rs.getString("departureLocation"));
                flight.setArrivalLocation(rs.getString("arrivalLocation"));
                flight.setDepartureTime(rs.getTimestamp("departureTime"));
                flight.setArrivalTime(rs.getTimestamp("arrivalTime"));
                flight.setDuration(rs.getTime("duration"));
                flight.setStatus(rs.getString("status"));
                flight.setAvailableSeatsEconomy(rs.getInt("availableSeatsEconomy"));
                flight.setAvailableSeatsBusiness(rs.getInt("availableSeatsBusiness"));
                flight.setEconomyPrice(rs.getBigDecimal("economyPrice"));
                flight.setBusinessPrice(rs.getBigDecimal("businessPrice"));
                flight.setAircraftId(rs.getInt("aircraftId"));
                flight.setAirlineId(rs.getInt("airlineId"));
                flightList.add(flight);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching all flights: " + e.getMessage());
        }
        return flightList;
    }

}
