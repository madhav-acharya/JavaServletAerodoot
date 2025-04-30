package com.example.aerodoot.controller;

import com.example.aerodoot.dao.UserDAO;
import com.example.aerodoot.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manage-user")
public class ManageUsers extends HttpServlet {
    private List<User> users;
    @Override
    public void init() throws ServletException {
        try {
            UserDAO userDAO = new UserDAO();
            users = userDAO.getAllUsers();
            System.out.println("users from servlet "+users);
        } catch (Exception e) {
            throw new ServletException("Initialization failed", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("users", users);
        request.getRequestDispatcher("/WEB-INF/view/admin/manage-user.jsp").forward(request, response);
    }
}
