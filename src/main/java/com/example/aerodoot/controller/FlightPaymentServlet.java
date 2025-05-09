package com.example.aerodoot.controller;

import com.example.aerodoot.dao.BookingDAO;
import com.example.aerodoot.dao.FlightDAO;
import com.example.aerodoot.dao.PassengerDAO;
import com.example.aerodoot.dao.PaymentDAO;
import com.example.aerodoot.model.Booking;
import com.example.aerodoot.model.Flight;
import com.example.aerodoot.model.Passenger;
import com.example.aerodoot.model.Payment;
import com.example.aerodoot.service.FlightBookingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/payment")
public class FlightPaymentServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String classType = request.getParameter("seatClass");
        String passengerCount = request.getParameter("passengerCount");
        Float totalPrice = Float.parseFloat(request.getParameter("paymentAmount"));
        String flightNumber = request.getParameter("flightNumber");
        String paymentMethod = request.getParameter("paymentMethod");

        try {
            int bookingId = FlightBookingService.createBooking(request, classType, passengerCount, totalPrice, flightNumber);
            int paymentId = FlightBookingService.createPayment(paymentMethod, totalPrice, bookingId);
            System.out.println("booking successful " + bookingId + " -> " + paymentId);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect(request.getContextPath() + "/passenger/dashboard");
    }
}
