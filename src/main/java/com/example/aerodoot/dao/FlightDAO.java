package com.example.aerodoot.dao;

import com.example.aerodoot.model.Flight;
import com.example.aerodoot.util.DbConnectionUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FlightDAO {
    public static int createFlight(Flight flight) throws SQLException {
        String sql = "INSERT INTO Flight (flightNumber, departureLocation, arrivalLocation, flightDate, departureTime, arrivalTime, duration, status, availableSeatsEconomy, availableSeatsBusiness, economyPrice, businessPrice, aircraftId, airlineId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, flight.getFlightNumber());
            ps.setString(2, flight.getDepartureLocation());
            ps.setString(3, flight.getArrivalLocation());
            ps.setDate(4, flight.getFlightDate());
            ps.setTime(5, flight.getDepartureTime());
            ps.setTime(6, flight.getArrivalTime());
            ps.setInt(7, flight.getDuration());
            ps.setString(8, flight.getStatus());
            ps.setInt(9, flight.getAvailableSeatsEconomy());
            ps.setInt(10, flight.getAvailableSeatsBusiness());
            ps.setDouble(11, flight.getEconomyPrice());
            ps.setDouble(12, flight.getBusinessPrice());
            ps.setInt(13, flight.getAircraftId());
            ps.setInt(14, flight.getAirlineId());

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
                flight.setFlightDate(rs.getDate("flightDate"));
                flight.setDepartureTime(rs.getTime("departureTime"));
                flight.setArrivalTime(rs.getTime("arrivalTime"));
                flight.setDuration(rs.getInt("duration"));
                flight.setStatus(rs.getString("status"));
                flight.setAvailableSeatsEconomy(rs.getInt("availableSeatsEconomy"));
                flight.setAvailableSeatsBusiness(rs.getInt("availableSeatsBusiness"));
                flight.setEconomyPrice(rs.getDouble("economyPrice"));
                flight.setBusinessPrice(rs.getDouble("businessPrice"));
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
                flight.setFlightDate(rs.getDate("flightDate"));
                flight.setDepartureTime(rs.getTime("departureTime"));
                flight.setArrivalTime(rs.getTime("arrivalTime"));
                flight.setDuration(rs.getInt("duration"));
                flight.setStatus(rs.getString("status"));
                flight.setAvailableSeatsEconomy(rs.getInt("availableSeatsEconomy"));
                flight.setAvailableSeatsBusiness(rs.getInt("availableSeatsBusiness"));
                flight.setEconomyPrice(rs.getDouble("economyPrice"));
                flight.setBusinessPrice(rs.getDouble("businessPrice"));
                flight.setAircraftId(rs.getInt("aircraftId"));
                flight.setAirlineId(rs.getInt("airlineId"));
                flightList.add(flight);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching all flights: " + e.getMessage());
        }
        return flightList;
    }
    public static int updateFlight(Flight flight) throws SQLException {
        String sql = "UPDATE Flight SET flightNumber = ?, departureLocation = ?, arrivalLocation = ?, flightDate = ?, departureTime = ?, arrivalTime = ?, duration = ?, status = ?, availableSeatsEconomy = ?, availableSeatsBusiness = ?, economyPrice = ?, businessPrice = ?, aircraftId = ?, airlineId = ? WHERE flightId = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, flight.getFlightNumber());
            ps.setString(2, flight.getDepartureLocation());
            ps.setString(3, flight.getArrivalLocation());
            ps.setDate(4, flight.getFlightDate());
            ps.setTime(5, flight.getDepartureTime());
            ps.setTime(6, flight.getArrivalTime());
            ps.setInt(7, flight.getDuration());
            ps.setString(8, flight.getStatus());
            ps.setInt(9, flight.getAvailableSeatsEconomy());
            ps.setInt(10, flight.getAvailableSeatsBusiness());
            ps.setDouble(11, flight.getEconomyPrice());
            ps.setDouble(12, flight.getBusinessPrice());
            ps.setInt(13, flight.getAircraftId());
            ps.setInt(14, flight.getAirlineId());
            ps.setInt(15, flight.getFlightId());

            int updatedRows = ps.executeUpdate();
            if (updatedRows > 0) {
                return 0;
            }
        } catch (SQLException e) {
            System.err.println("Error updating flight: " + e.getMessage());
        }
        return -1;
    }

    public static boolean deleteFlight(int flightId) {
        String sql = "DELETE FROM Flight WHERE flightId = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, flightId);
            int rowsDeleted = ps.executeUpdate();
            System.out.println("Flight deleted");
            return rowsDeleted > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting flight: " + e.getMessage());
            return false;
        }
    }

    public static List<Flight> getAllSearchFlights(String departureLocation, String arrivalLocation, Date flightDate) throws SQLException {
        List<Flight> flightList = new ArrayList<>();
        String sql = "SELECT * FROM Flight where departureLocation = ? and arrivalLocation = ? and flightDate = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setString(1, departureLocation);
             ps.setString(2, arrivalLocation);
             ps.setDate(3, flightDate);

             ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Flight flight = new Flight();
                flight.setFlightId(rs.getInt("flightId"));
                flight.setFlightNumber(rs.getString("flightNumber"));
                flight.setDepartureLocation(rs.getString("departureLocation"));
                flight.setArrivalLocation(rs.getString("arrivalLocation"));
                flight.setFlightDate(rs.getDate("flightDate"));
                flight.setDepartureTime(rs.getTime("departureTime"));
                flight.setArrivalTime(rs.getTime("arrivalTime"));
                flight.setDuration(rs.getInt("duration"));
                flight.setStatus(rs.getString("status"));
                flight.setAvailableSeatsEconomy(rs.getInt("availableSeatsEconomy"));
                flight.setAvailableSeatsBusiness(rs.getInt("availableSeatsBusiness"));
                flight.setEconomyPrice(rs.getDouble("economyPrice"));
                flight.setBusinessPrice(rs.getDouble("businessPrice"));
                flight.setAircraftId(rs.getInt("aircraftId"));
                flight.setAirlineId(rs.getInt("airlineId"));
                flightList.add(flight);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching all flights: " + e.getMessage());
        }
        return flightList;
    }

    public static Flight getFlightByFlightNumber(String flightNumber) throws SQLException {
        String sql = "SELECT * FROM Flight where flightNumber = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, flightNumber);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                Flight flight = new Flight();
                flight.setFlightId(rs.getInt("flightId"));
                flight.setFlightNumber(rs.getString("flightNumber"));
                flight.setDepartureLocation(rs.getString("departureLocation"));
                flight.setArrivalLocation(rs.getString("arrivalLocation"));
                flight.setFlightDate(rs.getDate("flightDate"));
                flight.setDepartureTime(rs.getTime("departureTime"));
                flight.setArrivalTime(rs.getTime("arrivalTime"));
                flight.setDuration(rs.getInt("duration"));
                flight.setStatus(rs.getString("status"));
                flight.setAvailableSeatsEconomy(rs.getInt("availableSeatsEconomy"));
                flight.setAvailableSeatsBusiness(rs.getInt("availableSeatsBusiness"));
                flight.setEconomyPrice(rs.getDouble("economyPrice"));
                flight.setBusinessPrice(rs.getDouble("businessPrice"));
                flight.setAircraftId(rs.getInt("aircraftId"));
                flight.setAirlineId(rs.getInt("airlineId"));

                return flight;
            }
        } catch (SQLException e) {
            System.err.println("Error getting flights from flightId: " + e.getMessage());
        }
        return null;
    }

    public static int updateFlightStatus(int flightId) throws SQLException {
        String sql = "UPDATE Flight SET status = ? WHERE flightId = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "LANDED");
            ps.setInt(2, flightId);


            int updatedRows = ps.executeUpdate();
            if (updatedRows > 0) {
                return 0;
            }
        } catch (SQLException e) {
            System.err.println("Error updating flight: " + e.getMessage());
        }
        return -1;
    }
}

