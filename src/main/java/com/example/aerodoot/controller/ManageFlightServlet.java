package com.example.aerodoot.controller;

import com.example.aerodoot.dao.AircraftDAO;
import com.example.aerodoot.dao.AirlineDAO;
import com.example.aerodoot.dao.FlightDAO;
import com.example.aerodoot.model.Aircraft;
import com.example.aerodoot.model.Airline;
import com.example.aerodoot.model.Flight;
import com.example.aerodoot.util.FlashMessageUtil;
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
    private List<Aircraft> aircrafts;
    private List<Airline> airlines;

    @Override
    public void init() throws ServletException {
        System.out.println("FlightInitServlet: Initialization started...");
        try {
            flights = FlightDAO.getAllFlights();
            airlines = AirlineDAO.getAllAirlines();
            aircrafts = AircraftDAO.getAllAircraft();

            getServletContext().setAttribute("flights", flights);
            getServletContext().setAttribute("airlines", airlines);
            getServletContext().setAttribute("aircrafts", aircrafts);
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

        if ("add".equals(action)) {
            try {
                String flightNumber = request.getParameter("flightNumber");
                String departureLocation = request.getParameter("departureLocation");
                String arrivalLocation = request.getParameter("arrivalLocation");
                Date flightDate = Date.valueOf(request.getParameter("flightDate"));
                String departureTimeStr = request.getParameter("departureTime");
                if (departureTimeStr != null && departureTimeStr.length() == 5) {
                    departureTimeStr += ":00";
                }
                Time departureTime = Time.valueOf(departureTimeStr);

                String arrivalTimeStr = request.getParameter("arrivalTime");
                if (arrivalTimeStr != null && arrivalTimeStr.length() == 5) {
                    arrivalTimeStr += ":00";
                }
                Time arrivalTime = Time.valueOf(arrivalTimeStr);
                long millisDiff = arrivalTime.getTime() - departureTime.getTime();
                if (millisDiff < 0) {
                    millisDiff += 24 * 60 * 60 * 1000;
                }
                int duration = (int) (millisDiff / (1000 * 60));
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
                    FlashMessageUtil.setSuccess(request.getSession(), "Flight added successfully");
                    flights = FlightDAO.getAllFlights();
                    getServletContext().setAttribute("flights", flights);
                    request.setAttribute("message", "Flight created successfully!");
                    response.sendRedirect(request.getContextPath() + "/admin/manage-flight");
                    return;
                } else {
                    FlashMessageUtil.setError(request.getSession(), "Error creating flight");
                    request.setAttribute("message", "Error creating flight.");
                }

            } catch (Exception e) {
                FlashMessageUtil.setError(request.getSession(), e.getMessage());
                request.setAttribute("message", "Error creating flight: " + e.getMessage());
                throw new ServletException("Failed to create flight", e);
            }
        }
        else if ("update".equals(action)) {
            try {
                System.out.println("id here " + request.getParameter("flightId"));
                int flightId = Integer.parseInt(request.getParameter("flightId"));
                String flightNumber = request.getParameter("flightNumber");
                String departureLocation = request.getParameter("departureLocation");
                String arrivalLocation = request.getParameter("arrivalLocation");
                Date flightDate = Date.valueOf(request.getParameter("flightDate"));
                String departureTimeStr = request.getParameter("departureTime");
                if (departureTimeStr != null && departureTimeStr.length() == 5) {
                    departureTimeStr += ":00";
                }
                Time departureTime = Time.valueOf(departureTimeStr);

                String arrivalTimeStr = request.getParameter("arrivalTime");
                if (arrivalTimeStr != null && arrivalTimeStr.length() == 5) {
                    arrivalTimeStr += ":00";
                }
                Time arrivalTime = Time.valueOf(arrivalTimeStr);
                long millisDiff = arrivalTime.getTime() - departureTime.getTime();
                if (millisDiff < 0) {
                    millisDiff += 24 * 60 * 60 * 1000;
                }
                int duration = (int) (millisDiff / (1000 * 60));
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
                System.out.println("updated flight id: " + updatedFlightId);

                if (updatedFlightId >= 0) {
                    FlashMessageUtil.setSuccess(request.getSession(), "Flight updated successfully");
                    flights = FlightDAO.getAllFlights();
                    System.out.println("flight updated sucessfully");
                    getServletContext().setAttribute("flights", flights);
                    request.setAttribute("message", "Flight updated successfully!");
                    response.sendRedirect(request.getContextPath() + "/admin/manage-flight");
                    return;
                } else {
                    FlashMessageUtil.setError(request.getSession(), "Error updating flight");
                    System.out.println("flight update failed");
                    request.setAttribute("message", "Error updating flight.");
                }

            } catch (Exception e) {
                FlashMessageUtil.setError(request.getSession(), e.getMessage());
                System.out.println("Exception occurred while updating flight: " + e.getMessage());
                request.setAttribute("message", "Error updating flight: " + e.getMessage());
                throw new ServletException("Failed to update flight", e);
            }
        }
        else if ("delete".equals(action)) {
            try {
                int flightId = Integer.parseInt(request.getParameter("flightId"));
                boolean success = FlightDAO.deleteFlight(flightId);
                System.out.println("deleted flight id: " + flightId + success);
                if (success) {
                    FlashMessageUtil.setSuccess(request.getSession(), "Flight deleted successfully");
                    flights = FlightDAO.getAllFlights();
                    getServletContext().setAttribute("flights", flights);
                    request.setAttribute("message", "Flight deleted successfully!");
                    response.sendRedirect(request.getContextPath() + "/admin/manage-flight");
                    return;
                } else {
                    FlashMessageUtil.setError(request.getSession(), "Error deleting flight");
                    request.setAttribute("message", "Error deleting flight.");
                }
            } catch (Exception e) {
                FlashMessageUtil.setError(request.getSession(), e.getMessage());
                request.setAttribute("message", "Error deleting flight: " + e.getMessage());
                throw new ServletException("Failed to delete flight", e);
            }
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manage-flights.jsp").forward(request, response);
    }
}
