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

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.URLConnection;
import java.sql.SQLException;
import java.util.Base64;

@WebServlet("/passenger/dashboard")
public class PassengerDashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int userId = (int) session.getAttribute("userId");

        System.out.println("userID of passenger Dashboard " + userId);

        System.out.println(userId + " " + "from passenger Dashboard");
        try {

            PassengerDashboardData passengerData = PassengerDAO.getPassengerDataByUserId(userId);

            byte[] profilePicture = passengerData.getPassenger().getProfilePicture();
            String base64Image = null;
            String mimeType = null;

            if (profilePicture != null && profilePicture.length > 0) {
                base64Image = Base64.getEncoder().encodeToString(profilePicture);
                mimeType = URLConnection.guessContentTypeFromStream(new ByteArrayInputStream(profilePicture));
            }

            request.setAttribute("profileImage", base64Image);
            request.setAttribute("mimeType", mimeType);
            request.setAttribute("passenger", passengerData);
            System.out.println(passengerData.getUser().getFirstName());
            System.out.println(passengerData.getUser().getPhoneNumber());

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/WEB-INF/view/passengerDashboard.jsp").forward(request, response);
    }
}
