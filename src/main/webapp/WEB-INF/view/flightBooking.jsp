<%--&lt;%&ndash;<%@ page contentType="text/html;charset=UTF-8" language="java" %>&ndash;%&gt;--%>
<%--&lt;%&ndash;<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>&ndash;%&gt;--%>


<%--&lt;%&ndash;<jsp:include page="../../header.jsp"/>&ndash;%&gt;--%>

<%--&lt;%&ndash;<div class="container">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <header class="flight-booking-header">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <h1>Flight Search</h1>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <p>Search for available flights and book your next trip.</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </header>&ndash;%&gt;--%>

<%--&lt;%&ndash;    <jsp:include page="../../BookingContainer.jsp" />&ndash;%&gt;--%>

<%--&lt;%&ndash;    <c:if test="${not empty flightLists}">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="flight-search-wrapper">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <h1 class="flight-search-title">Available Flights</h1>&ndash;%&gt;--%>

<%--&lt;%&ndash;            <c:forEach var="flight" items="${flightLists}" begin="0" end="0">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <h2 class="flight-search-title">Flights from ${flight.departureLocation} to ${flight.arrivalLocation}</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="flight-info-data">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <span>${departureDate}</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <c:if test="${returnDate ne '0'}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <span>•</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <span>${returnDate}</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <span>•</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <span>${trip}</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <span>•</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <span id="passenger-count">${passenger}</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </c:forEach>&ndash;%&gt;--%>

