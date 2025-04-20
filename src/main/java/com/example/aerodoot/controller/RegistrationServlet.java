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

            if (userId > 0) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login.jsp");
                dispatcher.forward(request, response);
            } else {
                String errorMessage = AuthService.getErrorMessage(userId);
                request.setAttribute("errorMessage", errorMessage);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/signup.jsp");
                dispatcher.forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(""+e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/signup.jsp");
            dispatcher.forward(request, response);
        }
    }
}
