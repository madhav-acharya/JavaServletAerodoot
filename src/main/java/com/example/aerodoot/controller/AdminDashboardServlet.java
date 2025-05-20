package com.example.aerodoot.controller;

import com.example.aerodoot.dao.AdminDAO;
import com.example.aerodoot.dao.UserDAO;
import com.example.aerodoot.model.User;
import com.example.aerodoot.service.AuthService;
import com.example.aerodoot.util.AdminDashboardUtil;
import jakarta.servlet.ServletContext;
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
        AdminDashboardUtil.refreshDashboardData(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDashboardUtil.refreshDashboardData(getServletContext());
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
