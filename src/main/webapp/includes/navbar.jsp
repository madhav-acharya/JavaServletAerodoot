<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="page" value="" />
<c:choose>
    <c:when test="${pageContext.request.requestURI.contains('flight')}">
        <c:set var="page" value="flight" />

    </c:when>
    <c:when test="${pageContext.request.requestURI.contains('about')}">
        <c:set var="page" value="about" />
    </c:when>
    <c:when test="${pageContext.request.requestURI.contains('contact')}">
        <c:set var="page" value="contact" />
    </c:when>
    <c:otherwise>
        <c:set var="page" value="home" />
    </c:otherwise>
</c:choose>
<nav class="navbar">
    <div class="container-main">
        <div class="navbar-brand">
            <a href="${pageContext.request.contextPath}/home" class="logo-navbar">
                <img src="${pageContext.request.contextPath}/assets/image/aerodoot-logo.svg" alt="AeroDoot Logo" class="logo" />
                AeroDoot
            </a>
        </div>


        <div class="navbar-menu" id="navbarMenu">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/home" class="nav-link ${page == 'home' ? 'active' : ''}">
                        <i class="fas fa-house icon"></i>
                        Home
                    </a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/flight-booking" class="nav-link ${page == 'flight' ? 'active' : ''}">
                        <i class="fas fa-jet-fighter icon"></i>
                        Flights
                    </a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/about-us" class="nav-link ${page == 'about' ? 'active' : ''}">
                        <i class="fas fa-info-circle icon"></i>
                        About Us
                    </a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/contact" class="nav-link ${page == 'contact' ? 'active' : ''}">
                        <i class="fas fa-location-dot icon"></i>
                        Contact
                    </a>
                </li>

                <c:choose>
                    <%-- This is a JSTL comment --%>
                    <c:when test="${sessionScope.isLoggedIn != null && sessionScope.isLoggedIn}">
                        <c:choose>
                            <c:when test='${sessionScope.userType == "ADMIN"}'>
                                <c:set var="dashboardLink" value="${pageContext.request.contextPath}/admin" />
                            </c:when>
                            <c:when test='${sessionScope.userType == "AGENT"}'>
                                <c:set var="dashboardLink" value="${pageContext.request.contextPath}/agent/dashboard" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="dashboardLink" value="${pageContext.request.contextPath}/passenger/dashboard" />
                            </c:otherwise>
                        </c:choose>

                        <li class="nav-item">
                            <a href="${dashboardLink}" class="nav-link">
                                <i class="fa-solid fa-tachograph-digital icon"></i>
                                Dashboard
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/logout" class="nav-link">
                                <i class="fa-solid fa-arrow-right-to-bracket icon"></i>
                                Logout
                            </a>
                        </li>

                    </c:when>


                    <c:otherwise>
                        <%-- If not logged in, show login and register options --%>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/login" class="nav-link">
                                <i class="fa-solid fa-right-to-bracket icon"></i>
                                Login
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/register" class="nav-link">
                                <i class="fa-solid fa-user-plus icon"></i>
                                Register
                            </a>
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
