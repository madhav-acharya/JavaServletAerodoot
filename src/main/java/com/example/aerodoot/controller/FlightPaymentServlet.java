package com.example.aerodoot.controller;

import com.example.aerodoot.service.FlightBookingPaymentService;
import com.example.aerodoot.util.FlashMessageUtil;
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
            int bookingId = FlightBookingPaymentService.createBooking(request, classType, passengerCount, totalPrice, flightNumber);
            int paymentId = FlightBookingPaymentService.createPayment(paymentMethod, totalPrice, bookingId);
            if(paymentId > 0)
            {
                FlashMessageUtil.setSuccess(request.getSession(), "Payment Succeed");
            }
            else
            {
                FlashMessageUtil.setError(request.getSession(), "Payment Failed");
            }
            if(bookingId > 0)
            {
                FlashMessageUtil.setSuccess(request.getSession(), "Booking Succeed");
            }
            else
            {
                FlashMessageUtil.setError(request.getSession(), "Booking Failed");
            }
            System.out.println("booking successful " + bookingId + " -> " + paymentId);
        } catch (ClassNotFoundException | SQLException e) {
            FlashMessageUtil.setError(request.getSession(), e.getMessage());
            throw new RuntimeException(e);
        }

        response.sendRedirect(request.getContextPath() + "/passenger/dashboard");
    }
}
