package com.example.aerodoot.controller;

import com.example.aerodoot.model.User;
import com.example.aerodoot.service.AuthService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = null;

        try {
            user = AuthService.validateUser(email, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (user != null) {
            HttpSession session = request.getSession();

            session.setAttribute("user", user);
            session.setAttribute("isLoggedIn", true);

            session.setMaxInactiveInterval(30*60);

            if (user.getUserType().equals("PASSENGER")) {
                request.getRequestDispatcher("/home.jsp").forward(request, response);
            }
            if (user.getUserType().equals("AGENT")) {
                request.getRequestDispatcher("/WEB-INF/view/agentDashboard.jsp").forward(request, response);
            }
            if (user.getUserType().equals("ADMIN")) {
                request.getRequestDispatcher("/WEB-INF/view/adminDashboard.jsp").forward(request, response);
            }
        } else {
            // Login failed
            request.setAttribute("email", email);
            request.setAttribute("error", "Invalid email or password");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login.jsp");
            dispatcher.forward(request, response);
        }
    }


}
