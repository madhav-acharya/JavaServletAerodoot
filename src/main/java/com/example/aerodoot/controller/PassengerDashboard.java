package com.example.aerodoot.controller;

import com.example.aerodoot.dao.PassengerDAO;
import com.example.aerodoot.dao.UserDAO;
import com.example.aerodoot.dto.PassengerDashboardData;
import com.example.aerodoot.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/passenger/dashboard")
public class PassengerDashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int userId = (int) session.getAttribute("userId");

        System.out.println(userId + " " + "from passenger Dashboard");
        try {

            PassengerDashboardData passengerData = PassengerDAO.getPassengerDataByUserId(userId);
            request.setAttribute("passenger", passengerData);
            System.out.println(request.getParameter("passenger") + " ps Data");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/WEB-INF/view/passengerDashboard.jsp").forward(request, response);
    }
}
