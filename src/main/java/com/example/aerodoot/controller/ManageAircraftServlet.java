package com.example.aerodoot.controller;

import com.example.aerodoot.dao.AircraftDAO;
import com.example.aerodoot.model.Aircraft;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manage-aircraft")
public class ManageAircraftServlet extends HttpServlet {
    private List<Aircraft> aircrafts;

    @Override
    public void init() throws ServletException {
        System.out.println("AircraftInitServlet: Initialization started...");
        try {
            aircrafts = AircraftDAO.getAllAircraft();
            getServletContext().setAttribute("aircrafts", aircrafts);
            System.out.println("Aircrafts loaded successfully.");
        } catch (Exception e) {
            throw new ServletException("Aircraft initialization failed", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/admin/manage-aircraft.jsp").forward(request, response);
    }
}
