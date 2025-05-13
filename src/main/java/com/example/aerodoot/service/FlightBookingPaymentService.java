package com.example.aerodoot.service;

import com.example.aerodoot.dao.BookingDAO;
import com.example.aerodoot.dao.FlightDAO;
import com.example.aerodoot.dao.PassengerDAO;
import com.example.aerodoot.dao.PaymentDAO;
import com.example.aerodoot.model.Booking;
import com.example.aerodoot.model.Flight;
import com.example.aerodoot.model.Passenger;
import com.example.aerodoot.model.Payment;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.math.BigDecimal;
import java.sql.SQLException;

public class FlightBookingPaymentService {

    public static int createBooking(HttpServletRequest request, String classType, String passengerCount, Float totalPrice, String flightNumber) throws ClassNotFoundException, SQLException {

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

        return BookingDAO.createBooking(booking);
    }

    public static int createPayment(String paymentMethod, Float totalPrice, int bookingId) throws ClassNotFoundException, SQLException {

        //creating the payment object of Payment
        Payment payment = new Payment();
        payment.setPaymentMethod(paymentMethod);
        payment.setPaymentStatus("COMPLETED");
        payment.setPaidAmount(BigDecimal.valueOf(totalPrice));
        payment.setBookingId(bookingId);

        return PaymentDAO.makePayment(payment);
    }
}

