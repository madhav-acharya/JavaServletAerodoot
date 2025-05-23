<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 20/04/2025
  Time: 11:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserType</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/userType.css">
</head>
<body>
<jsp:include page="../../includes/toast.jsp" />
<div class="container">
    <h1>Select Your User Type</h1>
    <form action="${pageContext.request.contextPath}/select-usertype" method="post">
        <% if (request.getAttribute("error") != null) { %>
        <div style="background-color: #ffe6e6; color: #cc0000; border: 1px solid #cc0000; padding: 12px 16px; border-radius: 8px; margin-bottom: 1rem; font-size: 15px; display: flex; align-items: center; gap: 10px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">
            <i class="fas fa-exclamation-circle" style="font-size: 18px; color: #cc0000;"></i>
            <%= request.getAttribute("error") %>
        </div>
        <% } %>
        <div class="user-type-selection">
            <div class="user-type-option" id="agent-option">
                <input type="radio" id="agent" name="userType" value="agent">
                <label for="agent">
                    <div class="icon-container">
                        <i class="user-icon agent-icon">👨‍💼</i>
                    </div>
                    <h2>Agent</h2>
                    <p>Access provider tools and manage bookings</p>
                </label>
            </div>

            <div class="user-type-option" id="passenger-option">
                <input type="radio" id="passenger" name="userType" value="passenger">
                <label for="passenger">
                    <div class="icon-container">
                        <i class="user-icon passenger-icon">🧳</i>
                    </div>
                    <h2>Passenger</h2>
                    <p>Book tickets and manage your travels</p>
                </label>
            </div>
        </div>

        <div class="button-container">
            <button type="submit" class="submit-button">Continue</button>
        </div>
    </form>
</div>
</body>
</html>
