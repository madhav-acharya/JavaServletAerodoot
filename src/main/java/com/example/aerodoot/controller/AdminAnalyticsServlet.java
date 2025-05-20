package com.example.aerodoot.controller;

import com.example.aerodoot.dao.AdminDAO;
import com.example.aerodoot.dto.BookingAnalysisByClass;
import com.example.aerodoot.dto.RevenueByRoute;
import com.example.aerodoot.util.AdminAnalyticsUtil;
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
        AdminAnalyticsUtil.refreshAnalyticsData(getServletContext());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminAnalyticsUtil.refreshAnalyticsData(getServletContext());
        List<BookingAnalysisByClass> bookingAnalysisByClass = (List<BookingAnalysisByClass>) getServletContext().getAttribute("bookingAnalysisByClass");
        List<RevenueByRoute> revenueByRoute = (List<RevenueByRoute>) getServletContext().getAttribute("revenueByRoute");
        request.setAttribute("bookingAnalysisByClass", bookingAnalysisByClass);
        request.setAttribute("revenueByRoute", revenueByRoute);

        request.getRequestDispatcher("/WEB-INF/view/admin/analytics.jsp").forward(request, response);
    }
}
