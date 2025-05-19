package com.example.aerodoot.controller;

import com.example.aerodoot.dao.AirlineDAO;
import com.example.aerodoot.model.Airline;
import com.example.aerodoot.util.FlashMessageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manage-airline")
public class ManageAirlineServlet extends HttpServlet {
    private List<Airline> airlines;

    @Override
    public void init() throws ServletException {
        System.out.println("AirlineInitServlet: Initialization started...");
        try {
            airlines = AirlineDAO.getAllAirlines();
            getServletContext().setAttribute("airlines", airlines);
            System.out.println("Airlines loaded successfully.");
        } catch (Exception e) {
            throw new ServletException("Airline initialization failed", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/admin/manage-airline.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("It's post for airline");
        String action = request.getParameter("action");
        System.out.println("action: " + action);

        if ("add".equals(action)) {
            System.out.println("in create");
            try {
                String name = request.getParameter("name");
                String headquarters = request.getParameter("headquarters");
                String contactNumber = request.getParameter("contactNumber");
                String email = request.getParameter("email");

                Airline airline = new Airline();
                airline.setName(name);
                airline.setHeadquarters(headquarters);
                airline.setContactNumber(contactNumber);
                airline.setEmail(email);

                if (name == null || name.isEmpty() || headquarters == null || headquarters.isEmpty() || contactNumber == null || contactNumber.isEmpty() || email == null || email.isEmpty()) {
                    FlashMessageUtil.setError(request.getSession(), "Please fill all the fields");
                }

                int createdAirlineId = AirlineDAO.createAirline(airline);

                if (createdAirlineId >= 0) {
                    FlashMessageUtil.setSuccess(request.getSession(), "Airline created successfully");
                    System.out.println("Airline creation successful");
                    airlines = AirlineDAO.getAllAirlines();
                    getServletContext().setAttribute("airlines", airlines);
                    response.sendRedirect(request.getContextPath() + "/admin/manage-airline");
                    return;
                } else {
                    FlashMessageUtil.setError(request.getSession(), "Error creating airline");
                    System.out.println("Failed to create airline");
                }

            } catch (Exception e) {
                FlashMessageUtil.setError(request.getSession(), e.getMessage());
                System.err.println("Error creating airline: " + e.getMessage());
                throw new ServletException("Failed to create airline", e);
            }
        }
        else if ("update".equals(action)) {
            System.out.println("in update");
            try {
                int airlineId = Integer.parseInt(request.getParameter("airlineId"));
                String name = request.getParameter("name");
                String headquarters = request.getParameter("headquarters");
                String contactNumber = request.getParameter("contactNumber");
                String email = request.getParameter("email");

                Airline airline = new Airline();
                airline.setAirlineId(airlineId);
                airline.setName(name);
                airline.setHeadquarters(headquarters);
                airline.setContactNumber(contactNumber);
                airline.setEmail(email);

                int updateAirlineResult = AirlineDAO.updateAirline(airline);

                if (updateAirlineResult == 0) {
                    FlashMessageUtil.setSuccess(request.getSession(), "Airline updated successfully");
                    System.out.println("Airline update successful");
                    airlines = AirlineDAO.getAllAirlines();
                    getServletContext().setAttribute("airlines", airlines);
                    response.sendRedirect(request.getContextPath() + "/admin/manage-airline");
                    return;
                }
                else{
                    FlashMessageUtil.setError(request.getSession(), "Error updating airline");
                }

            } catch (Exception e) {
                FlashMessageUtil.setError(request.getSession(), e.getMessage());
                System.err.println("Error updating airline: " + e.getMessage());
                throw new ServletException("Failed to update airline", e);
            }
        }
        else if ("delete".equals(action)) {
            System.out.println("in delete");
            try {
                int airlineId = Integer.parseInt(request.getParameter("airlineId"));
                boolean success = AirlineDAO.deleteAirline(airlineId);
                if (success) {
                    FlashMessageUtil.setSuccess(request.getSession(), "Airline deleted successfully");
                    System.out.println("Airline delete successful");
                    airlines = AirlineDAO.getAllAirlines();
                    getServletContext().setAttribute("airlines", airlines);
                    response.sendRedirect(request.getContextPath() + "/admin/manage-airline");
                    return;
                } else {
                    FlashMessageUtil.setError(request.getSession(), "Error deleting airline");
                    System.out.println("Failed to delete airline");
                }
            } catch (Exception e) {
                FlashMessageUtil.setError(request.getSession(), e.getMessage());
                System.err.println("Error deleting airline: " + e.getMessage());
            }
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manage-airline.jsp").forward(request, response);
    }

}
