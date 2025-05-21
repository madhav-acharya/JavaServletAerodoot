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
<jsp:include page="../../../includes/toast.jsp" />
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
            <li class="sidebar-menu-item">
                <a href="${pageContext.request.contextPath}/home" >
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                        <polyline points="16 17 21 12 16 7"></polyline>
                        <line x1="21" y1="12" x2="9" y2="12"></line>
                    </svg>
                    Exit Agent
                </a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="agent-booking-container">
        <h1 class="page-title">Create New Booking</h1>

        <div class="form-card">
            <form action="${pageContext.request.contextPath}/agent/booking" method="post">
                <!-- Passenger Selection -->
                <div class="form-group">
                    <label for="passenger" class="form-label">Select Passenger</label>
                    <select id="passenger" name="userId" class="form-select">
                        <option value="">Select Passenger</option>
                        <c:forEach var="passenger" items="${passengers}">
                            <option value="${passenger.userId}" >
                                    ${passenger.firstName} ${passenger.lastName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Flight Selection -->
                <div class="form-group">
                    <label for="flight" class="form-label">Select Flight</label>
                    <select id="flight" name="flightNumber" class="form-select">
                        <option value="">Select Flight</option>
                        <c:forEach var="flight" items="${flights}">
                            <option
                                    value="${flight.flightNumber}"
                                    data-economy-price="${flight.economyPrice}"
                                    data-business-price="${flight.businessPrice}">
                                    ${flight.flightNumber} (${flight.departureLocation} to ${flight.arrivalLocation}, ${flight.departureTime})
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Class Type -->
                <div class="form-group">
                    <label class="form-label">Select Class</label>
                    <div class="radio-group">
                        <div class="radio-option">
                            <input id="economy" name="seatClass" type="radio" value="ECONOMY" checked>
                            <label for="economy">Economy</label>
                        </div>
                        <div class="radio-option">
                            <input id="business" name="seatClass" type="radio" value="BUSINESS">
                            <label for="business">Business</label>
                        </div>
                    </div>
                </div>

                <!-- Number of Seats -->
                <div class="form-group">
                    <label for="seats" class="form-label">Number of Seats</label>
                    <input type="number" id="seats" name="passengerCount"  value="1" class="form-input">
                </div>

                <!-- Total Price -->
                <div class="form-group">
                    <label for="totalPrice" class="form-label">Total Price (NPR)</label>
                    <input type="number" step="0.01" id="totalPrice"  name="paymentAmount" class="form-input" readonly required>
                </div>

                <!-- Payment Method -->
                <div class="form-group">
                    <label class="form-label">Payment Method</label>
                    <div class="radio-group">
                        <div class="radio-option">
                            <input id="esewa" name="paymentMethod" type="radio" value="ESEWA" checked>
                            <label for="esewa">eSewa</label>
                        </div>
                        <div class="radio-option">
                            <input id="khalti" name="paymentMethod" type="radio" value="KHALTI">
                            <label for="khalti">Khalti</label>
                        </div>
                    </div>
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
                        <th>Booking Date</th>
                        <th>Class Type</th>
                        <th>Seats Booked</th>
                        <th>Booking Status</th>
                        <th>Total Price</th>
                        <th>Flight ID</th>
                        <th>Passenger ID</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="booking" items="${bookings}">
                        <tr>
                            <td>${booking.bookingId}</td>
                            <td>${booking.bookingDate}</td>
                            <td>${booking.classType}</td>
                            <td>${booking.seatsBooked}</td>
                            <td>
                                <span class="status-badge
                                    ${booking.bookingStatus == 'Confirmed' ? 'status-confirmed' : 'status-pending'}">
                                        ${booking.bookingStatus}
                                </span>
                            </td>
                            <td>
                                    ${'Rs.'}${booking.totalPrice}
                            </td>
                            <td>${booking.flightId}</td>
                            <td>${booking.passengerId}</td>
                            <td>
                                <a href="viewBooking.jsp?id=${booking.bookingId}" class="link">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/agent.js"></script>
<script>
    const flightSelect = document.getElementById('flight');
    const classRadios = document.getElementsByName('classType');
    const seatsInput = document.getElementById('seats');
    const totalPriceInput = document.getElementById('totalPrice');

    function updateTotalPrice() {
        const selectedOption = flightSelect.options[flightSelect.selectedIndex];
        const seats = parseInt(seatsInput.value) || 0;
        let pricePerSeat = 0;

        if (selectedOption) {
            const selectedClass = [...classRadios].find(r => r.checked)?.value;
            pricePerSeat = selectedClass === 'BUSINESS'
                ? parseFloat(selectedOption.getAttribute('data-business-price')) || 0
                : parseFloat(selectedOption.getAttribute('data-economy-price')) || 0;
        }

        const total = pricePerSeat * seats;
        totalPriceInput.value = total.toFixed(2);
    }

    flightSelect.addEventListener('change', updateTotalPrice);
    seatsInput.addEventListener('input', updateTotalPrice);
    classRadios.forEach(radio => radio.addEventListener('change', updateTotalPrice));
</script>
</body>
</html>
