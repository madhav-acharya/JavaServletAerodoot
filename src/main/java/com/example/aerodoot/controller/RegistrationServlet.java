package com.example.aerodoot.controller;

import com.example.aerodoot.service.AuthService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");

        try {
            int userId = AuthService.createUser(fullname, email, phonenumber, password, confirmpassword);
            System.out.println("UserID: "+userId);
            if (userId > 0) {
                System.out.println("UserID: "+userId);
                System.out.println("User registered successfully");
                request.getSession().setAttribute("userId", userId);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/userType.jsp");
                dispatcher.forward(request, response);
            } else {
                System.out.println("User creation failed " + fullname + " " + email + " " + phonenumber + " " + password + " " + confirmpassword);
                String errorMessage = AuthService.getErrorMessage(userId);
                request.setAttribute("errorMessage", errorMessage);

                // Add the form data back to the request
                request.setAttribute("fullname", fullname);
                request.setAttribute("email", email);
                request.setAttribute("phonenumber", phonenumber);

                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/signup.jsp");
                dispatcher.forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("cannot be registered "+e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/signup.jsp");
            dispatcher.forward(request, response);
        }
    }
}
