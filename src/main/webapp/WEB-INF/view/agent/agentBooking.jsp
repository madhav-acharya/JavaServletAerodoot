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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/agent.css">
</head>
<body>
<div class="app-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2 class="sidebar-title">AeroDoot Agent</h2>
        </div>
        <ul class="sidebar-menu">
            <li class="sidebar-menu-item">
                <a href="${pageContext.request.contextPath}/agent/dashboard"  >
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z" />
                        <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z" />
                    </svg>
                    Dashboard
                </a>
            </li>
            <li class="sidebar-menu-item">
                <a href="${pageContext.request.contextPath}/agent/booking" class="active">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M4 3a2 2 0 100 4h12a2 2 0 100-4H4z" />
                        <path fill-rule="evenodd" d="M3 8h14v7a2 2 0 01-2 2H5a2 2 0 01-2-2V8zm5 3a1 1 0 011-1h2a1 1 0 110 2H9a1 1 0 01-1-1z" clip-rule="evenodd" />
                    </svg>
                    Bookings
                </a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="agent-booking-container">
        <h1 class="page-title">Create New Booking</h1>

        <div class="form-card">
            <form action="processBooking.jsp" method="post">
                <!-- Passenger Selection -->
                <div class="form-group">
                    <label for="passenger" class="form-label">Select Passenger</label>
                    <select id="passenger" name="passengerId" class="form-select">
                        <option value="">-- Select Passenger --</option>
                        <!-- These would be populated from database -->
                        <option value="1">John Doe (Passport: AB123456)</option>
                        <option value="2">Jane Smith (Passport: CD789012)</option>
                        <option value="3">Mike Johnson (Passport: EF345678)</option>
                    </select>
                </div>

                <!-- Flight Selection -->
                <div class="form-group">
                    <label for="flight" class="form-label">Select Flight</label>
                    <select id="flight" name="flightId" class="form-select">
                        <option value="">-- Select Flight --</option>
                        <!-- These would be populated from database -->
                        <option value="1">KTM-DEL-001 (Kathmandu to Delhi, 10:00 AM)</option>
                        <option value="2">KTM-BOM-002 (Kathmandu to Mumbai, 2:30 PM)</option>
                        <option value="3">KTM-BKK-003 (Kathmandu to Bangkok, 8:45 PM)</option>
                    </select>
                </div>

                <!-- Class Type -->
                <div class="form-group">
                    <label class="form-label">Select Class</label>
                    <div class="radio-group">
                        <div class="radio-option">
                            <input id="economy" name="classType" type="radio" value="ECONOMY" checked>
                            <label for="economy">Economy</label>
                        </div>
                        <div class="radio-option">
                            <input id="business" name="classType" type="radio" value="BUSINESS">
                            <label for="business">Business</label>
                        </div>
                    </div>
                </div>

                <!-- Number of Seats -->
                <div class="form-group">
                    <label for="seats" class="form-label">Number of Seats</label>
                    <input type="number" id="seats" name="seatsBooked" min="1" max="10" value="1" class="form-input">
                </div>

                <!-- Submit Button -->
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        Create Booking
                    </button>
                </div>
            </form>
        </div>

        <!-- Recent Bookings Table -->
        <div class="table-card">
            <div class="table-header">
                <h3 class="table-title">Recent Bookings</h3>
            </div>
            <div class="table-container">
                <table>
                    <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Passenger</th>
                        <th>Flight</th>
                        <th>Class</th>
                        <th>Seats</th>
                        <th>Status</th>
                        <th>Amount</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>B-1001</td>
                        <td>John Doe</td>
                        <td>KTM-DEL-001</td>
                        <td>Business</td>
                        <td>1</td>
                        <td>
                            <span class="status-badge status-confirmed">Confirmed</span>
                        </td>
                        <td>$850</td>
                        <td>
                            <a href="#" class="link">View</a>
                        </td>
                    </tr>
                    <tr>
                        <td>B-1002</td>
                        <td>Jane Smith</td>
                        <td>KTM-BOM-002</td>
                        <td>Economy</td>
                        <td>2</td>
                        <td>
                            <span class="status-badge status-pending">Pending</span>
                        </td>
                        <td>$320</td>
                        <td>
                            <a href="#" class="link">View</a>
                        </td>
                    </tr>
                    <tr>
                        <td>B-1003</td>
                        <td>Mike Johnson</td>
                        <td>KTM-BKK-003</td>
                        <td>Economy</td>
                        <td>3</td>
                        <td>
                            <span class="status-badge status-confirmed">Confirmed</span>
                        </td>
                        <td>$420</td>
                        <td>
                            <a href="#" class="link">View</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/agent.js"></script>
</body>
</html>
