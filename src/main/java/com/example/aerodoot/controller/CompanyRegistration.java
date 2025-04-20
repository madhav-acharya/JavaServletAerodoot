package com.example.aerodoot.controller;

import com.example.aerodoot.dao.CompanyDAO;
import com.example.aerodoot.model.Company;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register-company")
public class CompanyRegistration extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String companyName = request.getParameter("companyName");
        String companyEmail = request.getParameter("companyEmail");
        String companyAddress = request.getParameter("companyAddress");
        String contactNumber = request.getParameter("contactNumber");
        String website = request.getParameter("website");
        String registrationNumber = request.getParameter("registrationNumber");

        Company company = new Company(companyName, companyEmail, companyAddress, contactNumber, website, registrationNumber);
        int companyId = CompanyDAO.createCompany(company);
        request.getSession().setAttribute("companyId", companyId);

        System.out.println(companyId + companyName + companyEmail + companyAddress + contactNumber + website + registrationNumber);
        if (companyId > 0) {
            request.getRequestDispatcher("/WEB-INF/view/agentRegistration.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/view/companyRegistration.jsp").forward(request, response);
        }
    }
}
