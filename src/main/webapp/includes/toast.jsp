<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 19/05/2025
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- /common/toast.jsp -->
<%
    String toastMessage = (String) session.getAttribute("toastMessage");
    String toastType = (String) session.getAttribute("toastType");

    if (toastMessage != null && toastType != null) {
        session.removeAttribute("toastMessage");
        session.removeAttribute("toastType");
%>
<div id="toast" class="toast <%= toastType %>"><%= toastMessage %></div>
<script>
    window.onload = function() {
        const toast = document.getElementById("toast");
        toast.classList.add("show");
        setTimeout(() => {
            toast.classList.remove("show");
        }, 3000);
    };
</script>
<% } %>

<style>
    .toast {
        visibility: hidden;
        min-width: 250px;
        background-color: #333;
        color: #fff;
        text-align: center;
        border-radius: 8px;
        padding: 16px;
        position: fixed;
        z-index: 9999;
        left: 50%;
        transform: translateX(-50%);
        top: 1rem;
        font-size: 16px;
        opacity: 0;
        transition: opacity 0.5s ease, top 0.5s ease;
    }
    .toast.show {
        visibility: visible;
        opacity: 1;
        top: 5rem;
    }
    .toast.success { background-color: #28a745; }
    .toast.error { background-color: #dc3545; }
</style>

