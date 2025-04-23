package com.example.aerodoot.controller;

import com.example.aerodoot.dao.AgentDAO;
import com.example.aerodoot.dao.CompanyDAO;
import com.example.aerodoot.model.Agent;
import com.example.aerodoot.model.Company;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;

@WebServlet("/register-agent")
@MultipartConfig
public class AgentRegistrationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doGet of agent");
        System.out.println("doGet of company in agent");
        try {
            List<Company> companies = CompanyDAO.getAllCompanies();
            System.out.println("companies " + companies);
            request.setAttribute("companies", companies);
            request.getRequestDispatcher("/WEB-INF/view/agentRegistration.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("ERROR in CompanyDAO.getAllCompanies(): " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong");
        }
        request.getRequestDispatcher("/WEB-INF/view/agentRegistration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        System.out.println("values "+ request.getParameter("position") + " " + request.getParameter("licenseNumber") + " " + request.getParameter("companyId") + " " + request.getSession().getAttribute("userId"));
        String position = request.getParameter("position");
        String licenseNumber = request.getParameter("licenseNumber");
        Part profilePicturePart = request.getPart("profilePicture");
        int companyId = Integer.parseInt(request.getParameter("companyId"));
        if(request.getSession().getAttribute("userId") == null) {
            request.setAttribute("error", "Unauthorized");
            request.getRequestDispatcher("/WEB-INF/view/agentRegistration.jsp").forward(request, response);
        }
        int userId = (int) request.getSession().getAttribute("userId");

        byte[] profilePicture = null;
        if (profilePicturePart != null) {
            try (InputStream inputStream = profilePicturePart.getInputStream()) {
                profilePicture = new byte[inputStream.available()];
                inputStream.read(profilePicture);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        if(position == null || licenseNumber == null || companyId == 0 || userId == 0 ) {
            request.setAttribute("error", "Please fill all the required fields");
            request.getRequestDispatcher("/WEB-INF/view/agentRegistration.jsp").forward(request, response);
        }

        Agent agent = new Agent(position, licenseNumber, profilePicture, companyId, userId);
        int generatedAgentId = AgentDAO.createAgent(agent);
        System.out.println(position + " " + licenseNumber + " " + profilePicture + " " + companyId + " " + userId);
        if (generatedAgentId > 0) {

            request.setAttribute("message", "Agent registered successfully!");
            request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Failed to register agent.");
            List<Company> companies = CompanyDAO.getAllCompanies();
            System.out.println("companies " + companies);
            request.setAttribute("companies", companies);
            request.getRequestDispatcher("/WEB-INF/view/agentRegistration.jsp").forward(request, response);
        }
    }


}
