package com.example.aerodoot.controller;

import com.example.aerodoot.dao.PassengerDAO;
import com.example.aerodoot.model.Passenger;
import com.example.aerodoot.util.FlashMessageUtil;
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

        System.out.println(dateOfBirth + " " + gender);


        if(request.getSession().getAttribute("userId") == null) {
            FlashMessageUtil.setError(request.getSession(), "You are not logged in");
            request.setAttribute("error", "Unauthorized User");
            request.getRequestDispatcher("/WEB-INF/view/passengerRegistration.jsp").forward(request, response);
        }
        int userId =  (int) request.getSession().getAttribute("userId");

        Part filePart = request.getPart("profilePicture");
        byte[] profilePicture = null;

        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                profilePicture = inputStream.readAllBytes();
            }catch (IOException e) {
                FlashMessageUtil.setError(request.getSession(), e.getMessage());
            }
        }

        if(passportNumber == null || passportNumber == "" || dateOfBirth == null || gender == null || address == null || userId == 0) {
            request.setAttribute("error", "Please fill all the required fields");
            FlashMessageUtil.setError(request.getSession(), "Please fill all the required fields");
            request.getRequestDispatcher("/WEB-INF/view/passengerRegistration.jsp").forward(request, response);
        }
        Passenger passenger = new Passenger(passportNumber, dateOfBirth, gender, address, profilePicture, userId);
        int passengerId = PassengerDAO.createPassenger(passenger);

//        request.getSession().setAttribute("passengerId", passengerId);

        System.out.println("Passenger ID: " + passengerId + ", Passport: " + passportNumber);

        if (passengerId > 0) {
            FlashMessageUtil.setSuccess(request.getSession(), "Passenger successfully registered");
            request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
        } else {
            FlashMessageUtil.setError(request.getSession(), "Passenger Registration Failed!");
            request.getRequestDispatcher("/WEB-INF/view/passengerRegistration.jsp").forward(request, response);
        }
    }
}
