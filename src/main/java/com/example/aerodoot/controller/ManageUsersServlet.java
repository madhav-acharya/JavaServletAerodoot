package com.example.aerodoot.controller;

import com.example.aerodoot.dao.UserDAO;
import com.example.aerodoot.model.User;
import com.example.aerodoot.util.FlashMessageUtil;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manage-user")
public class ManageUsersServlet extends HttpServlet {
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
        request.setAttribute("users", users);
        request.getRequestDispatcher("/WEB-INF/view/admin/manage-user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("It's post");
        String action = request.getParameter("action");
        System.out.println("action " + action);

        if ("update".equals(action))
        {
            System.out.println("in update");
            try {
                int userId = Integer.parseInt(request.getParameter("userId"));
                String firstName = request.getParameter("firstName");

                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phoneNumber");
                String userType = request.getParameter("userType");

                User user = new User();
                user.setUserId(userId);
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setEmail(email);
                user.setPhoneNumber(phoneNumber);
                user.setUserType(userType);

                int updateUserId = UserDAO.updateUser(user);

                if (updateUserId >= 0) {
                    FlashMessageUtil.setSuccess(request.getSession(), "User updated successfully");
                    System.out.println("success");
                    users = UserDAO.getAllUsers();
                    getServletContext().setAttribute("users", users);
                }
                else{
                    FlashMessageUtil.setError(request.getSession(), "Error updating Users");
                }

            } catch (Exception e) {
                FlashMessageUtil.setError(request.getSession(), e.getMessage());
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
                    FlashMessageUtil.setSuccess(request.getSession(), "User deleted successfully");
                    System.out.println("success");
                    users = UserDAO.getAllUsers();
                    getServletContext().setAttribute("users", users);
                }
                else{
                    FlashMessageUtil.setError(request.getSession(), "Error deleting Users");
                    System.out.println("failed to delete user");
                }
            }
            catch (Exception e)
            {
                FlashMessageUtil.setError(request.getSession(), e.getMessage());
                System.err.println("Error deleting user: " + e.getMessage());
            }
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manage-user.jsp").forward(request, response);
    }
}
