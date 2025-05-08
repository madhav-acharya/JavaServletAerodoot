package com.example.aerodoot.controller;

import com.example.aerodoot.dao.UserDAO;
import com.example.aerodoot.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/manage-setting")
public class SettingsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/admin/setting.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        int userId = (int) session.getAttribute("userId");
        User user = (User) session.getAttribute("user");

        String fullName = request.getParameter("fullName");
        String firstName;
        String lastName;

        if (fullName == null || fullName.trim().isEmpty()) {
            firstName = user.getFirstName();
            lastName = user.getLastName();
        } else {
            String[] nameParts = fullName.trim().split(" ", 2);
            firstName = nameParts[0];
            lastName = nameParts.length > 1 ? nameParts[1] : "";
        }

        String email = request.getParameter("email");
        if (email == null || email.trim().isEmpty()) {
            email = user.getEmail();
        }

        try {
            user.setUserId(userId);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);

            int updateUserId = UserDAO.updateAdmin(user);

            if (updateUserId >= 0) {
                session.setAttribute("user", user);
                System.out.println("success");
            }

            response.sendRedirect(request.getContextPath() + "/admin/manage-setting");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
