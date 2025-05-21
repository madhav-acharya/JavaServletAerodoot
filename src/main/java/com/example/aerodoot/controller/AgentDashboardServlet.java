package com.example.aerodoot.controller;

import com.example.aerodoot.dao.BookingDAO;
import com.example.aerodoot.dto.BookingAnalysisByClass;
import com.example.aerodoot.dto.BookingTrend;
import com.example.aerodoot.dto.FlightDistribution;
import com.example.aerodoot.dto.RevenueByRoute;
import com.example.aerodoot.model.Booking;
import com.example.aerodoot.util.AdminAnalyticsUtil;
import com.example.aerodoot.util.AdminDashboardUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/agent/dashboard")
public class AgentDashboardServlet extends HttpServlet {
    private List<Booking> bookings;

    @Override
    public void init() throws ServletException {
        AdminDashboardUtil.refreshDashboardData(getServletContext());
        AdminAnalyticsUtil.refreshAnalyticsData(getServletContext());
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
        AdminDashboardUtil.refreshDashboardData(getServletContext());
        int totalFlights = (int) getServletContext().getAttribute("totalFlights");
        int activeBookings = (int) getServletContext().getAttribute("activeBookings");
        double totalRevenue = (double) getServletContext().getAttribute("totalRevenue");

        // Setting attributes for the JSP view
        request.setAttribute("totalFlights", totalFlights);
        request.setAttribute("activeBookings", activeBookings);
        request.setAttribute("totalRevenue", totalRevenue);

        AdminAnalyticsUtil.refreshAnalyticsData(getServletContext());
        List<BookingAnalysisByClass> bookingAnalysisByClass = (List<BookingAnalysisByClass>) getServletContext().getAttribute("bookingAnalysisByClass");
        request.setAttribute("bookingAnalysisByClass", bookingAnalysisByClass);

        request.getRequestDispatcher("/WEB-INF/view/agent/agentDashboard.jsp").forward(request, response);
    }

    @WebServlet("/admin/dashboard")
    public static class adminDashboardServlet extends HttpServlet {

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("/WEB-INF/view/admin/manage-aircraft.jsp").forward(request, response);
        }
    }
}
