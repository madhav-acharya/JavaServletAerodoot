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
        System.out.println("It's post");
        String action = request.getParameter("action");
        System.out.println("action " + action);

        if ("edit".equals(action)) {
            try {
                int editId = Integer.parseInt(request.getParameter("userId"));
                User editUser = UserDAO.getUserById(editId);

                request.setAttribute("editUser", editUser);

            } catch (Exception e) {
                throw new ServletException("Failed to fetch user by ID", e);
            }
        }
        else if ("update".equals(action))
        {
            System.out.println("in update");
            try {
                int userId = Integer.parseInt(request.getParameter("userId"));
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phoneNumber");
                String userType = request.getParameter("userType");

                System.out.println("userType " + userType);
                System.out.println("firstName " + firstName);
                System.out.println("lastName " + lastName);
                System.out.println("email " + email);
                System.out.println("phoneNumber " + phoneNumber);
                System.out.println("userId " + userId);


                User user = new User();
                user.setUserId(userId);
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setEmail(email);
                user.setPhoneNumber(phoneNumber);
                user.setUserType(userType);

                boolean success = UserDAO.updateUser(user);

                if (success) {
                    System.out.println("success");

                }

            } catch (Exception e) {
                System.err.println("Error updating user: " + e.getMessage());
                throw new ServletException("Failed to update user", e);
            }
        }
        else if ("delete".equals(action)) {
            try
            {
                int userId = Integer.parseInt(request.getParameter("userId"));
                boolean success = UserDAO.deleteUser(userId);
                if (success) {
                    System.out.println("success");
                    users = UserDAO.getAllUsers();
                    getServletContext().setAttribute("users", users);
                }
                else{

                    System.out.println("failed to delete user");
                }
            }
            catch (Exception e)
            {
                System.err.println("Error deleting user: " + e.getMessage());
            }
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manage-user.jsp").forward(request, response);
    }
}
