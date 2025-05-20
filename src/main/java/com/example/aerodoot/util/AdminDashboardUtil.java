package com.example.aerodoot.util;

import com.example.aerodoot.dao.AdminDAO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;

import java.sql.SQLException;
import java.util.List;

public class AdminDashboardUtil {
    public static void refreshDashboardData (ServletContext context) throws ServletException {
        AdminDAO dataModel = new AdminDAO();
        try {

            // Fetching the required data from the model
            int totalFlights = dataModel.getTotalFlights();
            int activeBookings = dataModel.getActiveBookings();
            double totalRevenue = dataModel.getTotalRevenue();
            int totalPassengers = dataModel.getTotalPassengers();
            List<AdminDAO.BookingTrend> bookingTrends = dataModel.getBookingTrends();
            List<AdminDAO.FlightDistribution> flightDistributions = dataModel.getFlightDistribution();

            // Storing the data in the ServletContext (for reuse in all requests)
            context.setAttribute("totalFlights", totalFlights);
            context.setAttribute("activeBookings", activeBookings);
            context.setAttribute("totalRevenue", totalRevenue);
            context.setAttribute("totalPassengers", totalPassengers);
            context.setAttribute("bookingTrends", bookingTrends);
            context.setAttribute("flightDistributions", flightDistributions);

        } catch (SQLException e) {
            System.err.println("Error initializing dashboard data: " + e.getMessage());
            e.printStackTrace();
            throw new ServletException("Error initializing dashboard data", e);
        }
    }
}