<%--&lt;%&ndash;            <c:forEach var="flight" items="${flightLists}" varStatus="status">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="ba-flight-container" data-flight-index="${status.index}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div class="ba-flight-header">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="ba-airline-info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="ba-airline-name">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <h2>${airlineMap[flight.airlineId]}</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <p>${flight.flightNumber}</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                        <div class="ba-flight-time">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="ba-time-location">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="ba-time">${flight.departureTime}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="ba-location">${flight.departureLocation}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                            <div class="ba-duration">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="ba-duration-line"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="ba-duration-text">${flight.duration} mins</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="ba-flight-type">Non Stop</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                            <div class="ba-time-location">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="ba-time">${flight.arrivalTime}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="ba-location">${flight.arrivalLocation}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                        <div class="ba-price-info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="ba-price">NPR ${flight.economyPrice}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="ba-price-subtext">price per person (incl. taxes)</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <button class="ba-book-btn" id="bookNowBtn">Book Now</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                    <div class="ba-view-details-btn">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        View Flight Details <span class="ba-arrow-icon"></span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                    <div class="ba-flight-details">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="ba-tabs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="ba-tab active" data-tab="itinerary-${status.index}">Flight Itinerary</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="ba-tab" data-tab="fare-${status.index}">Fare Breakdown</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="ba-tab" data-tab="baggage-${status.index}">Baggage</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                        <div class="ba-tab-content active" id="itinerary-${status.index}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="ba-itinerary-content">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="ba-itinerary-header">Flight Details</div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                <div class="ba-journey-visual">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="ba-journey-cities">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="ba-journey-city">${flight.departureLocation}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="ba-journey-time">${flight.departureTime}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="ba-journey-city">${flight.arrivalLocation}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="ba-journey-time">${flight.arrivalTime}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="ba-journey-line">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-journey-progress"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                <div class="ba-flight-info-grid">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="ba-flight-info-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-label">Airline:</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-value">${airlineMap[flight.airlineId]}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="ba-flight-info-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-label">Airline:</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-value">${aircraftMap[flight.aircraftId]}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="ba-flight-info-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-label">Flight No:</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-value">${flight.flightNumber}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="ba-flight-info-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-label">Date:</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-value">${flight.flightDate}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="ba-flight-info-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-label">Duration:</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-value">${flight.duration} minutes</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="ba-flight-info-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-label">Departure:</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-value">${flight.departureLocation} - ${flight.departureTime}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="ba-flight-info-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-label">Arrival:</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-value">${flight.arrivalLocation} - ${flight.arrivalTime}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="ba-flight-info-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-label">Type:</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-value">Non Stop</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="ba-flight-info-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-label">Available Economy seat:</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-value economy-price">${flight.availableSeatsEconomy}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="ba-flight-info-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-label">Available Business seat:</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="ba-info-value business-price">${flight.availableSeatsBusiness}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                        <div class="ba-tab-content" id="fare-${status.index}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="ba-fare-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="ba-fare-label">Economy Class</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="ba-fare-value" id="economyPrice">NRs. ${flight.economyPrice}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="ba-fare-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="ba-fare-label">Business Class</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="ba-fare-value" id="businessPrice">NRs. ${flight.businessPrice}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                        <div class="ba-tab-content" id="baggage-${status.index}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <table class="ba-baggage-table">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <thead>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <th>Airlines</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <th>Route</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <th>Baggage</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </thead>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <tbody>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <td>${airlineMap[flight.airlineId]}</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <td>${flight.departureLocation} to ${flight.arrivalLocation}</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <td>15 KG</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </tbody>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </table>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                <!-- Modal Overlay -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div id="paymentModal" class="modal-overlay">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div class="modal">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <!-- Modal Header -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="modal-header-payment">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <h2 class="modal-title">Complete Your Booking</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p class="modal-subtitle">Select a payment method to complete your booking for flight ${flight.flightNumber}</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <button class="close-btn" id="closeModal"><i class="fas fa-times"></i></button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                        <!-- Modal Body -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="modal-body-payment">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <!-- Flight Details -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="section">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <h3 class="section-title">Flight Details</h3>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="flight-detail-payment">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <p class="flight-route">${flight.departureLocation} → ${flight.arrivalLocation}</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <p class="flight-route">${passenger}</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="total-amount-payment">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <span>Total Amount:</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <span id="totalFareDisplay"></span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                            <!-- Class Selection -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="section">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <h3 class="section-title">Select Class</h3>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="radio-group" id="classOptions">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <label class="radio-option selected" data-value="economy">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <input type="radio" name="class" value="economy" checked>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="payment-label">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="payment-name">Economy Class</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="class-price" id="EconomySeatPricePerPerson"><span></span></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </label>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                    <label class="radio-option" data-value="business">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <input type="radio" name="class" value="business">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="payment-label">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="payment-name">Business Class</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="class-price" id="BusinessSeatPricePerPerson"><span></span></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                            <!-- Payment Method -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="section">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <h3 class="section-title">Select Payment Method</h3>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="radio-group" id="paymentOptions">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <label class="radio-option selected" data-value="eSewa">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <input type="radio" name="payment" value="eSewa" checked>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="payment-icon esewa-icon">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <i class="fas fa-wallet"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="payment-label">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="payment-name">eSewa</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="payment-description">Pay with eSewa digital wallet</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </label>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                    <label class="radio-option" data-value="Khalti">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <input type="radio" name="payment" value="Khalti">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="payment-icon khalti-icon">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <i class="fas fa-wallet"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="payment-label">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="payment-name">Khalti</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="payment-description">Pay with Khalti digital wallet</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                            <!-- Payment Amount -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="section">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <h3 class="section-title">Enter Payment Amount (in NRs)</h3>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="form-group">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <input type="text" id="paymentAmount" class="form-input" placeholder="Enter correct amount">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div id="errorMessage" class="error-message">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <i class="fas fa-exclamation-circle"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <span></span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <p class="form-hint">Amount must match the flight price exactly.</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                        <!-- Modal Footer -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="modal-footer-payment">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <button id="cancelBtn" class="btn-payment btn-cancel">Cancel</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <button id="payNowBtn" class="btn-payment btn-pay" disabled>Pay Now</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;    </c:if>&ndash;%&gt;--%>

<%--&lt;%&ndash;    <c:if test="${flightNumbers == 0}">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="flight-not-found-container">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="flight-not-found-icon">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <i class="fas fa-plane-slash"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <h2 class="flight-not-found-title">No Flights Found</h2>&ndash;%&gt;--%>

<%--&lt;%&ndash;            <div class="flight-route">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="flight-location">${departureLocation}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="flight-arrow"><i class="fas fa-long-arrow-alt-right"></i></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="flight-location">${arrivalLocation}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;            <div class="flight-date">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <i class="far fa-calendar-alt"></i> ${departureDate}&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;            <p>We couldn't find any flights matching your criteria.</p>&ndash;%&gt;--%>

