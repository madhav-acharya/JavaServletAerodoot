package com.example.aerodoot.controller;

import com.example.aerodoot.dao.AircraftDAO;
import com.example.aerodoot.dao.AirlineDAO;
import com.example.aerodoot.dao.FlightDAO;
import com.example.aerodoot.model.Aircraft;
import com.example.aerodoot.model.Airline;
import com.example.aerodoot.model.Flight;
import com.example.aerodoot.service.FlightBookingService;
import com.example.aerodoot.util.FlashMessageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
public class FlightBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if(session.getAttribute("flights") != null) {
            List<Flight> flights = (List<Flight>) session.getAttribute("flights");
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

                // Get attributes from session
                String departureDate = (String) session.getAttribute("departureDate");
                String returnDate = (String) session.getAttribute("returnDate");
                String trip = (String) session.getAttribute("trip");
                String passenger = (String) session.getAttribute("passenger");

                request.setAttribute("flightLists", flights);
                request.setAttribute("aircraftMap", aircraftsMap);
                request.setAttribute("airlineMap", airlinesMap);
            }
        }

        //this is for in case there is not flight found
        int flightNumbers = 0; // default value
        if (session.getAttribute("flightNumbers") != null) {
            flightNumbers = (int) session.getAttribute("flightNumbers");
            System.out.println("flight num in get: " + flightNumbers);
            String departureLocation = (String) session.getAttribute("departureLocation");
            String arrivalLocation = (String) session.getAttribute("arrivalLocation");
            String departureDate = (String) session.getAttribute("departureDate");
        }
        System.out.println("checking flight Numbers: " + flightNumbers);

        System.out.println("get method of flight-booking");
        request.getRequestDispatcher("/WEB-INF/view/flightBooking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String departureLocation = request.getParameter("departure");
        String arrivalLocation = request.getParameter("destination");
        String departureDateStr = request.getParameter("departureDate");
        String returnDateStr = request.getParameter("returnDate");
        String passenger = request.getParameter("passenger");

        System.out.println("departureLocation: " + departureLocation);
        System.out.println("arrivalLocation: " + arrivalLocation);
        System.out.println("departureDateStr: " + departureDateStr);
        System.out.println("returnDateStr: " + returnDateStr);
        System.out.println("passenger: " + passenger);

        Date departureDate = null;
        Date returnDate = null;

        if (departureDateStr != null && !departureDateStr.trim().isEmpty()) {
            departureDate = FlightBookingService.convertDepartureDate(request, departureDateStr);
        }
        if (returnDateStr != null && !returnDateStr.trim().isEmpty()) {
            returnDate = FlightBookingService.convertReturnDate(request, returnDateStr);
        }

        List<Flight> flights = null;
        List<Flight> returnFlights = null;
        HttpSession session = request.getSession();

        if (returnDate != null) {
            try {
                flights = FlightDAO.getAllSearchFlights(departureLocation, arrivalLocation, departureDate);
                returnFlights = FlightDAO.getAllSearchFlights(arrivalLocation, departureLocation, returnDate);
                flights.addAll(returnFlights);
                session.setAttribute("departureDate", departureDateStr);
                session.setAttribute("returnDate", returnDateStr);
                session.setAttribute("trip", "Round Trip");
                session.setAttribute("passenger", passenger);
            } catch (SQLException e) {
                FlashMessageUtil.setError(request.getSession(), e.getMessage());
                throw new RuntimeException(e);
            }
        } else {
            try {
                session.setAttribute("departureDate", departureDateStr);
                session.setAttribute("returnDate", "0");
                session.setAttribute("trip", "One Way Trip");
                session.setAttribute("passenger", passenger);
                flights = FlightDAO.getAllSearchFlights(departureLocation, arrivalLocation, departureDate);
            } catch (SQLException e) {
                FlashMessageUtil.setError(request.getSession(), e.getMessage());
                throw new RuntimeException(e);
            }
        }

        //creating session to check if flights is available or not if not then to display the no flight found message
        session.setAttribute("flightNumbers", flights.size());
        session.setAttribute("departureLocation", departureLocation);
        session.setAttribute("arrivalLocation", arrivalLocation);
        session.setAttribute("flights", flights);
        System.out.println(flights.size());

        response.sendRedirect(request.getContextPath() + "/flight-booking");
    }
}
