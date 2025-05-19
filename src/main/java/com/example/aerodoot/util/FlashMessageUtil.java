package com.example.aerodoot.util;

import jakarta.servlet.http.HttpSession;

public class FlashMessageUtil {
    public static void setSuccess(HttpSession session, String message) {
        session.setAttribute("toastMessage", message);
        session.setAttribute("toastType", "success");
    }
g
    public static void setError(HttpSession session, String message) {
        session.setAttribute("toastMessage", message);
        session.setAttribute("toastType", "error");
    }
}
