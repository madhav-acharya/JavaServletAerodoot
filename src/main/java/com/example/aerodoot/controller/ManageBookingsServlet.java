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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/admin/manage-bookings.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println("BookingPostServlet: doPost started...");
            System.out.println("BookingId: " + request.getParameter("bookingId"));
            System.out.println("bookingStatus: " + request.getParameter("bookingStatus"));
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            String bookingStatus = request.getParameter("bookingStatus");

            int updateBookingStatus = BookingDAO.updateBookingStatus(bookingId, bookingStatus);

            if (updateBookingStatus >= 0) {
                System.out.println("Booking status updated successfully.");
                bookings = BookingDAO.getAllBookings();
                getServletContext().setAttribute("bookings", bookings);
                response.sendRedirect(request.getContextPath() + "/admin/manage-booking");
                return;
            } else {
                request.setAttribute("error", "Failed to update booking status.");
            }

        } catch (Exception e) {
            System.err.println("Error updating booking status: " + e.getMessage());
            throw new ServletException("Failed to update booking status", e);
        }
        request.getRequestDispatcher("/WEB-INF/view/admin/manage-bookings.jsp").forward(request, response);
    }
}
