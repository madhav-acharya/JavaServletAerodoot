<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:include page="../../header.jsp"/>

<div class="container">
    <header class="flight-booking-header">
        <h1>Flight Search</h1>
        <p>Search for available flights and book your next trip.</p>
    </header>

    <jsp:include page="../../BookingContainer.jsp" />

    <div class="flight-search-wrapper">
        <h1 class="flight-search-title">Available Flights</h1>

        <!-- Flight Card 1 -->
    <c:forEach var="flight" items="${flightList}">
        <div class="flight-search-card">
            <div class="flight-search-header">
                <div class="flight-search-info">
                    <div class="flight-search-icon">
                        <i class="fas fa-plane"></i>
                    </div>
                    <div class="flight-search-details">
                        <h3>${flight.flightNumber}</h3>
                        <p>ghdad</p>
                    </div>
                </div>
                <div class="flight-search-price">
                    <div class="flight-search-price-amount">$299</div>
                    <div class="flight-search-seats">42 seats left</div>
                    <button class="flight-search-book-btn">Book Now</button>
                </div>
            </div>

            <div class="flight-search-route">
                <div class="flight-search-airport">
                    <div class="flight-search-airport-code">JFK</div>
                    <div class="flight-search-airport-time">10:30 AM</div>
                </div>
                <div class="flight-search-route-line">
                    <div class="flight-search-route-info">5h 15m</div>
                    <div class="flight-search-line">
                        <i class="fas fa-plane flight-search-plane-icon"></i>
                    </div>
                    <div class="flight-search-route-info">Direct</div>
                </div>
                <div class="flight-search-airport">
                    <div class="flight-search-airport-code">LAX</div>
                    <div class="flight-search-airport-time">1:45 PM</div>
                </div>
            </div>

            <div class="flight-search-footer">
                <div class="flight-search-departure">
                    <i class="far fa-clock"></i>
                    <span>Departure: Tuesday, May 6, 2025</span>
                </div>
                <a href="#" class="flight-search-view-details">View Details</a>
            </div>
        </div>
    </c:forEach>

        <!-- Flight Card 2 -->
        <div class="flight-search-card">
            <div class="flight-search-header">
                <div class="flight-search-info">
                    <div class="flight-search-icon">
                        <i class="fas fa-plane"></i>
                    </div>
                    <div class="flight-search-details">
                        <h3>AD1236</h3>
                        <p>Airbus A320</p>
                    </div>
                </div>
                <div class="flight-search-price">
                    <div class="flight-search-price-amount">$349</div>
                    <div class="flight-search-seats">28 seats left</div>
                    <button class="flight-search-book-btn">Book Now</button>
                </div>
            </div>

            <div class="flight-search-route">
                <div class="flight-search-airport">
                    <div class="flight-search-airport-code">JFK</div>
                    <div class="flight-search-airport-time">2:15 PM</div>
                </div>
                <div class="flight-search-route-line">
                    <div class="flight-search-route-info">5h 15m</div>
                    <div class="flight-search-line">
                        <i class="fas fa-plane flight-search-plane-icon"></i>
                    </div>
                    <div class="flight-search-route-info">Direct</div>
                </div>
                <div class="flight-search-airport">
                    <div class="flight-search-airport-code">LAX</div>
                    <div class="flight-search-airport-time">5:30 PM</div>
                </div>
            </div>

            <div class="flight-search-footer">
                <div class="flight-search-departure">
                    <i class="far fa-clock"></i>
                    <span>Departure: Tuesday, May 6, 2025</span>
                </div>
                <a href="#" class="flight-search-view-details">View Details</a>
            </div>
        </div>

        <!-- Flight Card 3 -->
        <div class="flight-search-card">
            <div class="flight-search-header">
                <div class="flight-search-info">
                    <div class="flight-search-icon">
                        <i class="fas fa-plane"></i>
                    </div>
                    <div class="flight-search-details">
                        <h3>AD1239</h3>
                        <p>Boeing 737-800</p>
                    </div>
                </div>
                <div class="flight-search-price">
                    <div class="flight-search-price-amount">$279</div>
                    <div class="flight-search-seats">15 seats left</div>
                    <button class="flight-search-book-btn">Book Now</button>
                </div>
            </div>

            <div class="flight-search-route">
                <div class="flight-search-airport">
                    <div class="flight-search-airport-code">JFK</div>
                    <div class="flight-search-airport-time">7:45 PM</div>
                </div>
                <div class="flight-search-route-line">
                    <div class="flight-search-route-info">5h 15m</div>
                    <div class="flight-search-line">
                        <i class="fas fa-plane flight-search-plane-icon"></i>
                    </div>
                    <div class="flight-search-route-info">Direct</div>
                </div>
                <div class="flight-search-airport">
                    <div class="flight-search-airport-code">LAX</div>
                    <div class="flight-search-airport-time">11:00 PM</div>
                </div>
            </div>

            <div class="flight-search-footer">
                <div class="flight-search-departure">
                    <i class="far fa-clock"></i>
                    <span>Departure: Tuesday, May 6, 2025</span>
                </div>
                <a href="#" class="flight-search-view-details">View Details</a>
            </div>
        </div>
    </div>

</div>
<script src="${pageContext.request.contextPath}/assets/js/bookingContainer.js"></script>
<jsp:include page="../../tail.jsp" />
