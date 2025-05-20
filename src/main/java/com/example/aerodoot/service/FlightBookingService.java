package com.example.aerodoot.service;

import com.example.aerodoot.util.FlashMessageUtil;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class FlightBookingService {

    public static Date convertDepartureDate(HttpServletRequest request, String departureDateStr) {
        Date departureDate = null;
        try {
            // Removing ordinal suffixes (st, nd, rd, th)
            departureDateStr = departureDateStr.replaceAll("(\\d+)(st|nd|rd|th)", "$1");

            // Format of the date string "May 5th, 2025" -> "May 5, 2025"
            SimpleDateFormat sdf = new SimpleDateFormat("MMM d, yyyy", Locale.ENGLISH);
            java.util.Date utilDate = sdf.parse(departureDateStr);
            departureDate = new java.sql.Date(utilDate.getTime());
        } catch (ParseException e) {
            FlashMessageUtil.setError(request.getSession(), e.getMessage());
            e.printStackTrace();
            System.out.println("Error parsing date: " + departureDateStr);
        }
        return departureDate;
    }

    public static Date convertReturnDate(HttpServletRequest request, String returnDateStr) {
        Date returnDate = null;
        try {
            // Removing ordinal suffixes (st, nd, rd, th)
            returnDateStr = returnDateStr.replaceAll("(\\d+)(st|nd|rd|th)", "$1");

            // Format of the date string "May 5th, 2025" -> "May 5, 2025"
            SimpleDateFormat sdf = new SimpleDateFormat("MMM d, yyyy", Locale.ENGLISH);
            java.util.Date utilDate = sdf.parse(returnDateStr);
            returnDate = new java.sql.Date(utilDate.getTime());
        } catch (ParseException e) {
            FlashMessageUtil.setError(request.getSession(), e.getMessage());
            e.printStackTrace();
            System.out.println("Error parsing date: " + returnDateStr);
        }

        return returnDate;
    }
}
