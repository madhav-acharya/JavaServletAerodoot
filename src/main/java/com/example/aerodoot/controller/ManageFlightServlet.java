package com.example.aerodoot.controller;

import com.example.aerodoot.dao.FlightDAO;
import com.example.aerodoot.model.Flight;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

@WebServlet("/admin/manage-flight")
public class ManageFlightServlet extends HttpServlet {
    private List<Flight> flights;

    @Override
    public void init() throws ServletException {
        System.out.println("FlightInitServlet: Initialization started...");
        try {
            flights = FlightDAO.getAllFlights();
            getServletContext().setAttribute("flights", flights);
            System.out.println("Flights loaded successfully.");
        } catch (Exception e) {
            throw new ServletException("Flight initialization failed", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/admin/manage-flights.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            try {
                String flightNumber = request.getParameter("flightNumber");
                String departureLocation = request.getParameter("departureLocation");
                String arrivalLocation = request.getParameter("arrivalLocation");
                Date flightDate = Date.valueOf(request.getParameter("flightDate"));
                Time departureTime = Time.valueOf(request.getParameter("departureTime"));
                Time arrivalTime = Time.valueOf(request.getParameter("arrivalTime"));
                int duration = Integer.parseInt(request.getParameter("duration"));
                String status = request.getParameter("status");
                int availableSeatsEconomy = Integer.parseInt(request.getParameter("availableSeatsEconomy"));
                int availableSeatsBusiness = Integer.parseInt(request.getParameter("availableSeatsBusiness"));
                double economyPrice = Double.parseDouble(request.getParameter("economyPrice"));
                double businessPrice = Double.parseDouble(request.getParameter("businessPrice"));
                int aircraftId = Integer.parseInt(request.getParameter("aircraftId"));
                int airlineId = Integer.parseInt(request.getParameter("airlineId"));

                Flight flight = new Flight();
                flight.setFlightNumber(flightNumber);
                flight.setDepartureLocation(departureLocation);
                flight.setArrivalLocation(arrivalLocation);
                flight.setFlightDate(flightDate);
                flight.setDepartureTime(departureTime);
                flight.setArrivalTime(arrivalTime);
                flight.setDuration(duration);
                flight.setStatus(status);
                flight.setAvailableSeatsEconomy(availableSeatsEconomy);
                flight.setAvailableSeatsBusiness(availableSeatsBusiness);
                flight.setEconomyPrice(economyPrice);
                flight.setBusinessPrice(businessPrice);
                flight.setAircraftId(aircraftId);
                flight.setAirlineId(airlineId);

                int createdFlightId = FlightDAO.createFlight(flight);

                if (createdFlightId > 0) {
                    List<Flight> flights = FlightDAO.getAllFlights();
                    request.setAttribute("flights", flights);
                    request.setAttribute("message", "Flight created successfully!");
                } else {
                    request.setAttribute("message", "Error creating flight.");
                }

            } catch (Exception e) {
                request.setAttribute("message", "Error creating flight: " + e.getMessage());
                throw new ServletException("Failed to create flight", e);
            }
        }
        else if ("update".equals(action)) {
            try {
                int flightId = Integer.parseInt(request.getParameter("flightId"));
                String flightNumber = request.getParameter("flightNumber");
                String departureLocation = request.getParameter("departureLocation");
                String arrivalLocation = request.getParameter("arrivalLocation");
                Date flightDate = Date.valueOf(request.getParameter("flightDate"));
                Time departureTime = Time.valueOf(request.getParameter("departureTime"));
                Time arrivalTime = Time.valueOf(request.getParameter("arrivalTime"));
                int duration = Integer.parseInt(request.getParameter("duration"));
                String status = request.getParameter("status");
                int availableSeatsEconomy = Integer.parseInt(request.getParameter("availableSeatsEconomy"));
                int availableSeatsBusiness = Integer.parseInt(request.getParameter("availableSeatsBusiness"));
                double economyPrice = Double.parseDouble(request.getParameter("economyPrice"));
                double businessPrice = Double.parseDouble(request.getParameter("businessPrice"));
                int aircraftId = Integer.parseInt(request.getParameter("aircraftId"));
                int airlineId = Integer.parseInt(request.getParameter("airlineId"));

                Flight flight = new Flight();
                flight.setFlightId(flightId);
                flight.setFlightNumber(flightNumber);
                flight.setDepartureLocation(departureLocation);
                flight.setArrivalLocation(arrivalLocation);
                flight.setFlightDate(flightDate);
                flight.setDepartureTime(departureTime);
                flight.setArrivalTime(arrivalTime);
                flight.setDuration(duration);
                flight.setStatus(status);
                flight.setAvailableSeatsEconomy(availableSeatsEconomy);
                flight.setAvailableSeatsBusiness(availableSeatsBusiness);
                flight.setEconomyPrice(economyPrice);
                flight.setBusinessPrice(businessPrice);
                flight.setAircraftId(aircraftId);
                flight.setAirlineId(airlineId);

                int updatedFlightId = FlightDAO.updateFlight(flight);

                if (updatedFlightId > 0) {
                    List<Flight> flights = FlightDAO.getAllFlights();
                    request.setAttribute("flights", flights);
                    request.setAttribute("message", "Flight updated successfully!");
                } else {
                    request.setAttribute("message", "Error updating flight.");
                }

            } catch (Exception e) {
                request.setAttribute("message", "Error updating flight: " + e.getMessage());
                throw new ServletException("Failed to update flight", e);
            }
        }
        else if ("delete".equals(action)) {
            try {
                int flightId = Integer.parseInt(request.getParameter("flightId"));
                boolean success = FlightDAO.deleteFlight(flightId);
                if (success) {
                    List<Flight> flights = FlightDAO.getAllFlights();
                    request.setAttribute("flights", flights);
                    request.setAttribute("message", "Flight deleted successfully!");
                } else {
                    request.setAttribute("message", "Error deleting flight.");
                }
            } catch (Exception e) {
                request.setAttribute("message", "Error deleting flight: " + e.getMessage());
                throw new ServletException("Failed to delete flight", e);
            }
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manage-flight.jsp").forward(request, response);
    }
}
