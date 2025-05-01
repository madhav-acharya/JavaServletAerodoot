package com.example.aerodoot.controller;

import com.example.aerodoot.dao.UserDAO;
import com.example.aerodoot.model.User;
import jakarta.servlet.ServletContext;
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
        System.out.println("Its init");
        try {
            users = UserDAO.getAllUsers();
            ServletContext context = getServletContext();
            context.setAttribute("users", users);
        } catch (Exception e) {
            throw new ServletException("Initialization failed", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("in doget");
        request.getRequestDispatcher("/WEB-INF/view/admin/manage-user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Its post");
        System.out.println("action "+ request.getParameter("action"));
            System.out.println("Its edit");
            try {
                int editId = Integer.parseInt(request.getParameter("userId"));
                User editUser = UserDAO.getUserById(editId);
                request.setAttribute("userId", editId);
                request.setAttribute("firstName", editUser.getFirstName());
                request.setAttribute("lastName", editUser.getLastName());
                request.setAttribute("email", editUser.getEmail());
                request.setAttribute("phoneNumber", editUser.getPhoneNumber());
                request.setAttribute("userType", editUser.getUserType());
                request.setAttribute("createdAt", editUser.getCreatedAt());

                System.out.println("editUser: " + editUser);
            } catch (Exception e) {
                throw new ServletException("Failed to fetch user by ID", e);
            }
        request.getRequestDispatcher("/WEB-INF/view/admin/manage-user.jsp").forward(request, response);
    }
}
