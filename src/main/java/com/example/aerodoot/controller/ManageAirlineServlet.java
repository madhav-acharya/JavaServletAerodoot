package com.example.aerodoot.controller;

import com.example.aerodoot.dao.AirlineDAO;
import com.example.aerodoot.model.Airline;
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/admin/manage-airline.jsp").forward(request, response);
    }
}
