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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/admin/manage-aircraft.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("It's post for aircraft");
        String action = request.getParameter("action");
        System.out.println("action: " + action);

        if ("add".equals(action)) {
            System.out.println("in create");
            try {
                String model = request.getParameter("model");
                String manufacturer = request.getParameter("manufacturer");
                int seatCapacityEconomy = Integer.parseInt(request.getParameter("seatCapacityEconomy"));
                int seatCapacityBusiness = Integer.parseInt(request.getParameter("seatCapacityBusiness"));
                java.sql.Date lastMaintenanceDate = java.sql.Date.valueOf(request.getParameter("lastMaintenanceDate"));
                int airlineId = Integer.parseInt(request.getParameter("airlineId"));

                Aircraft aircraft = new Aircraft();
                aircraft.setModel(model);
                aircraft.setManufacturer(manufacturer);
                aircraft.setSeatCapacityEconomy(seatCapacityEconomy);
                aircraft.setSeatCapacityBusiness(seatCapacityBusiness);
                aircraft.setLastMaintenanceDate(lastMaintenanceDate);
                aircraft.setAirlineId(airlineId);

                int createdAircraftId = AircraftDAO.createAircraft(aircraft);

                if (createdAircraftId >= 0) {
                    System.out.println("Aircraft creation successful");
                    aircrafts = AircraftDAO.getAllAircraft();
                    getServletContext().setAttribute("aircrafts", aircrafts);
                } else {
                    System.out.println("Failed to create aircraft");
                }

            } catch (Exception e) {
                System.err.println("Error creating aircraft: " + e.getMessage());
                throw new ServletException("Failed to create aircraft", e);
            }
        }
        else if ("update".equals(action)) {
            System.out.println("in update");
            try {
                int aircraftId = Integer.parseInt(request.getParameter("aircraftId"));
                String model = request.getParameter("model");
                String manufacturer = request.getParameter("manufacturer");
                int seatCapacityEconomy = Integer.parseInt(request.getParameter("seatCapacityEconomy"));
                int seatCapacityBusiness = Integer.parseInt(request.getParameter("seatCapacityBusiness"));
                java.sql.Date lastMaintenanceDate = java.sql.Date.valueOf(request.getParameter("lastMaintenanceDate"));
                int airlineId = Integer.parseInt(request.getParameter("airlineId"));

                Aircraft aircraft = new Aircraft();
                aircraft.setAircraftId(aircraftId);
                aircraft.setModel(model);
                aircraft.setManufacturer(manufacturer);
                aircraft.setSeatCapacityEconomy(seatCapacityEconomy);
                aircraft.setSeatCapacityBusiness(seatCapacityBusiness);
                aircraft.setLastMaintenanceDate(lastMaintenanceDate);
                aircraft.setAirlineId(airlineId);

                int updateAircraftResult = AircraftDAO.updateAircraft(aircraft);

                if (updateAircraftResult >= 0) {
                    System.out.println("Aircraft update successful");
                    aircrafts = AircraftDAO.getAllAircraft();
                    getServletContext().setAttribute("aircrafts", aircrafts);
                }

            } catch (Exception e) {
                System.err.println("Error updating aircraft: " + e.getMessage());
                throw new ServletException("Failed to update aircraft", e);
            }
        }
        else if ("delete".equals(action)) {
            System.out.println("in delete");
            try {
                int aircraftId = Integer.parseInt(request.getParameter("aircraftId"));
                boolean success = AircraftDAO.deleteAircraft(aircraftId);
                if (success) {
                    System.out.println("Aircraft delete successful");
                    aircrafts = AircraftDAO.getAllAircraft();
                    getServletContext().setAttribute("aircrafts", aircrafts);
                } else {
                    System.out.println("Failed to delete aircraft");
                }
            } catch (Exception e) {
                System.err.println("Error deleting aircraft: " + e.getMessage());
            }
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manage-aircraft.jsp").forward(request, response);
    }

}
