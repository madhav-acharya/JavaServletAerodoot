<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>


<%--<jsp:include page="../../header.jsp"/>--%>

<%--<div class="container">--%>
<%--    <header class="flight-booking-header">--%>
<%--        <h1>Flight Search</h1>--%>
<%--        <p>Search for available flights and book your next trip.</p>--%>
<%--    </header>--%>

<%--    <jsp:include page="../../BookingContainer.jsp" />--%>

<%--    <c:if test="${not empty flightLists}">--%>
<%--        <div class="flight-search-wrapper">--%>
<%--            <h1 class="flight-search-title">Available Flights</h1>--%>

<%--            <c:forEach var="flight" items="${flightLists}" begin="0" end="0">--%>
<%--                <h2 class="flight-search-title">Flights from ${flight.departureLocation} to ${flight.arrivalLocation}</h2>--%>
<%--                <div class="flight-info-data">--%>
<%--                    <span>${departureDate}</span>--%>
<%--                    <c:if test="${returnDate ne '0'}">--%>
<%--                    <span>•</span>--%>
<%--                    <span>${returnDate}</span>--%>
<%--                    </c:if>--%>
<%--                    <span>•</span>--%>
<%--                    <span>${trip}</span>--%>
<%--                    <span>•</span>--%>
<%--                    <span id="passenger-count">${passenger}</span>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>

<%--            <c:forEach var="flight" items="${flightLists}" varStatus="status">--%>
<%--                <div class="ba-flight-container" data-flight-index="${status.index}">--%>
<%--                    <div class="ba-flight-header">--%>
<%--                        <div class="ba-airline-info">--%>
<%--                            <div class="ba-airline-name">--%>
<%--                                <h2>${airlineMap[flight.airlineId]}</h2>--%>
<%--                                <p>${flight.flightNumber}</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="ba-flight-time">--%>
<%--                            <div class="ba-time-location">--%>
<%--                                <div class="ba-time">${flight.departureTime}</div>--%>
<%--                                <div class="ba-location">${flight.departureLocation}</div>--%>
<%--                            </div>--%>

<%--                            <div class="ba-duration">--%>
<%--                                <div class="ba-duration-line"></div>--%>
<%--                                <div class="ba-duration-text">${flight.duration} mins</div>--%>
<%--                                <div class="ba-flight-type">Non Stop</div>--%>
<%--                            </div>--%>

<%--                            <div class="ba-time-location">--%>
<%--                                <div class="ba-time">${flight.arrivalTime}</div>--%>
<%--                                <div class="ba-location">${flight.arrivalLocation}</div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="ba-price-info">--%>
<%--                            <div class="ba-price">NPR ${flight.economyPrice}</div>--%>
<%--                            <div class="ba-price-subtext">price per person (incl. taxes)</div>--%>
<%--                            <button class="ba-book-btn" id="bookNowBtn">Book Now</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="ba-view-details-btn">--%>
<%--                        View Flight Details <span class="ba-arrow-icon"></span>--%>
<%--                    </div>--%>

<%--                    <div class="ba-flight-details">--%>
<%--                        <div class="ba-tabs">--%>
<%--                            <div class="ba-tab active" data-tab="itinerary-${status.index}">Flight Itinerary</div>--%>
<%--                            <div class="ba-tab" data-tab="fare-${status.index}">Fare Breakdown</div>--%>
<%--                            <div class="ba-tab" data-tab="baggage-${status.index}">Baggage</div>--%>
<%--                        </div>--%>

<%--                        <div class="ba-tab-content active" id="itinerary-${status.index}">--%>
<%--                            <div class="ba-itinerary-content">--%>
<%--                                <div class="ba-itinerary-header">Flight Details</div>--%>

