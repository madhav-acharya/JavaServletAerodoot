package com.example.aerodoot.controller;

import com.example.aerodoot.dao.*;
import com.example.aerodoot.model.Flight;
import com.example.aerodoot.model.Passenger;
import com.example.aerodoot.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/agent/booking")
public class AgentBookingServlet extends HttpServlet {
    private List<Flight> flights;
    private List<User> passengers;

    @Override
    public void init() throws ServletException {
        System.out.println("FlightInitServlet: Initialization started...");
        try {
            flights = FlightDAO.getAllFlights();
            passengers = UserDAO.getPassengerUsers();

            getServletContext().setAttribute("flights", flights);
            getServletContext().setAttribute("passengers", passengers);
            System.out.println("Flights loaded successfully.");
        } catch (Exception e) {
            throw new ServletException("Flight initialization failed", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("flights", flights);
        request.setAttribute("passengers", passengers);
        request.getRequestDispatcher("/WEB-INF/view/agent/agentBooking.jsp").forward(request, response);
    }
}
