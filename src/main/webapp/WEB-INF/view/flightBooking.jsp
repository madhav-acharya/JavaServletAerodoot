<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:include page="../../header.jsp"/>

<div class="container">
    <header class="flight-booking-header">
        <h1>Flight Search</h1>
        <p>Search for available flights and book your next trip.</p>
    </header>

    <jsp:include page="../../BookingContainer.jsp" />

    <c:if test="${not empty flightLists}">
        <div class="flight-search-wrapper">
            <h1 class="flight-search-title">Available Flights</h1>

            <c:forEach var="flight" items="${flightLists}" varStatus="status">
                <div class="ba-flight-container" data-flight-index="${status.index}">
                    <div class="ba-flight-header">
                        <div class="ba-airline-info">
                            <div class="ba-airline-name">
                                <h2>${airlineMap[flight.airlineId]}</h2>
                                <p>${flight.flightNumber}</p>
                            </div>
                        </div>

                        <div class="ba-flight-time">
                            <div class="ba-time-location">
                                <div class="ba-time">${flight.departureTime}</div>
                                <div class="ba-location">${flight.departureLocation}</div>
                            </div>

                            <div class="ba-duration">
                                <div class="ba-duration-line"></div>
                                <div class="ba-duration-text">${flight.duration} mins</div>
                                <div class="ba-flight-type">Non Stop</div>
                            </div>

                            <div class="ba-time-location">
                                <div class="ba-time">${flight.arrivalTime}</div>
                                <div class="ba-location">${flight.arrivalLocation}</div>
                            </div>
                        </div>

                        <div class="ba-price-info">
                            <div class="ba-price">NPR ${flight.economyPrice}</div>
                            <div class="ba-price-subtext">price per person (incl. taxes)</div>
                            <button class="ba-book-btn">Book Now</button>
                        </div>
                    </div>

                    <div class="ba-view-details-btn">
                        View Flight Details <span class="ba-arrow-icon"></span>
                    </div>

                    <div class="ba-flight-details">
                        <div class="ba-tabs">
                            <div class="ba-tab active" data-tab="itinerary-${status.index}">Flight Itinerary</div>
                            <div class="ba-tab" data-tab="fare-${status.index}">Fare Breakdown</div>
                            <div class="ba-tab" data-tab="baggage-${status.index}">Baggage</div>
                        </div>

                        <div class="ba-tab-content active" id="itinerary-${status.index}">
                            <div class="ba-itinerary-content">
                                <div class="ba-itinerary-header">Flight Details</div>

                                <div class="ba-journey-visual">
                                    <div class="ba-journey-cities">
                                        <div>
                                            <div class="ba-journey-city">${flight.departureLocation}</div>
                                            <div class="ba-journey-time">${flight.departureTime}</div>
                                        </div>
                                        <div>
                                            <div class="ba-journey-city">${flight.arrivalLocation}</div>
                                            <div class="ba-journey-time">${flight.arrivalTime}</div>
                                        </div>
                                    </div>
                                    <div class="ba-journey-line">
                                        <div class="ba-journey-progress"></div>
                                    </div>
                                </div>

                                <div class="ba-flight-info-grid">
                                    <div class="ba-flight-info-item">
                                        <div class="ba-info-label">Airline:</div>
                                        <div class="ba-info-value">${airlineMap[flight.airlineId]}</div>
                                    </div>
                                    <div class="ba-flight-info-item">
                                        <div class="ba-info-label">Airline:</div>
                                        <div class="ba-info-value">${aircraftMap[flight.aircraftId]}</div>
                                    </div>
                                    <div class="ba-flight-info-item">
                                        <div class="ba-info-label">Flight No:</div>
                                        <div class="ba-info-value">${flight.flightNumber}</div>
                                    </div>
                                    <div class="ba-flight-info-item">
                                        <div class="ba-info-label">Date:</div>
                                        <div class="ba-info-value">${flight.flightDate}</div>
                                    </div>
                                    <div class="ba-flight-info-item">
                                        <div class="ba-info-label">Duration:</div>
                                        <div class="ba-info-value">${flight.duration} minutes</div>
                                    </div>
                                    <div class="ba-flight-info-item">
                                        <div class="ba-info-label">Departure:</div>
                                        <div class="ba-info-value">${flight.departureLocation} - ${flight.departureTime}</div>
                                    </div>
                                    <div class="ba-flight-info-item">
                                        <div class="ba-info-label">Arrival:</div>
                                        <div class="ba-info-value">${flight.arrivalLocation} - ${flight.arrivalTime}</div>
                                    </div>
                                    <div class="ba-flight-info-item">
                                        <div class="ba-info-label">Type:</div>
                                        <div class="ba-info-value">Non Stop</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="ba-tab-content" id="fare-${status.index}">
                            <div class="ba-fare-item">
                                <div class="ba-fare-label">Economy Class</div>
                                <div class="ba-fare-value">NRs. ${flight.economyPrice}</div>
                            </div>
                            <div class="ba-fare-item">
                                <div class="ba-fare-label">Business Class</div>
                                <div class="ba-fare-value">NRs. ${flight.businessPrice}</div>
                            </div>
                        </div>

                        <div class="ba-tab-content" id="baggage-${status.index}">
                            <table class="ba-baggage-table">
                                <thead>
                                <tr>
                                    <th>Airlines</th>
                                    <th>Route</th>
                                    <th>Baggage</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>${airlineMap[flight.airlineId]}</td>
                                    <td>${flight.departureLocation} to ${flight.arrivalLocation}</td>
                                    <td>15 KG</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Select all flight containers
        const flightContainers = document.querySelectorAll('.ba-flight-container');

        // Add event listeners to each flight container
        flightContainers.forEach(container => {
            const viewDetailsBtn = container.querySelector('.ba-view-details-btn');
            const flightDetails = container.querySelector('.ba-flight-details');
            const tabs = container.querySelectorAll('.ba-tab');

            // Toggle flight details
            viewDetailsBtn.addEventListener('click', function() {
                flightDetails.classList.toggle('active');

                if (flightDetails.classList.contains('active')) {
                    viewDetailsBtn.innerHTML = 'Hide Flight Details <span class="ba-arrow-icon up"></span>';
                } else {
                    viewDetailsBtn.innerHTML = 'View Flight Details <span class="ba-arrow-icon"></span>';
                }
            });

            // Handle tabs for this specific flight container
            tabs.forEach(tab => {
                tab.addEventListener('click', function() {
                    const tabId = this.getAttribute('data-tab');

                    // Remove active class from all tabs in this container
                    container.querySelectorAll('.ba-tab').forEach(t => {
                        t.classList.remove('active');
                    });

                    // Remove active class from all tab contents in this container
                    container.querySelectorAll('.ba-tab-content').forEach(tc => {
                        tc.classList.remove('active');
                    });

                    // Add active class to clicked tab
                    this.classList.add('active');

                    // Find and activate the corresponding tab content
                    const tabContent = document.getElementById(tabId);
                    if (tabContent) {
                        tabContent.classList.add('active');
                    }
                });
            });
        });
    });
</script>
<script src="${pageContext.request.contextPath}/assets/js/bookingContainer.js"></script>
<jsp:include page="../../tail.jsp" />