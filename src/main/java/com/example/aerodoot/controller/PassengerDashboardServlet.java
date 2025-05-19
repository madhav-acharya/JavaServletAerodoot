package com.example.aerodoot.controller;

import com.example.aerodoot.dao.*;
import com.example.aerodoot.dto.PassengerDashboardData;
import com.example.aerodoot.model.*;
import com.example.aerodoot.service.AuthService;
import com.example.aerodoot.util.FlashMessageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.*;

@WebServlet("/passenger/dashboard")
@MultipartConfig
public class PassengerDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int userId = (int) session.getAttribute("userId");

        List<Map<String, Object>> upcomingFlights = new ArrayList<>();
        List<Map<String, Object>> recentFlights = new ArrayList<>();

        try {
            PassengerDashboardData passengerData = PassengerDAO.getPassengerDataByUserId(userId);

            List<Booking> bookingList = BookingDAO.getPassengerBookings(passengerData.getPassenger().getPassengerId());

            for (Booking booking: bookingList) {

                Flight flight = FlightDAO.getFlightById(booking.getFlightId());

                LocalDate flightDate = flight.getFlightDate().toLocalDate();
                LocalTime flightTime = flight.getDepartureTime().toLocalTime();

                LocalDateTime flightDateTime = LocalDateTime.of(flightDate, flightTime);
                LocalDateTime currentDateTime = LocalDateTime.now();
                System.out.println("Flight DateTime: " + flightDateTime);
                System.out.println("Current DateTime: " + currentDateTime);

                if(flightDateTime.isBefore(currentDateTime)) {
                    int flightComp = FlightDAO.updateFlightStatus(booking.getFlightId());
                    int flightBooks = BookingDAO.updateBookingStatus(booking.getBookingId(), "COMPLETED");
                    booking.setBookingStatus("COMPLETED");
                }

                Airline airline = AirlineDAO.getAirlineById(flight.getAirlineId());
                Aircraft aircraft = AircraftDAO.getAircraftById(flight.getAircraftId());

                Map<String, Object> bookingDate = new HashMap<>();
                bookingDate.put("booking", booking);
                bookingDate.put("flight", flight);
                bookingDate.put("airline", airline);
                bookingDate.put("aircraft", aircraft);

                if (booking.getBookingStatus().equals("CONFIRMED")) {
                    upcomingFlights.add(bookingDate);
                }
                if (booking.getBookingStatus().equals("COMPLETED")) {
                    recentFlights.add(bookingDate);
                }
            }

            //flight data checking
            for (Map<String, Object> booking: recentFlights) {
                Booking books = (Booking) booking.get("booking");
                Flight flight = (Flight) booking.get("flight");
                Aircraft aircraft = (Aircraft) booking.get("aircraft");
                System.out.println(books.getBookingDate() + " " + flight.getFlightDate() + " " + aircraft.getModel());
            }

            System.out.println("Upcoming Flights: " + upcomingFlights.size());
            System.out.println("Recent Flights: " + recentFlights.size());
            int totalBooking = upcomingFlights.size() + recentFlights.size();
            System.out.println("Total Booking: " + totalBooking);

            //for profile image
            byte[] profilePicture = passengerData.getPassenger().getProfilePicture();
            String base64Image = null;
            String mimeType = null;

            if (profilePicture != null && profilePicture.length > 0) {
                base64Image = Base64.getEncoder().encodeToString(profilePicture);
                mimeType = URLConnection.guessContentTypeFromStream(new ByteArrayInputStream(profilePicture));
            }

            request.setAttribute("profileImage", base64Image);
            request.setAttribute("mimeType", mimeType);
            request.setAttribute("passenger", passengerData);
            session.setAttribute("passengerId", passengerData.getPassenger().getPassengerId());

            request.setAttribute("upcomingBookingNum", upcomingFlights.size());
            request.setAttribute("recentBookingNum", recentFlights.size());
            request.setAttribute("totalBookingNum", recentFlights.size() + upcomingFlights.size());
            request.setAttribute("upcomingFlights", upcomingFlights);
            request.setAttribute("recentFlights", recentFlights);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.getRequestDispatcher("/WEB-INF/view/passengerDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        System.out.println(session.getAttribute("userId"));

        int userId = (int) session.getAttribute("userId");

        //updating the userdata with UserId
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");


        //updating the passengerData with the UserId
        Part profileImg = request.getPart("profilePicture");
        String passportNumber = request.getParameter("passportNumber");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        Date dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
        byte[] profilePicture = null;

        if (profileImg != null || profileImg.getSize() > 0) {
            try(InputStream inputStream = profileImg.getInputStream()) {
                profilePicture = inputStream.readAllBytes();
            }
        }
        int passengerId = (int) session.getAttribute("passengerId");

        System.out.println("the save changed work.");



        try {
            Passenger passenger = new Passenger();
            passenger.setPassportNumber(passportNumber);
            passenger.setAddress(address);
            passenger.setGender(gender);
            passenger.setProfilePicture(profilePicture);
            passenger.setDateOfBirth(dateOfBirth);
            passenger.setUserId(userId);
            passenger.setPassengerId(passengerId);

            int UserInt = AuthService.updateUserData(fullName, email, phoneNumber, userId);
            int PassengerInt = PassengerDAO.PassengerUpdataData(passenger);
            if (UserInt < 0 || PassengerInt < 0 ) {
                System.out.println("error get executed");
                String errorMessage = AuthService.getErrorMessage(UserInt);
                FlashMessageUtil.setError(request.getSession(), errorMessage);
                request.setAttribute("message", errorMessage);
                response.sendRedirect(request.getContextPath() + "/passenger/dashboard");
            } else {
                FlashMessageUtil.setSuccess(request.getSession(), "Updated Successfully");
                System.out.println("success update");
                response.sendRedirect(request.getContextPath() + "/passenger/dashboard");
            }
            System.out.println("Updated or errorId: " + UserInt);
        } catch (SQLException e) {
            FlashMessageUtil.setError(request.getSession(), e.getMessage());
            throw new RuntimeException(e);
        }
//        response.sendRedirect(request.getContextPath() + "/passenger/dashboard");

    }
}
