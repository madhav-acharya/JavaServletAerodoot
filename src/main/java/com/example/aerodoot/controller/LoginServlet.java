package com.example.aerodoot.controller;

import com.example.aerodoot.model.User;
import com.example.aerodoot.service.AuthService;
import com.example.aerodoot.util.FlashMessageUtil;
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
            FlashMessageUtil.setError(request.getSession(), e.getMessage());
            throw new RuntimeException(e);
        }

        if (user != null) {
            HttpSession session = request.getSession();

            FlashMessageUtil.setSuccess(request.getSession(), "Login Succeed");

            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userType", user.getUserType());
            session.setAttribute("user", user);
            session.setAttribute("isLoggedIn", true);

            session.setMaxInactiveInterval(30*60);

//            System.out.println(session.getAttribute("user"));

            if (user.getUserType().equals("PASSENGER")) {
                request.getRequestDispatcher("/home.jsp").forward(request, response);
            }
            if (user.getUserType().equals("AGENT")) {
                response.sendRedirect(request.getContextPath() + "/agent/dashboard");
            }
            if (user.getUserType().equals("ADMIN")) {
                response.sendRedirect(request.getContextPath() + "/admin");
            }
        } else {
            // Login failed
            FlashMessageUtil.setError(request.getSession(), "Invalid email or password");
            request.setAttribute("email", email);
            request.setAttribute("error", "Invalid email or password");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login.jsp");
            dispatcher.forward(request, response);
        }
    }


}
