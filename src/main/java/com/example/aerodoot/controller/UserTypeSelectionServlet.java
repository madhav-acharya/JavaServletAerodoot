package com.example.aerodoot.controller;

import com.example.aerodoot.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/select-usertype")
public class UserTypeSelectionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/userType.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the request (from a form or AJAX)
        System.out.println(request.getParameter("userType"));
        System.out.println(request.getSession().getAttribute("userId"));
        int userId = (int) request.getSession().getAttribute("userId");
        String newUserType = request.getParameter("userType");

        // Call DAO method
        boolean success = UserDAO.changeUserType(userId, newUserType);

        // Set response based on result
        if (success) {
            request.setAttribute("message", "User type updated successfully!");
            if ("agent".equals(newUserType)) {
                request.getRequestDispatcher("/WEB-INF/view/agentRegistration.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/WEB-INF/view/passengerRegistration.jsp").forward(request, response);
            }

        } else {
            System.out.println("User Type Updation  failed" + userId);
            request.setAttribute("message", "Failed to update user type.");
        }

        // Forward to a JSP or redirect as needed

    }
}
