package com.example.aerodoot.controller;

import com.example.aerodoot.util.FlashMessageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        FlashMessageUtil.setSuccess(request.getSession(), "Logged out");

        if(session!=null){
            session.invalidate();
            request.getRequestDispatcher("/home.jsp").forward(request,response);
        }
    }
}