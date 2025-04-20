package com.example.aerodoot.controller;

import com.example.aerodoot.dao.AgentDAO;
import com.example.aerodoot.model.Agent;
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

@WebServlet("/register-agent")
@MultipartConfig
public class AgentRegistrationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/agentRegistration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String position = request.getParameter("position");
        String licenseNumber = request.getParameter("licenseNumber");
        Part profilePicturePart = request.getPart("profilePicture");
        int companyId = (int) request.getSession().getAttribute("companyId");
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

        Agent agent = new Agent(position, licenseNumber, profilePicture, companyId, userId);
        int generatedAgentId = AgentDAO.createAgent(agent);
        System.out.println(position + " " + licenseNumber + " " + profilePicture + " " + companyId + " " + userId);
        if (generatedAgentId > 0) {

            request.setAttribute("message", "Agent registered successfully!");
            request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Failed to register agent.");
            request.getRequestDispatcher("/WEB-INF/view/agentRegistration.jsp").forward(request, response);
        }
    }
}