<%--&lt;%&ndash;            <p class="flight-suggestion">&ndash;%&gt;--%>
<%--&lt;%&ndash;                Try adjusting your search parameters or check nearby dates.&ndash;%&gt;--%>
<%--&lt;%&ndash;            </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </c:if>&ndash;%&gt;--%>

<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script>&ndash;%&gt;--%>
<%--&lt;%&ndash;    document.addEventListener('DOMContentLoaded', function() {&ndash;%&gt;--%>
<%--&lt;%&ndash;        // Select all flight containers&ndash;%&gt;--%>
<%--&lt;%&ndash;        const flightContainers = document.querySelectorAll('.ba-flight-container');&ndash;%&gt;--%>

<%--&lt;%&ndash;        // Add event listeners to each flight container&ndash;%&gt;--%>
<%--&lt;%&ndash;        flightContainers.forEach(container => {&ndash;%&gt;--%>
<%--&lt;%&ndash;            const viewDetailsBtn = container.querySelector('.ba-view-details-btn');&ndash;%&gt;--%>
<%--&lt;%&ndash;            const flightDetails = container.querySelector('.ba-flight-details');&ndash;%&gt;--%>
<%--&lt;%&ndash;            const tabs = container.querySelectorAll('.ba-tab');&ndash;%&gt;--%>

<%--&lt;%&ndash;            // Toggle flight details&ndash;%&gt;--%>
<%--&lt;%&ndash;            viewDetailsBtn.addEventListener('click', function() {&ndash;%&gt;--%>
<%--&lt;%&ndash;                flightDetails.classList.toggle('active');&ndash;%&gt;--%>

<%--&lt;%&ndash;                if (flightDetails.classList.contains('active')) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                    viewDetailsBtn.innerHTML = 'Hide Flight Details <span class="ba-arrow-icon up"></span>';&ndash;%&gt;--%>
<%--&lt;%&ndash;                } else {&ndash;%&gt;--%>
<%--&lt;%&ndash;                    viewDetailsBtn.innerHTML = 'View Flight Details <span class="ba-arrow-icon"></span>';&ndash;%&gt;--%>
<%--&lt;%&ndash;                }&ndash;%&gt;--%>
<%--&lt;%&ndash;            });&ndash;%&gt;--%>

<%--&lt;%&ndash;            // Handle tabs for this specific flight container&ndash;%&gt;--%>
<%--&lt;%&ndash;            tabs.forEach(tab => {&ndash;%&gt;--%>
<%--&lt;%&ndash;                tab.addEventListener('click', function() {&ndash;%&gt;--%>
<%--&lt;%&ndash;                    const tabId = this.getAttribute('data-tab');&ndash;%&gt;--%>

<%--&lt;%&ndash;                    // Remove active class from all tabs in this container&ndash;%&gt;--%>
<%--&lt;%&ndash;                    container.querySelectorAll('.ba-tab').forEach(t => {&ndash;%&gt;--%>
<%--&lt;%&ndash;                        t.classList.remove('active');&ndash;%&gt;--%>
<%--&lt;%&ndash;                    });&ndash;%&gt;--%>

<%--&lt;%&ndash;                    // Remove active class from all tab contents in this container&ndash;%&gt;--%>
<%--&lt;%&ndash;                    container.querySelectorAll('.ba-tab-content').forEach(tc => {&ndash;%&gt;--%>
<%--&lt;%&ndash;                        tc.classList.remove('active');&ndash;%&gt;--%>
<%--&lt;%&ndash;                    });&ndash;%&gt;--%>

<%--&lt;%&ndash;                    // Add active class to clicked tab&ndash;%&gt;--%>
<%--&lt;%&ndash;                    this.classList.add('active');&ndash;%&gt;--%>

<%--&lt;%&ndash;                    // Find and activate the corresponding tab content&ndash;%&gt;--%>
<%--&lt;%&ndash;                    const tabContent = document.getElementById(tabId);&ndash;%&gt;--%>
<%--&lt;%&ndash;                    if (tabContent) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                        tabContent.classList.add('active');&ndash;%&gt;--%>
<%--&lt;%&ndash;                    }&ndash;%&gt;--%>
<%--&lt;%&ndash;                });&ndash;%&gt;--%>
<%--&lt;%&ndash;            });&ndash;%&gt;--%>
<%--&lt;%&ndash;        });&ndash;%&gt;--%>
<%--&lt;%&ndash;    });&ndash;%&gt;--%>
<%--&lt;%&ndash;</script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="${pageContext.request.contextPath}/assets/js/payment.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="${pageContext.request.contextPath}/assets/js/bookingContainer.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<jsp:include page="../../tail.jsp" />&ndash;%&gt;--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>


