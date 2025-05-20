package com.example.aerodoot.controller;

import com.example.aerodoot.dao.BookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/cancel-booking")
public class CancelBookingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        int cancelBooking;
        try {
            cancelBooking = BookingDAO.updateBookingStatus(bookingId, "CANCELLED");
            System.out.println("Cancel booking Done: " + cancelBooking);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect(request.getContextPath() + "/passenger/dashboard");
    }
}