<%--                                <div class="ba-journey-visual">--%>
<%--                                    <div class="ba-journey-cities">--%>
<%--                                        <div>--%>
<%--                                            <div class="ba-journey-city">${flight.departureLocation}</div>--%>
<%--                                            <div class="ba-journey-time">${flight.departureTime}</div>--%>
<%--                                        </div>--%>
<%--                                        <div>--%>
<%--                                            <div class="ba-journey-city">${flight.arrivalLocation}</div>--%>
<%--                                            <div class="ba-journey-time">${flight.arrivalTime}</div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="ba-journey-line">--%>
<%--                                        <div class="ba-journey-progress"></div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <div class="ba-flight-info-grid">--%>
<%--                                    <div class="ba-flight-info-item">--%>
<%--                                        <div class="ba-info-label">Airline:</div>--%>
<%--                                        <div class="ba-info-value">${airlineMap[flight.airlineId]}</div>--%>
<%--                                    </div>--%>
<%--                                    <div class="ba-flight-info-item">--%>
<%--                                        <div class="ba-info-label">Airline:</div>--%>
<%--                                        <div class="ba-info-value">${aircraftMap[flight.aircraftId]}</div>--%>
<%--                                    </div>--%>
<%--                                    <div class="ba-flight-info-item">--%>
<%--                                        <div class="ba-info-label">Flight No:</div>--%>
<%--                                        <div class="ba-info-value">${flight.flightNumber}</div>--%>
<%--                                    </div>--%>
<%--                                    <div class="ba-flight-info-item">--%>
<%--                                        <div class="ba-info-label">Date:</div>--%>
<%--                                        <div class="ba-info-value">${flight.flightDate}</div>--%>
<%--                                    </div>--%>
<%--                                    <div class="ba-flight-info-item">--%>
<%--                                        <div class="ba-info-label">Duration:</div>--%>
<%--                                        <div class="ba-info-value">${flight.duration} minutes</div>--%>
<%--                                    </div>--%>
<%--                                    <div class="ba-flight-info-item">--%>
<%--                                        <div class="ba-info-label">Departure:</div>--%>
<%--                                        <div class="ba-info-value">${flight.departureLocation} - ${flight.departureTime}</div>--%>
<%--                                    </div>--%>
<%--                                    <div class="ba-flight-info-item">--%>
<%--                                        <div class="ba-info-label">Arrival:</div>--%>
<%--                                        <div class="ba-info-value">${flight.arrivalLocation} - ${flight.arrivalTime}</div>--%>
<%--                                    </div>--%>
<%--                                    <div class="ba-flight-info-item">--%>
<%--                                        <div class="ba-info-label">Type:</div>--%>
<%--                                        <div class="ba-info-value">Non Stop</div>--%>
<%--                                    </div>--%>
<%--                                    <div class="ba-flight-info-item">--%>
<%--                                        <div class="ba-info-label">Available Economy seat:</div>--%>
<%--                                        <div class="ba-info-value economy-price">${flight.availableSeatsEconomy}</div>--%>
<%--                                    </div>--%>
<%--                                    <div class="ba-flight-info-item">--%>
<%--                                        <div class="ba-info-label">Available Business seat:</div>--%>
<%--                                        <div class="ba-info-value business-price">${flight.availableSeatsBusiness}</div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="ba-tab-content" id="fare-${status.index}">--%>
<%--                            <div class="ba-fare-item">--%>
<%--                                <div class="ba-fare-label">Economy Class</div>--%>
<%--                                <div class="ba-fare-value" id="economyPrice">NRs. ${flight.economyPrice}</div>--%>
<%--                            </div>--%>
<%--                            <div class="ba-fare-item">--%>
<%--                                <div class="ba-fare-label">Business Class</div>--%>
<%--                                <div class="ba-fare-value" id="businessPrice">NRs. ${flight.businessPrice}</div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="ba-tab-content" id="baggage-${status.index}">--%>
<%--                            <table class="ba-baggage-table">--%>
<%--                                <thead>--%>
<%--                                <tr>--%>
<%--                                    <th>Airlines</th>--%>
<%--                                    <th>Route</th>--%>
<%--                                    <th>Baggage</th>--%>
<%--                                </tr>--%>
<%--                                </thead>--%>
<%--                                <tbody>--%>
<%--                                <tr>--%>
<%--                                    <td>${airlineMap[flight.airlineId]}</td>--%>
<%--                                    <td>${flight.departureLocation} to ${flight.arrivalLocation}</td>--%>
<%--                                    <td>15 KG</td>--%>
<%--                                </tr>--%>
<%--                                </tbody>--%>
<%--                            </table>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <!-- Modal Overlay -->--%>
<%--                <div id="paymentModal" class="modal-overlay">--%>
<%--                    <div class="modal">--%>
<%--                        <!-- Modal Header -->--%>
<%--                        <div class="modal-header-payment">--%>
<%--                            <h2 class="modal-title">Complete Your Booking</h2>--%>
<%--                            <p class="modal-subtitle">Select a payment method to complete your booking for flight ${flight.flightNumber}</p>--%>
<%--                            <button class="close-btn" id="closeModal"><i class="fas fa-times"></i></button>--%>
<%--                        </div>--%>

