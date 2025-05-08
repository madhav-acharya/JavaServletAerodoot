<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="page" value="" />
<c:choose>
    <c:when test="${pageContext.request.requestURI.contains('flight')}">
        <c:set var="page" value="flight" />

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
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2h-4a2 2 0 0 1-2-2v-4H9v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                        </svg>
                        Home
                    </a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/flight-booking" class="nav-link ${page == 'flight' ? 'active' : ''}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                            <path d="M2.5 19.5l19-7-19-7v6l14 1-14 1v6z"></path>
                        </svg>
                        Flights
                    </a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/contact" class="nav-link ${page == 'contact' ? 'active' : ''}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                            <path d="M21 10c0 8-9 13-9 13S3 18 3 10a9 9 0 0 1 18 0z"></path>
                            <circle cx="12" cy="10" r="3"></circle>
                        </svg>
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
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                    <path d="M3 13h2v-2H3v2zm0 4h2v-2H3v2zm0-8h2V7H3v2zm4 8h14V5H7v14z"></path>
                                </svg>
                                Dashboard
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/logout" class="nav-link">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                    <polyline points="16 17 21 12 16 7"></polyline>
                                    <line x1="21" y1="12" x2="9" y2="12"></line>
                                </svg>
                                Logout
                            </a>
                        </li>

                    </c:when>


                    <c:otherwise>
                        <%-- If not logged in, show login and register options --%>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/login" class="nav-link">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                    <path d="M15 3h4a2 2 0 0 1 2 2v4"></path>
                                    <path d="M10 14L21 3"></path>
                                    <path d="M21 3v4h-4"></path>
                                    <path d="M3 21v-4a2 2 0 0 1 2-2h4"></path>
                                    <path d="M14 10L3 21"></path>
                                    <path d="M3 21h4v-4"></path>
                                </svg>
                                Login
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/register" class="nav-link">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                    <path d="M12 5v14m7-7H5"></path>
                                </svg>
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
