<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="navbar">
    <div class="container-main">
        <div class="navbar-brand">
            <a href="#" class="logo">

                <span class="logo-icon">✈</span> AeroDoot
            </a>
        </div>
        <div class="navbar-menu" id="navbarMenu">
            <ul class="navbar-nav">
                <li class="nav-item"><a href="${pageContext.request.contextPath}/home" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/passenger-dashboard" class="nav-link">Dashboard</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/login" class="nav-link">Login</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/register" class="nav-link">Register</a></li>
            </ul>
        </div>
        <div class="navbar-toggle" id="navbarToggle">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </div>
    </div>
</nav>
