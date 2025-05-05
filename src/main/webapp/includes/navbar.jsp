<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar">
    <div class="container-main">
        <div class="navbar-brand">
            <a href="#" class="logo-navbar">

                <span class="logo-icon">✈</span> AeroDoot
            </a>
        </div>
        <div class="navbar-menu" id="navbarMenu">
            <ul class="navbar-nav">
                <li class="nav-item"><a href="${pageContext.request.contextPath}/home" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/flight-booking" class="nav-link">Flights</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/contact" class="nav-link">Contact</a></li>
                <c:choose>
                    <%-- This is a JSTL comment --%>
                    <c:when test="${sessionScope.isLoggedIn != null && sessionScope.isLoggedIn}">
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/passenger/dashboard" class="nav-link">Dashboard</a></li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/logout" class="nav-link">Logout</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <%-- If not logged in, show login and register options --%>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/login" class="nav-link">Login</a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/register" class="nav-link">Register</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        <div class="navbar-toggle" id="navbarToggle">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </div>
    </div>
</nav>
