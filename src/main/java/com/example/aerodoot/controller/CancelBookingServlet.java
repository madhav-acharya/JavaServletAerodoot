package com.example.aerodoot.controller;

import com.example.aerodoot.dao.BookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/cancel-booking")
public class CancelBookingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        int cancelBooking = BookingDAO.updateBookingStatus();

        response.sendRedirect(request.getContextPath() + "/passenger/dashboard");
    }
}