<%--<jsp:include page="../../header.jsp"/>--%>

<%--<div class="container">--%>
<%--    <header class="flight-booking-header">--%>
<%--        <h1>Flight Search</h1>--%>
<%--        <p>Search for available flights and book your next trip.</p>--%>
<%--    </header>--%>

<%--    <jsp:include page="../../includes/BookingContainer.jsp" />--%>

<%--    <c:if test="${not empty flightLists}">--%>
<%--        <div class="flight-search-wrapper">--%>
<%--            <h1 class="flight-search-title">Available Flights</h1>--%>

<%--            <c:forEach var="flight" items="${flightLists}" begin="0" end="0">--%>
<%--                <h2 class="flight-search-title">Flights from ${flight.departureLocation} to ${flight.arrivalLocation}</h2>--%>
<%--                <div class="flight-info-data">--%>
<%--                    <span>${departureDate}</span>--%>
<%--                    <c:if test="${returnDate ne '0'}">--%>
<%--                        <span>•</span>--%>
<%--                        <span>${returnDate}</span>--%>
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
<%--                            <button class="ba-book-btn" data-flight-index="${status.index}">Book Now</button>--%>
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
<%--                                <div class="ba-fare-value economy-price-value" id="economyPrice-${status.index}">NRs. ${flight.economyPrice}</div>--%>
<%--                            </div>--%>
<%--                            <div class="ba-fare-item">--%>
<%--                                <div class="ba-fare-label">Business Class</div>--%>
<%--                                <div class="ba-fare-value business-price-value" id="businessPrice-${status.index}">NRs. ${flight.businessPrice}</div>--%>
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

<%--                <!-- Payment Modal Overlay - Unique ID for each flight -->--%>
<%--                <div id="paymentModal-${status.index}" class="modal-overlay payment-modal">--%>
<%--                    <div class="modal">--%>
<%--                        <!-- Modal Header -->--%>
<%--                        <div class="modal-header-payment">--%>
<%--                            <h2 class="modal-title">Complete Your Booking</h2>--%>
<%--                            <p class="modal-subtitle">Select a payment method to complete your booking for flight ${flight.flightNumber}</p>--%>
<%--                            <button class="close-btn" data-modal-id="${status.index}"><i class="fas fa-times"></i></button>--%>
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
<%--                                    <span class="total-fare-display" id="totalFareDisplay-${status.index}"></span>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <!-- Class Selection -->--%>
<%--                            <div class="section">--%>
<%--                                <h3 class="section-title">Select Class</h3>--%>
<%--                                <div class="radio-group class-options" id="classOptions-${status.index}">--%>
<%--                                    <label class="radio-option selected" data-value="economy">--%>
<%--                                        <input type="radio" name="class-${status.index}" value="economy" checked>--%>
<%--                                        <div class="payment-label">--%>
<%--                                            <div class="payment-name">Economy Class</div>--%>
<%--                                            <div class="class-price economy-seat-price" id="EconomySeatPricePerPerson-${status.index}"><span></span></div>--%>
<%--                                        </div>--%>
<%--                                    </label>--%>

<%--                                    <label class="radio-option" data-value="business">--%>
<%--                                        <input type="radio" name="class-${status.index}" value="business">--%>
<%--                                        <div class="payment-label">--%>
<%--                                            <div class="payment-name">Business Class</div>--%>
<%--                                            <div class="class-price business-seat-price" id="BusinessSeatPricePerPerson-${status.index}"><span></span></div>--%>
<%--                                        </div>--%>
<%--                                    </label>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <!-- Payment Method -->--%>
<%--                            <div class="section">--%>
<%--                                <h3 class="section-title">Select Payment Method</h3>--%>
<%--                                <div class="radio-group payment-options" id="paymentOptions-${status.index}">--%>
<%--                                    <label class="radio-option selected" data-value="eSewa">--%>
<%--                                        <input type="radio" name="payment-${status.index}" value="eSewa" checked>--%>
<%--                                        <div class="payment-icon esewa-icon">--%>
<%--                                            <i class="fas fa-wallet"></i>--%>
<%--                                        </div>--%>
<%--                                        <div class="payment-label">--%>
<%--                                            <div class="payment-name">eSewa</div>--%>
<%--                                            <div class="payment-description">Pay with eSewa digital wallet</div>--%>
<%--                                        </div>--%>
<%--                                    </label>--%>

