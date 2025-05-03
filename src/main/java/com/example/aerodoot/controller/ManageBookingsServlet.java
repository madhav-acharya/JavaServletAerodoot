package com.example.aerodoot.controller;

import com.example.aerodoot.dao.BookingDAO;
import com.example.aerodoot.model.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manage-booking")
public class ManageBookingsServlet extends HttpServlet {
    private List<Booking> bookings;

    @Override
    public void init() throws ServletException {
        System.out.println("BookingInitServlet: Initialization started...");
        try {
            bookings = BookingDAO.getAllBookings();
            getServletContext().setAttribute("bookings", bookings);
            System.out.println("Bookings loaded successfully.");
        } catch (Exception e) {
            throw new ServletException("Booking initialization failed", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/admin/manage-bookings.jsp").forward(request, response);
    }
}
