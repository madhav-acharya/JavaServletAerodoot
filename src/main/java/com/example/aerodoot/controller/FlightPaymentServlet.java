package com.example.aerodoot.controller;

import com.example.aerodoot.dao.PassengerDAO;
import com.example.aerodoot.model.Passenger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/payment")
public class FlightPaymentServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //classtype, numofseatbooks, totalprice, bookingStatus, flightId, passengerId, flightNumber
        String classType = request.getParameter("");
        String seatBooked = request.getParameter("");
        String totalPrice = request.getParameter("");
        String flightNumber = request.getParameter("");

        HttpSession session = request.getSession(false);
        int userId = (int) session.getAttribute("userId");
        System.out.println("userId in payment -> " + userId);

        Passenger passenger = null;
        try {
            passenger = PassengerDAO.getPassengerByUserId(userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        int passengerId = (int) passenger.getPassengerId();
        System.out.println("passengerId in payment -> " + passengerId);

        response.sendRedirect(request.getContextPath() + "/passenger/dashboard");
    }
}
