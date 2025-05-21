<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 21/05/2025
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Agent Booking Dashboard</title>
    <link rel="stylesheet" href="../css/agent.css">
</head>
<body>
<div class="dashboard-container">
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <h2 class="logo">AeroDoot</h2>
            <button id="sidebar-toggle" class="sidebar-toggle">☰</button>
        </div>

        <div class="agent-profile">
            <div class="agent-avatar">
                <div class="avatar-placeholder">
                    <c:out value="${agent.firstName.charAt(0)}${agent.lastName.charAt(0)}"/>
                </div>
            </div>
            <div class="agent-info">
                <h3><c:out value="${agent.firstName} ${agent.lastName}"/></h3>
                <p><c:out value="${agent.position}"/></p>
                <p class="agent-license">License: <c:out value="${agent.licenseNumber}"/></p>
            </div>
        </div>

        <nav class="sidebar-nav">
            <ul>
                <li>
                    <a href="agentDashboard.jsp" class="nav-link">
                        <i class="fas fa-chart-line"></i>
                        <span>Analytics</span>
                    </a>
                </li>
                <li class="active">
                    <a href="agentBooking.jsp" class="nav-link">
                        <i class="fas fa-ticket"></i>
                        <span>Booking</span>
                    </a>
                </li>
            </ul>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <div class="content-header">
            <div class="header-search">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search flights...">
            </div>
            <div class="header-actions">
                <div class="notifications">
                    <i class="fas fa-bell"></i>
                    <span class="notification-badge">3</span>
                </div>
                <div class="date-time" id="current-date"></div>
            </div>
        </div>

        <div class="tab-content">
            <!-- Flight Search Form -->
            <div class="flight-search-form">
                <form action="searchFlights" method="POST">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="passenger">Select Passenger</label>
                            <select id="passenger" name="passengerId" required>
                                <option value="">Choose a passenger</option>
                                <c:forEach items="${passengers}" var="passenger">
                                    <option value="${passenger.passengerId}">
                                            ${passenger.firstName} ${passenger.lastName} - ${passenger.passportNumber}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="departure">From</label>
                            <select id="departure" name="departureLocation" required>
                                <option value="">Select departure</option>
                                <c:forEach items="${locations}" var="location">
                                    <option value="${location}">${location}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="swap-button">
                            <button type="button" id="swap-destinations">
                                <i class="fas fa-exchange-alt"></i>
                            </button>
                        </div>

                        <div class="form-group">
                            <label for="arrival">To</label>
                            <select id="arrival" name="arrivalLocation" required>
                                <option value="">Select destination</option>
                                <c:forEach items="${locations}" var="location">
                                    <option value="${location}">${location}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="date">Date</label>
                            <input type="date" id="date" name="flightDate" required>
                        </div>

                        <div class="form-group">
                            <label for="classType">Class</label>
                            <select id="classType" name="classType" required>
                                <option value="">Select class</option>
                                <option value="ECONOMY">Economy</option>
                                <option value="BUSINESS">Business</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="seats">Number of Seats</label>
                            <input type="number" id="seats" name="seatsBooked" min="1" max="9" required>
                        </div>

                        <div class="search-button-group">
                            <button type="submit" class="btn-primary">
                                <i class="fas fa-search"></i>
                                Search Flights
                            </button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Flight Results -->
            <div class="flight-results">
                <h3>Available Flights</h3>

                <div class="flight-filters">
                    <button class="filter-btn active">All</button>
                    <button class="filter-btn">Morning</button>
                    <button class="filter-btn">Afternoon</button>
                    <button class="filter-btn">Evening</button>

                    <div class="sort-dropdown">
                        <label for="sort">Sort by:</label>
                        <select id="sort">
                            <option value="price">Price</option>
                            <option value="duration">Duration</option>
                            <option value="departure">Departure Time</option>
                        </select>
                    </div>
                </div>

                <div class="flight-cards">
                    <c:forEach items="${flights}" var="flight">
                        <div class="flight-card">
                            <div class="flight-header">
                                <div class="airline-info">
                                    <div class="airline-logo">
                                        <i class="fas fa-plane"></i>
                                    </div>
                                    <div class="airline-details">
                                        <h4>${flight.airline.name}</h4>
                                        <span class="flight-number">${flight.flightNumber}</span>
                                    </div>
                                </div>
                            </div>

                            <div class="flight-details">
                                <div class="flight-route">
                                    <div class="departure">
                                        <div class="time">${flight.departureTime}</div>
                                        <div class="airport">${flight.departureLocation}</div>
                                        <div class="date">
                                            <fmt:formatDate value="${flight.flightDate}" pattern="MMM dd, yyyy"/>
                                        </div>
                                    </div>

                                    <div class="flight-path">
                                        <div class="duration">${flight.duration} mins</div>
                                        <div class="path-line">
                                            <div class="plane-icon">
                                                <i class="fas fa-plane"></i>
                                            </div>
                                        </div>
                                        <div class="flight-type">Direct Flight</div>
                                    </div>

                                    <div class="arrival">
                                        <div class="time">${flight.arrivalTime}</div>
                                        <div class="airport">${flight.arrivalLocation}</div>
                                        <div class="date">
                                            <fmt:formatDate value="${flight.flightDate}" pattern="MMM dd, yyyy"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="flight-pricing">
                                    <div class="price-info">
                                        <div class="price">
                                            $${flight.classType == 'ECONOMY' ? flight.economyPrice : flight.businessPrice}
                                        </div>
                                        <div class="price-type">${flight.classType}</div>
                                    </div>
                                    <div class="availability">
                                        <div class="seats-left">
                                                ${flight.classType == 'ECONOMY' ? flight.availableSeatsEconomy : flight.availableSeatsBusiness} seats left
                                        </div>
                                        <button class="btn-primary select-flight"
                                                onclick="selectFlight(${flight.flightId})">
                                            Select Flight
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </main>
</div>

<script src="${pageContext.request.contextPath}/assets/js/agent.js"></script>
</body>
</html>
