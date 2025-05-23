package com.example.aerodoot.controller;

import com.example.aerodoot.dao.CompanyDAO;
import com.example.aerodoot.dao.UserDAO;
import com.example.aerodoot.model.Company;
import com.example.aerodoot.util.FlashMessageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/select-usertype")
public class UserTypeSelectionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/userType.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost of user type");
        System.out.println("doPost of company in agent of user type");

        String userType = request.getParameter("userType");

        if(userType == null) {
            FlashMessageUtil.setError(request.getSession(), "userType is required");
            request.setAttribute("error", "Please select one userType");
            request.getRequestDispatcher("/WEB-INF/view/userType.jsp").forward(request, response);
        }

        System.out.println(userType);
        if (userType.equals("passenger")) {
            FlashMessageUtil.setSuccess(request.getSession(), "Registering as Passenger");
            request.getRequestDispatcher("/WEB-INF/view/passengerRegistration.jsp").forward(request, response);
        }
        else if (userType.equals("agent")) {
            try {
                FlashMessageUtil.setSuccess(request.getSession(), "Registering as Agent");
                List<Company> companies = CompanyDAO.getAllCompanies();
                System.out.println("companies " + companies);
                request.setAttribute("companies", companies);
                request.getRequestDispatcher("/WEB-INF/view/agentRegistration.jsp").forward(request, response);
            } catch (Exception e) {
                FlashMessageUtil.setError(request.getSession(), e.getMessage());
                System.out.println("ERROR in CompanyDAO.getAllCompanies(): " + e.getMessage());
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong");
            }
            // Get parameters from the request (from a form or AJAX)
            System.out.println(request.getParameter("userType"));
            System.out.println(request.getSession().getAttribute("userId"));
            int userId = (int) request.getSession().getAttribute("userId");
            String newUserType = request.getParameter("userType");

            // Call DAO method
            boolean success = UserDAO.changeUserType(userId, newUserType);

            // Set response based on result
            if (success) {
                FlashMessageUtil.setSuccess(request.getSession(), "User Type Changed Successfully");
                request.setAttribute("message", "User type updated successfully!");
                if ("agent".equals(newUserType)) {
                    request.getRequestDispatcher("/WEB-INF/view/agentRegistration.jsp").forward(request, response);
                }

            } else {
                FlashMessageUtil.setError(request.getSession(), "User Type Changed Failed!");
                System.out.println("User Type Updation  failed" + userId);
                request.setAttribute("message", "Failed to update user type.");
            }
        }


        // Forward to a JSP or redirect as needed

    }
}