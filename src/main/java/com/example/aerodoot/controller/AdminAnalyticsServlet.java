package com.example.aerodoot.controller;

import com.example.aerodoot.dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/analytics")
public class AdminAnalyticsServlet extends HttpServlet {

    private AdminDAO adminDAO;

    @Override
    public void init() throws ServletException {
        try {
            // Initializing AdminDAO and fetching the data
            adminDAO = new AdminDAO();

            List<AdminDAO.BookingAnalysisByClass> bookingAnalysisByClass = adminDAO.getBookingAnalysisByClass();
            List<AdminDAO.RevenueByRoute> revenueByRoute = adminDAO.getRevenueByRoute();

            getServletContext().setAttribute("bookingAnalysisByClass", bookingAnalysisByClass);
            getServletContext().setAttribute("revenueByRoute", revenueByRoute);
            System.out.println("bookingAnalysisByClass: " + bookingAnalysisByClass);
            System.out.println("revenueByRoute: " + revenueByRoute);

        } catch (SQLException e) {
            System.err.println("Error initializing dashboard data: " + e.getMessage());
            e.printStackTrace();
            throw new ServletException("Error initializing dashboard data", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminDAO.BookingAnalysisByClass> bookingAnalysisByClass = (List<AdminDAO.BookingAnalysisByClass>) getServletContext().getAttribute("bookingAnalysisByClass");
        List<AdminDAO.RevenueByRoute> revenueByRoute = (List<AdminDAO.RevenueByRoute>) getServletContext().getAttribute("revenueByRoute");
        request.setAttribute("bookingAnalysisByClass", bookingAnalysisByClass);
        request.setAttribute("revenueByRoute", revenueByRoute);

        request.getRequestDispatcher("/WEB-INF/view/admin/analytics.jsp").forward(request, response);
    }
}
