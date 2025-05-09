package com.example.aerodoot.controller;

import com.example.aerodoot.dao.BookingDAO;
import com.example.aerodoot.dao.FlightDAO;
import com.example.aerodoot.dao.PassengerDAO;
import com.example.aerodoot.model.Booking;
import com.example.aerodoot.model.Flight;
import com.example.aerodoot.model.Passenger;
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
        //classtype, numofseatbooks, totalprice, bookingStatus, flightId, passengerId, flightNumber
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

        Booking booking = new Booking();
        booking.setClassType(classType);
        booking.setSeatsBooked(seatsBooked);
        booking.setTotalPrice(BigDecimal.valueOf(totalPrice));
        booking.setBookingStatus("CONFIRMED");
        booking.setFlightId(flightNum);
        booking.setPassengerId(passengerId);

        try {
            int bookingDone = BookingDAO.createBooking(booking);
            System.out.println("Booking is done ------>" + bookingDone);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String paymentMethod = request.getParameter("paymentMethod");
        Float paidAmount = totalPrice;

        System.out.println(classType + " -> " + seatsBooked + " -> " + totalPrice + " " + paidAmount + " -> " + flightNumber + " -> " );




        response.sendRedirect(request.getContextPath() + "/passenger/dashboard");
    }
}
