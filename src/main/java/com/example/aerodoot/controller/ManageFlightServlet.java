package com.example.aerodoot.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/manage-flight")
public class ManageFlightServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, Object>> flights = new ArrayList<>();

        // Create some dummy flight data
        Map<String, Object> flight1 = new HashMap<>();
        flight1.put("flightNumber", "AA1234");
        flight1.put("departureLocation", "New York (JFK)");
        flight1.put("arrivalLocation", "London (LHR)");
        flight1.put("departureTime", "2023-05-15 08:30");
        flight1.put("arrivalTime", "2023-05-15 20:45");
        flight1.put("status", "Scheduled");
        flight1.put("availableSeatsEconomy", 150);
        flight1.put("availableSeatsBusiness", 30);
        flight1.put("economyPrice", 500.00);
        flight1.put("businessPrice", 1500.00);

        Map<String, Object> flight2 = new HashMap<>();
        flight2.put("flightNumber", "BA5678");
        flight2.put("departureLocation", "London (LHR)");
        flight2.put("arrivalLocation", "Paris (CDG)");
        flight2.put("departureTime", "2023-05-15 10:15");
        flight2.put("arrivalTime", "2023-05-15 12:30");
        flight2.put("status", "In Air");
        flight2.put("availableSeatsEconomy", 100);
        flight2.put("availableSeatsBusiness", 20);
        flight2.put("economyPrice", 300.00);
        flight2.put("businessPrice", 1000.00);

        flights.add(flight1);
        flights.add(flight2);

        // Add the list to the request
        request.setAttribute("flights", flights);
        request.getRequestDispatcher("/WEB-INF/view/admin/manage-flights.jsp").forward(request, response);
    }
}
