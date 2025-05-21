package com.example.aerodoot.controller;

import com.example.aerodoot.dao.*;
import com.example.aerodoot.model.Flight;
import com.example.aerodoot.model.Passenger;
import com.example.aerodoot.model.User;
import com.example.aerodoot.service.FlightBookingPaymentService;
import com.example.aerodoot.util.FlashMessageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
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

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("=== RAW REQUEST PARAMETERS ===");
        System.out.println("userId: " + request.getParameter("userId"));
        System.out.println("seatClass: " + request.getParameter("seatClass"));
        System.out.println("passengerCount: " + request.getParameter("passengerCount"));
        System.out.println("paymentAmount: " + request.getParameter("paymentAmount"));
        System.out.println("flightNumber: " + request.getParameter("flightNumber"));
        System.out.println("paymentMethod: " + request.getParameter("paymentMethod"));
        System.out.println("==============================");

        int userId = Integer.parseInt(request.getParameter("userId"));
        String classType = request.getParameter("seatClass");
        String passengerCount = request.getParameter("passengerCount");
        Float totalPrice = Float.parseFloat(request.getParameter("paymentAmount"));
        String flightNumber = request.getParameter("flightNumber");
        String paymentMethod = request.getParameter("paymentMethod");

        try {
            int bookingId = FlightBookingPaymentService.createAgentBooking(request, userId, classType, passengerCount, totalPrice, flightNumber);
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

        response.sendRedirect(request.getContextPath() + "/agent/dashboard");
    }
}
