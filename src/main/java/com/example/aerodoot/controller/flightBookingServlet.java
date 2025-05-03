package com.example.aerodoot.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/flight-booking")
public class flightBookingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("get method of flight-booking");
        request.getRequestDispatcher("/WEB-INF/view/flightBooking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String departureLocation = request.getParameter("departure");
        String arrivalLocation = request.getParameter("destination");
        String departureDate = request.getParameter("departureDate");
        String returnDate = request.getParameter("returnDate");
        String passenger = request.getParameter("passenger");

        System.out.println(departureDate + " -> " + departureLocation + " " + returnDate + " -> " + arrivalLocation + " " + passenger);

        request.getRequestDispatcher("/WEB-INF/view/flightBooking.jsp").forward(request, response);
    }
}


