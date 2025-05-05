package com.example.aerodoot.controller;

import com.example.aerodoot.dao.AircraftDAO;
import com.example.aerodoot.dao.AirlineDAO;
import com.example.aerodoot.dao.FlightDAO;
import com.example.aerodoot.model.Aircraft;
import com.example.aerodoot.model.Airline;
import com.example.aerodoot.model.Flight;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@WebServlet("/flight-booking")
public class flightBookingServlet extends HttpServlet {
    List<Flight> flights = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (flights != null) {
            List<Aircraft> aircrafts;
            List<Airline> airlines;

            try {
                aircrafts = AircraftDAO.getAllAircraft();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            try {
                airlines = AirlineDAO.getAllAirlines();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            //creating the map of airlines and aircrafts
            Map<Integer, String> airlinesMap = new HashMap<>();
            for (Airline airline: airlines) {
                airlinesMap.put(airline.getAirlineId(), airline.getName());
            }

            Map<Integer, String> aircraftsMap = new HashMap<>();
            for (Aircraft aircraft: aircrafts) {
                aircraftsMap.put(aircraft.getAircraftId(), aircraft.getModel());
            }

            //printing the aircrafts and airlines
            for (int key: aircraftsMap.keySet()) {
                System.out.println(key + " -> " + aircraftsMap.get(key));
            }

            for (int key: airlinesMap.keySet()) {
                System.out.println(key + " -> " + airlinesMap.get(key));
            }

            for (int i=0; i < flights.size(); i++) {
                // Get the current Flight object
                Flight flight = flights.get(i);
                System.out.println("Aircraft for flights: " + aircraftsMap.get(flight.getAircraftId()) + ", Airlines: " + airlinesMap.get(flight.getAirlineId()));
            }

            request.setAttribute("flightLists", flights);
            request.setAttribute("aircraftMap", aircraftsMap);
            request.setAttribute("airlineMap", airlinesMap);
        }

        System.out.println("get method of flight-booking");
        request.getRequestDispatcher("/WEB-INF/view/flightBooking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String departureLocation = request.getParameter("departure");
        String arrivalLocation = request.getParameter("destination");
        String departureDateStr = request.getParameter("departureDate");
        String returnDate = request.getParameter("returnDate");
        String passenger = request.getParameter("passenger");

        Date departureDate = null;
        if (departureDateStr != null && !departureDateStr.trim().isEmpty()) {
            try {
                // Remove ordinal suffixes (st, nd, rd, th)
                departureDateStr = departureDateStr.replaceAll("(\\d+)(st|nd|rd|th)", "$1");

                // Format of the date string coming from JSP (e.g., "May 5th, 2025" -> "May 5, 2025")
                SimpleDateFormat sdf = new SimpleDateFormat("MMM d, yyyy", Locale.ENGLISH);
                java.util.Date utilDate = sdf.parse(departureDateStr);
                departureDate = new java.sql.Date(utilDate.getTime());
            } catch (ParseException e) {
                e.printStackTrace();
                System.out.println("Error parsing date: " + departureDateStr);
                // Optionally, add an error message or take appropriate action
            }

        }
            System.out.println(departureDate);


            try {
                flights = FlightDAO.getAllSearchFlights(departureLocation, arrivalLocation, departureDate);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            for (int i=0; i < flights.size(); i++) {
                // Get the current Flight object
                Flight flight = flights.get(i);

                // Print the details of the flight
                System.out.println("Flight " + (i + 1) + ":");
                System.out.println("Flight ID: " + flight.getFlightId());
                System.out.println("Flight Number: " + flight.getFlightNumber());
                System.out.println("Departure Location: " + flight.getDepartureLocation());
                System.out.println("Arrival Location: " + flight.getArrivalLocation());
                System.out.println("Flight Date: " + flight.getFlightDate());
                System.out.println("Departure Time: " + flight.getDepartureTime());
                System.out.println("Arrival Time: " + flight.getArrivalTime());
                System.out.println("Duration: " + flight.getDuration() + " minutes");
                System.out.println("Status: " + flight.getStatus());
                System.out.println("Available Economy Seats: " + flight.getAvailableSeatsEconomy());
                System.out.println("Available Business Seats: " + flight.getAvailableSeatsBusiness());
                System.out.println("Economy Price: " + flight.getEconomyPrice());
                System.out.println("Business Price: " + flight.getBusinessPrice());
                System.out.println("Aircraft ID: " + flight.getAircraftId());
                System.out.println("Airline ID: " + flight.getAirlineId());
                System.out.println();
            }

            System.out.println(departureDateStr + " -> " + departureLocation + " " + returnDate + " -> " + arrivalLocation + " " + passenger);

        response.sendRedirect(request.getContextPath() + "/flight-booking");
    }
}