<%--                        <!-- Modal Body -->--%>
<%--                        <div class="modal-body-payment">--%>
<%--                            <!-- Flight Details -->--%>
<%--                            <div class="section">--%>
<%--                                <h3 class="section-title">Flight Details</h3>--%>
<%--                                <div class="flight-detail-payment">--%>
<%--                                    <p class="flight-route">${flight.departureLocation} → ${flight.arrivalLocation}</p>--%>
<%--                                    <p class="flight-route">${passenger}</p>--%>
<%--                                </div>--%>
<%--                                <div class="total-amount-payment">--%>
<%--                                    <span>Total Amount:</span>--%>
<%--                                    <span id="totalFareDisplay"></span>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <!-- Class Selection -->--%>
<%--                            <div class="section">--%>
<%--                                <h3 class="section-title">Select Class</h3>--%>
<%--                                <div class="radio-group" id="classOptions">--%>
<%--                                    <label class="radio-option selected" data-value="economy">--%>
<%--                                        <input type="radio" name="class" value="economy" checked>--%>
<%--                                        <div class="payment-label">--%>
<%--                                            <div class="payment-name">Economy Class</div>--%>
<%--                                            <div class="class-price" id="EconomySeatPricePerPerson"><span></span></div>--%>
<%--                                        </div>--%>
<%--                                    </label>--%>

<%--                                    <label class="radio-option" data-value="business">--%>
<%--                                        <input type="radio" name="class" value="business">--%>
<%--                                        <div class="payment-label">--%>
<%--                                            <div class="payment-name">Business Class</div>--%>
<%--                                            <div class="class-price" id="BusinessSeatPricePerPerson"><span></span></div>--%>
<%--                                        </div>--%>
<%--                                    </label>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <!-- Payment Method -->--%>
<%--                            <div class="section">--%>
<%--                                <h3 class="section-title">Select Payment Method</h3>--%>
<%--                                <div class="radio-group" id="paymentOptions">--%>
<%--                                    <label class="radio-option selected" data-value="eSewa">--%>
<%--                                        <input type="radio" name="payment" value="eSewa" checked>--%>
<%--                                        <div class="payment-icon esewa-icon">--%>
<%--                                            <i class="fas fa-wallet"></i>--%>
<%--                                        </div>--%>
<%--                                        <div class="payment-label">--%>
<%--                                            <div class="payment-name">eSewa</div>--%>
<%--                                            <div class="payment-description">Pay with eSewa digital wallet</div>--%>
<%--                                        </div>--%>
<%--                                    </label>--%>

<%--                                    <label class="radio-option" data-value="Khalti">--%>
<%--                                        <input type="radio" name="payment" value="Khalti">--%>
<%--                                        <div class="payment-icon khalti-icon">--%>
<%--                                            <i class="fas fa-wallet"></i>--%>
<%--                                        </div>--%>
<%--                                        <div class="payment-label">--%>
<%--                                            <div class="payment-name">Khalti</div>--%>
<%--                                            <div class="payment-description">Pay with Khalti digital wallet</div>--%>
<%--                                        </div>--%>
<%--                                    </label>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <!-- Payment Amount -->--%>
<%--                            <div class="section">--%>
<%--                                <h3 class="section-title">Enter Payment Amount (in NRs)</h3>--%>
<%--                                <div class="form-group">--%>
<%--                                    <input type="text" id="paymentAmount" class="form-input" placeholder="Enter correct amount">--%>
<%--                                    <div id="errorMessage" class="error-message">--%>
<%--                                        <i class="fas fa-exclamation-circle"></i>--%>
<%--                                        <span></span>--%>
<%--                                    </div>--%>
<%--                                    <p class="form-hint">Amount must match the flight price exactly.</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <!-- Modal Footer -->--%>
<%--                        <div class="modal-footer-payment">--%>
<%--                            <button id="cancelBtn" class="btn-payment btn-cancel">Cancel</button>--%>
<%--                            <button id="payNowBtn" class="btn-payment btn-pay" disabled>Pay Now</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>

<%--    </c:if>--%>

<%--    <c:if test="${flightNumbers == 0}">--%>
<%--        <div class="flight-not-found-container">--%>
<%--            <div class="flight-not-found-icon">--%>
<%--                <i class="fas fa-plane-slash"></i>--%>
<%--            </div>--%>
<%--            <h2 class="flight-not-found-title">No Flights Found</h2>--%>

<%--            <div class="flight-route">--%>
<%--                <div class="flight-location">${departureLocation}</div>--%>
<%--                <div class="flight-arrow"><i class="fas fa-long-arrow-alt-right"></i></div>--%>
<%--                <div class="flight-location">${arrivalLocation}</div>--%>
<%--            </div>--%>

<%--            <div class="flight-date">--%>
<%--                <i class="far fa-calendar-alt"></i> ${departureDate}--%>
<%--            </div>--%>

