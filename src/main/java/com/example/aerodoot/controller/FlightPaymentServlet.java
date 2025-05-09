package com.example.aerodoot.controller;

import com.example.aerodoot.dao.BookingDAO;
import com.example.aerodoot.dao.FlightDAO;
import com.example.aerodoot.dao.PassengerDAO;
import com.example.aerodoot.dao.PaymentDAO;
import com.example.aerodoot.model.Booking;
import com.example.aerodoot.model.Flight;
import com.example.aerodoot.model.Passenger;
import com.example.aerodoot.model.Payment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

@WebServlet("/payment")
public class FlightPaymentServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String classType = request.getParameter("seatClass");
        String passengerCount = request.getParameter("passengerCount");
        Float totalPrice = Float.parseFloat(request.getParameter("paymentAmount"));
        String flightNumber = request.getParameter("flightNumber");

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

        String[] passengerList = passengerCount.trim().split("\\s+");
        int seatsBooked = Integer.parseInt(passengerList[0]);

        Flight flight = null;
        try {
            flight = FlightDAO.getFlightByFlightNumber(flightNumber);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        int flightNum = flight.getFlightId();

        //creating the booking object of current booking
        Booking booking = new Booking();
        booking.setClassType(classType);
        booking.setSeatsBooked(seatsBooked);
        booking.setTotalPrice(BigDecimal.valueOf(totalPrice));
        booking.setBookingStatus("CONFIRMED");
        booking.setFlightId(flightNum);
        booking.setPassengerId(passengerId);

        String paymentMethod = request.getParameter("paymentMethod");
        Float paidAmount = totalPrice;

        //creating the payment object of Payment
        Payment payment = new Payment();
        payment.setPaymentMethod(paymentMethod);
        payment.setPaymentStatus("COMPLETED");
        payment.setPaidAmount(BigDecimal.valueOf(paidAmount));

        try {
            int bookingId = BookingDAO.createBooking(booking);
            payment.setBookingId(bookingId);
            int paymentId = PaymentDAO.makePayment(payment);
            System.out.println("Booking is done ------>" + bookingId);
            System.out.println("Payment is done ------>" + paymentId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect(request.getContextPath() + "/passenger/dashboard");
    }
}
