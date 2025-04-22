package com.example.aerodoot.controller;

import com.example.aerodoot.dao.PassengerDAO;
import com.example.aerodoot.model.Passenger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;

@WebServlet("/register-passenger")
@MultipartConfig
public class PassengerRegistrationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/passengerRegistration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String passportNumber = request.getParameter("passportNumber");
        Date dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        int userId =  (int) request.getSession().getAttribute("userId");

        Part filePart = request.getPart("profilePicture");
        byte[] profilePicture = null;

        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                profilePicture = inputStream.readAllBytes();
            }
        }

        Passenger passenger = new Passenger(passportNumber, dateOfBirth, gender, address, profilePicture, userId);
        int passengerId = PassengerDAO.createPassenger(passenger);

//        request.getSession().setAttribute("passengerId", passengerId);

        System.out.println("Passenger ID: " + passengerId + ", Passport: " + passportNumber);

        if (passengerId > 0) {
            request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/view/passengerRegistration.jsp").forward(request, response);
        }
    }
}
