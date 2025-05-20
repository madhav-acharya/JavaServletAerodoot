package com.example.aerodoot.util;

import com.example.aerodoot.dao.AdminDAO;
import com.example.aerodoot.dto.BookingAnalysisByClass;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;

import java.sql.SQLException;
import java.util.List;

public class AdminAnalyticsUtil {
    public static void refreshAnalyticsData(ServletContext context) {
        AdminDAO adminDAO = new AdminDAO();
        try {
            List<BookingAnalysisByClass> bookingAnalysisByClass = adminDAO.getBookingAnalysisByClass();
            List<AdminDAO.RevenueByRoute> revenueByRoute = adminDAO.getRevenueByRoute();

            context.setAttribute("bookingAnalysisByClass", bookingAnalysisByClass);
            context.setAttribute("revenueByRoute", revenueByRoute);

            System.out.println("[Analytics] Refreshed analytics data.");
        } catch (SQLException e) {
            System.err.println("Error while refreshing analytics: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
