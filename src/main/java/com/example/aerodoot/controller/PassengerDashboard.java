package com.example.aerodoot.controller;

import com.example.aerodoot.dao.PassengerDAO;
import com.example.aerodoot.dto.PassengerDashboardData;
import com.example.aerodoot.model.Passenger;
import com.example.aerodoot.service.AuthService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Base64;

@WebServlet("/passenger/dashboard")
@MultipartConfig
public class PassengerDashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int userId = (int) session.getAttribute("userId");

        System.out.println("userID of passenger Dashboard " + userId);

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
            session.setAttribute("passengerId", passengerData.getPassenger().getPassengerId());

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/WEB-INF/view/passengerDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        System.out.println(session.getAttribute("userId"));

        int userId = (int) session.getAttribute("userId");

        //updating the userdata with UserId
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");


        //updating the passengerData with the UserId
        Part profileImg = request.getPart("profilePicture");
        String passportNumber = request.getParameter("passportNumber");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        Date dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
        byte[] profilePicture = null;

        if (profileImg != null || profileImg.getSize() > 0) {
            try(InputStream inputStream = profileImg.getInputStream()) {
                profilePicture = inputStream.readAllBytes();
            }
        }
        int passengerId = (int) session.getAttribute("passengerId");

        System.out.println("the save changed work.");

        try {
            Passenger passenger = new Passenger();
            passenger.setPassportNumber(passportNumber);
            passenger.setAddress(address);
            passenger.setGender(gender);
            passenger.setProfilePicture(profilePicture);
            passenger.setDateOfBirth(dateOfBirth);
            passenger.setUserId(userId);
            passenger.setPassengerId(passengerId);

            int UserInt = AuthService.updateUserData(fullName, email, phoneNumber, userId);
            int PassengerInt = PassengerDAO.PassengerUpdataData(passenger);
            if (UserInt < 0 || PassengerInt < 0 ) {
                System.out.println("error get executed");
                String errorMessage = AuthService.getErrorMessage(UserInt);
                request.setAttribute("message", errorMessage);
                response.sendRedirect(request.getContextPath() + "/passenger/dashboard");
            } else {
                System.out.println("success update");
                response.sendRedirect(request.getContextPath() + "/passenger/dashboard");
            }
            System.out.println("Updated or errorId: " + UserInt);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
//        response.sendRedirect(request.getContextPath() + "/passenger/dashboard");

    }
}