<%--            <p>We couldn't find any flights matching your criteria.</p>--%>

<%--            <p class="flight-suggestion">--%>
<%--                Try adjusting your search parameters or check nearby dates.--%>
<%--            </p>--%>
<%--        </div>--%>
<%--    </c:if>--%>

<%--</div>--%>
<%--<script>--%>
<%--    document.addEventListener('DOMContentLoaded', function() {--%>
<%--        // Select all flight containers--%>
<%--        const flightContainers = document.querySelectorAll('.ba-flight-container');--%>

<%--        // Add event listeners to each flight container--%>
<%--        flightContainers.forEach(container => {--%>
<%--            const viewDetailsBtn = container.querySelector('.ba-view-details-btn');--%>
<%--            const flightDetails = container.querySelector('.ba-flight-details');--%>
<%--            const tabs = container.querySelectorAll('.ba-tab');--%>

<%--            // Toggle flight details--%>
<%--            viewDetailsBtn.addEventListener('click', function() {--%>
<%--                flightDetails.classList.toggle('active');--%>

<%--                if (flightDetails.classList.contains('active')) {--%>
<%--                    viewDetailsBtn.innerHTML = 'Hide Flight Details <span class="ba-arrow-icon up"></span>';--%>
<%--                } else {--%>
<%--                    viewDetailsBtn.innerHTML = 'View Flight Details <span class="ba-arrow-icon"></span>';--%>
<%--                }--%>
<%--            });--%>

<%--            // Handle tabs for this specific flight container--%>
<%--            tabs.forEach(tab => {--%>
<%--                tab.addEventListener('click', function() {--%>
<%--                    const tabId = this.getAttribute('data-tab');--%>

<%--                    // Remove active class from all tabs in this container--%>
<%--                    container.querySelectorAll('.ba-tab').forEach(t => {--%>
<%--                        t.classList.remove('active');--%>
<%--                    });--%>

<%--                    // Remove active class from all tab contents in this container--%>
<%--                    container.querySelectorAll('.ba-tab-content').forEach(tc => {--%>
<%--                        tc.classList.remove('active');--%>
<%--                    });--%>

<%--                    // Add active class to clicked tab--%>
<%--                    this.classList.add('active');--%>

<%--                    // Find and activate the corresponding tab content--%>
<%--                    const tabContent = document.getElementById(tabId);--%>
<%--                    if (tabContent) {--%>
<%--                        tabContent.classList.add('active');--%>
<%--                    }--%>
<%--                });--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/payment.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/bookingContainer.js"></script>--%>
<%--<jsp:include page="../../tail.jsp" />--%>

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

            <c:forEach var="flight" items="${flightLists}" begin="0" end="0">
                <h2 class="flight-search-title">Flights from ${flight.departureLocation} to ${flight.arrivalLocation}</h2>
                <div class="flight-info-data">
                    <span>${departureDate}</span>
                    <c:if test="${returnDate ne '0'}">
                        <span>•</span>
                        <span>${returnDate}</span>
                    </c:if>
                    <span>•</span>
                    <span>${trip}</span>
                    <span>•</span>
                    <span id="passenger-count">${passenger}</span>
                </div>
            </c:forEach>

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
                            <button class="ba-book-btn" data-flight-index="${status.index}">Book Now</button>
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
                                    <div class="ba-flight-info-item">
                                        <div class="ba-info-label">Available Economy seat:</div>
                                        <div class="ba-info-value economy-price">${flight.availableSeatsEconomy}</div>
                                    </div>
                                    <div class="ba-flight-info-item">
                                        <div class="ba-info-label">Available Business seat:</div>
                                        <div class="ba-info-value business-price">${flight.availableSeatsBusiness}</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="ba-tab-content" id="fare-${status.index}">
                            <div class="ba-fare-item">
                                <div class="ba-fare-label">Economy Class</div>
                                <div class="ba-fare-value economy-price-value" id="economyPrice-${status.index}">NRs. ${flight.economyPrice}</div>
                            </div>
                            <div class="ba-fare-item">
                                <div class="ba-fare-label">Business Class</div>
                                <div class="ba-fare-value business-price-value" id="businessPrice-${status.index}">NRs. ${flight.businessPrice}</div>
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

                <!-- Modal Overlay - Unique ID for each flight -->
                <div id="paymentModal-${status.index}" class="modal-overlay payment-modal">
                    <div class="modal">
                        <!-- Modal Header -->
                        <div class="modal-header-payment">
                            <h2 class="modal-title">Complete Your Booking</h2>
                            <p class="modal-subtitle">Select a payment method to complete your booking for flight ${flight.flightNumber}</p>
                            <button class="close-btn" data-modal-id="${status.index}"><i class="fas fa-times"></i></button>
                        </div>

                        <!-- Modal Body -->
                        <div class="modal-body-payment">
                            <!-- Flight Details -->
                            <div class="section">
                                <h3 class="section-title">Flight Details</h3>
                                <div class="flight-detail-payment">
                                    <p class="flight-route">${flight.departureLocation} → ${flight.arrivalLocation}</p>
                                    <p class="flight-route">${passenger}</p>
                                </div>
                                <div class="total-amount-payment">
                                    <span>Total Amount:</span>
                                    <span class="total-fare-display" id="totalFareDisplay-${status.index}"></span>
                                </div>
                            </div>

                            <!-- Class Selection -->
                            <div class="section">
                                <h3 class="section-title">Select Class</h3>
                                <div class="radio-group class-options" id="classOptions-${status.index}">
                                    <label class="radio-option selected" data-value="economy">
                                        <input type="radio" name="class-${status.index}" value="economy" checked>
                                        <div class="payment-label">
                                            <div class="payment-name">Economy Class</div>
                                            <div class="class-price economy-seat-price" id="EconomySeatPricePerPerson-${status.index}"><span></span></div>
                                        </div>
                                    </label>

                                    <label class="radio-option" data-value="business">
                                        <input type="radio" name="class-${status.index}" value="business">
                                        <div class="payment-label">
                                            <div class="payment-name">Business Class</div>
                                            <div class="class-price business-seat-price" id="BusinessSeatPricePerPerson-${status.index}"><span></span></div>
                                        </div>
                                    </label>
                                </div>
                            </div>

                            <!-- Payment Method -->
                            <div class="section">
                                <h3 class="section-title">Select Payment Method</h3>
                                <div class="radio-group payment-options" id="paymentOptions-${status.index}">
                                    <label class="radio-option selected" data-value="eSewa">
                                        <input type="radio" name="payment-${status.index}" value="eSewa" checked>
                                        <div class="payment-icon esewa-icon">
                                            <i class="fas fa-wallet"></i>
                                        </div>
                                        <div class="payment-label">
                                            <div class="payment-name">eSewa</div>
                                            <div class="payment-description">Pay with eSewa digital wallet</div>
                                        </div>
                                    </label>

                                    <label class="radio-option" data-value="Khalti">
                                        <input type="radio" name="payment-${status.index}" value="Khalti">
                                        <div class="payment-icon khalti-icon">
                                            <i class="fas fa-wallet"></i>
                                        </div>
                                        <div class="payment-label">
                                            <div class="payment-name">Khalti</div>
                                            <div class="payment-description">Pay with Khalti digital wallet</div>
                                        </div>
                                    </label>
                                </div>
                            </div>

                            <!-- Payment Amount -->
                            <div class="section">
                                <h3 class="section-title">Enter Payment Amount (in NRs)</h3>
                                <div class="form-group">
                                    <input type="text" class="form-input payment-amount" id="paymentAmount-${status.index}" placeholder="Enter correct amount">
                                    <div class="error-message" id="errorMessage-${status.index}">
                                        <i class="fas fa-exclamation-circle"></i>
                                        <span></span>
                                    </div>
                                    <p class="form-hint">Amount must match the flight price exactly.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Modal Footer -->
                        <div class="modal-footer-payment">
                            <button class="btn-payment btn-cancel cancel-btn" data-modal-id="${status.index}">Cancel</button>
                            <button class="btn-payment btn-pay pay-now-btn" id="payNowBtn-${status.index}" disabled>Pay Now</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

    </c:if>

    <c:if test="${flightNumbers == 0}">
        <div class="flight-not-found-container">
            <div class="flight-not-found-icon">
                <i class="fas fa-plane-slash"></i>
            </div>
            <h2 class="flight-not-found-title">No Flights Found</h2>

            <div class="flight-route">
                <div class="flight-location">${departureLocation}</div>
                <div class="flight-arrow"><i class="fas fa-long-arrow-alt-right"></i></div>
                <div class="flight-location">${arrivalLocation}</div>
            </div>

            <div class="flight-date">
                <i class="far fa-calendar-alt"></i> ${departureDate}
            </div>

            <p>We couldn't find any flights matching your criteria.</p>

            <p class="flight-suggestion">
                Try adjusting your search parameters or check nearby dates.
            </p>
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
<script src="${pageContext.request.contextPath}/assets/js/payment.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bookingContainer.js"></script>
<jsp:include page="../../tail.jsp" />