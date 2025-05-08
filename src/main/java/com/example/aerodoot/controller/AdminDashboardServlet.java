package com.example.aerodoot.controller;

import com.example.aerodoot.dao.AdminDAO;
import com.example.aerodoot.dao.UserDAO;
import com.example.aerodoot.model.User;
import com.example.aerodoot.service.AuthService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin")
public class AdminDashboardServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        try {
            AdminDAO dataModel = new AdminDAO();

            // Fetching the required data from the model
            int totalFlights = dataModel.getTotalFlights();
            int activeBookings = dataModel.getActiveBookings();
            double totalRevenue = dataModel.getTotalRevenue();
            int totalPassengers = dataModel.getTotalPassengers();
            List<AdminDAO.BookingTrend> bookingTrends = dataModel.getBookingTrends();
            List<AdminDAO.FlightDistribution> flightDistributions = dataModel.getFlightDistribution();

            // Storing the data in the ServletContext (for reuse in all requests)
            getServletContext().setAttribute("totalFlights", totalFlights);
            getServletContext().setAttribute("activeBookings", activeBookings);
            getServletContext().setAttribute("totalRevenue", totalRevenue);
            getServletContext().setAttribute("totalPassengers", totalPassengers);
            getServletContext().setAttribute("bookingTrends", bookingTrends);
            getServletContext().setAttribute("flightDistributions", flightDistributions);

        } catch (SQLException e) {
            System.err.println("Error initializing dashboard data: " + e.getMessage());
            e.printStackTrace();
            throw new ServletException("Error initializing dashboard data", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int totalFlights = (int) getServletContext().getAttribute("totalFlights");
        int activeBookings = (int) getServletContext().getAttribute("activeBookings");
        double totalRevenue = (double) getServletContext().getAttribute("totalRevenue");
        int totalPassengers = (int) getServletContext().getAttribute("totalPassengers");
        List<AdminDAO.BookingTrend> bookingTrends = (List<AdminDAO.BookingTrend>) getServletContext().getAttribute("bookingTrends");
        List<AdminDAO.FlightDistribution> flightDistributions = (List<AdminDAO.FlightDistribution>) getServletContext().getAttribute("flightDistributions");

        // Setting attributes for the JSP view
        request.setAttribute("totalFlights", totalFlights);
        request.setAttribute("activeBookings", activeBookings);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("totalPassengers", totalPassengers);
        request.setAttribute("bookingTrends", bookingTrends);
        request.setAttribute("flightDistributions", flightDistributions);
        request.getRequestDispatcher("/WEB-INF/view/admin/admin-dashboard.jsp").forward(request, response);
    }
}