<%--                                    <label class="radio-option" data-value="Khalti">--%>
<%--                                        <input type="radio" name="payment-${status.index}" value="Khalti">--%>
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
<%--                                    <input type="text" class="form-input payment-amount" id="paymentAmount-${status.index}" placeholder="Enter correct amount">--%>
<%--                                    <div class="error-message" id="errorMessage-${status.index}">--%>
<%--                                        <i class="fas fa-exclamation-circle"></i>--%>
<%--                                        <span></span>--%>
<%--                                    </div>--%>
<%--                                    <p class="form-hint">Amount must match the flight price exactly.</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <!-- Modal Footer -->--%>
<%--                        <div class="modal-footer-payment">--%>
<%--                            <button class="btn-payment btn-cancel cancel-btn" data-modal-id="${status.index}">Cancel</button>--%>
<%--                            <button class="btn-payment btn-pay pay-now-btn" id="payNowBtn-${status.index}" disabled>Pay Now</button>--%>
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

    <jsp:include page="../../includes/BookingContainer.jsp" />

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
                        <form method="post" action="${pageContext.request.contextPath}/payment" class="payment-form">
                            <!-- Modal Header -->
                            <div class="modal-header-payment">
                                <h2 class="modal-title">Complete Your Booking</h2>
                                <p class="modal-subtitle">Select a payment method to complete your booking for flight ${flight.flightNumber}</p>
                                <button type="button" class="close-btn" data-modal-id="${status.index}"><i class="fas fa-times"></i></button>
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
                                            <input type="radio" name="seatClass" value="economy" checked data-flight-id="${flight.flightNumber}">
                                            <div class="payment-label">
                                                <div class="payment-name">Economy Class</div>
                                                <div class="class-price economy-seat-price" id="EconomySeatPricePerPerson-${status.index}"><span></span></div>
                                            </div>
                                        </label>

                                        <label class="radio-option" data-value="business">
                                            <input type="radio" name="seatClass" value="business" data-flight-id="${flight.flightNumber}">
                                            <div class="payment-label">
                                                <div class="payment-name">Business Class</div>
                                                <div class="class-price business-seat-price" id="BusinessSeatPricePerPerson-${status.index}"><span></span></div>
                                            </div>
                                        </label>
                                    </div>
                                    <!-- Hidden field to track flight number -->
                                    <input type="hidden" name="flightNumber" value="${flight.flightNumber}">
                                    <input type="hidden" name="passengerCount" value="${passenger}">
                                </div>

                                <!-- Payment Method -->
                                <div class="section">
                                    <h3 class="section-title">Select Payment Method</h3>
                                    <div class="radio-group payment-options" id="paymentOptions-${status.index}">
                                        <label class="radio-option selected" data-value="eSewa">
                                            <input type="radio" name="paymentMethod" value="eSewa" checked>
                                            <div class="payment-icon esewa-icon">
                                                <i class="fas fa-wallet"></i>
                                            </div>
                                            <div class="payment-label">
                                                <div class="payment-name">eSewa</div>
                                                <div class="payment-description">Pay with eSewa digital wallet</div>
                                            </div>
                                        </label>

                                        <label class="radio-option" data-value="Khalti">
                                            <input type="radio" name="paymentMethod" value="Khalti">
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
                                        <input type="text" name="paymentAmount" class="form-input payment-amount" id="paymentAmount-${status.index}" placeholder="Enter correct amount">
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
                                <button type="button" class="btn-payment btn-cancel cancel-btn" data-modal-id="${status.index}">Cancel</button>
                                <button type="submit" class="btn-payment btn-pay pay-now-btn" id="payNowBtn-${status.index}" disabled>Pay Now</button>
                            </div>
                        </form>
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