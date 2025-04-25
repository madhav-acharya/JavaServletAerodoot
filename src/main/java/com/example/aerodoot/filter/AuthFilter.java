package com.example.aerodoot.filter;

import com.example.aerodoot.dao.UserDAO;
import com.example.aerodoot.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebFilter("/*")
public class  AuthFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String uri = req.getRequestURI();

        Boolean isLogged = false;

        if (session != null) {
            Object loggedAttr = session.getAttribute("isLoggedIn");
            if (loggedAttr instanceof Boolean) {
                isLogged = (Boolean) loggedAttr;
            }
        }

        if (Boolean.TRUE.equals(isLogged)) {

            User user;
            try {
                user = UserDAO.getUserByUserIdOnly( (int) session.getAttribute("userId"));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            String userType = user.getUserType();

            if (uri.contains("login") || uri.contains("register") || uri.contains("select-usertype")) {
                if ("ADMIN".equals(userType)) {
                    res.sendRedirect(req.getContextPath() + "/admin/dashboard");
                } else if ("AGENT".equals(userType)) {
                    res.sendRedirect(req.getContextPath() + "/agent/dashboard");  // Redirect to Agent Dashboard
                } else if ("PASSENGER".equals(userType)) {
                    res.sendRedirect(req.getContextPath() + "/home");
                }
                return;
            }
            chain.doFilter(request, response);
        } else {
            if (uri.startsWith(req.getContextPath() + "/admin")
                    || uri.startsWith(req.getContextPath() + "/agent")
                    || uri.startsWith(req.getContextPath() + "/passenger")) {
                // Redirect the user to login page if they try to access a restricted page
                res.sendRedirect(req.getContextPath() + "/login");
            } else {
                // Allow access to other public pages like login/signup
                chain.doFilter(request, response);
            }
        }
    }

    public void destroy() {
    }
}
