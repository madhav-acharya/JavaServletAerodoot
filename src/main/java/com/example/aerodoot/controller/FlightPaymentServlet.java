package com.example.aerodoot.controller;

import com.example.aerodoot.dao.PassengerDAO;
import com.example.aerodoot.model.Booking;
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
        String classType = request.getParameter("seatClass");
        String passengerCount = request.getParameter("passengerCount");
        Float totalPrice = Float.parseFloat(request.getParameter("paymentAmount"));
        String flightNumber = request.getParameter("flightNumber");


        String[] passengerList = passengerCount.trim().split("\\s+");
        int seatsBooked = Integer.parseInt(passengerList[0]);

        Booking booking = new Booking();

        String paymentMethod = request.getParameter("paymentMethod");
        Float paidAmount = totalPrice;

        System.out.println(classType + " -> " + seatsBooked + " -> " + totalPrice + " " + paidAmount + " -> " + flightNumber + " -> " );


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
