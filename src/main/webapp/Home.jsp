<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp" />

<div class="container">
    <header>
        <h1>Your Journey Begins with AeroDoot</h1>
        <p>Seamless flight bookings, exceptional service, and unforgettable journeys await.</p>

        <div class="header-buttons">
            <button class="btn btn-primary">Book Your Flight</button>
            <button class="btn btn-secondary">Manage Booking</button>
        </div>
    </header>

    <main class="booking-card">
        <div class="trip-type-tabs">
            <div class="tab-item active" data-tab="round-trip">Round Trip</div>
            <div class="tab-item" data-tab="one-way">One Way</div>
            <div class="tab-item" data-tab="multi-city">Multi-City</div>
        </div>

        <div class="tab-content" id="round-trip-content">
            <div class="form-row">
                <div class="form-group">
                    <label for="from">From</label>
                    <div class="input-with-icon">
                        <i class="location-icon"></i>
                        <input type="text" id="from" placeholder="Select departure city" readonly>
                        <i class="dropdown-icon"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label for="to">To</label>
                    <div class="input-with-icon">
                        <i class="location-icon"></i>
                        <input type="text" id="to" placeholder="Select destination city" readonly>
                        <i class="dropdown-icon"></i>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="departure-date">Departure Date</label>
                    <div class="input-with-icon">
                        <i class="calendar-icon"></i>
                        <input type="text" id="departure-date" placeholder="Select date" readonly>
                    </div>
                </div>

                <div class="form-group" id="return-date-group">
                    <label for="return-date">Return Date</label>
                    <div class="input-with-icon">
                        <i class="calendar-icon"></i>
                        <input type="text" id="return-date" placeholder="Select date" readonly>
                    </div>
                </div>

                <div class="form-group">
                    <label for="passengers">Passengers</label>
                    <div class="input-with-icon">
                        <i class="passenger-icon"></i>
                        <input type="text" id="passengers" value="1 Passenger" readonly>
                        <i class="dropdown-icon"></i>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <button class="btn btn-search">Search Flights</button>
            </div>
        </div>

        <div class="tab-content hidden" id="one-way-content">
            <div class="form-row">
                <div class="form-group">
                    <label for="one-way-from">From</label>
                    <div class="input-with-icon">
                        <i class="location-icon"></i>
                        <input type="text" id="one-way-from" placeholder="Select departure city" readonly>
                        <i class="dropdown-icon"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label for="one-way-to">To</label>
                    <div class="input-with-icon">
                        <i class="location-icon"></i>
                        <input type="text" id="one-way-to" placeholder="Select destination city" readonly>
                        <i class="dropdown-icon"></i>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="one-way-departure-date">Departure Date</label>
                    <div class="input-with-icon">
                        <i class="calendar-icon"></i>
                        <input type="text" id="one-way-departure-date" placeholder="Select date" readonly>
                    </div>
                </div>

                <div class="form-group">
                    <label for="one-way-passengers">Passengers</label>
                    <div class="input-with-icon">
                        <i class="passenger-icon"></i>
                        <input type="text" id="one-way-passengers" value="1 Passenger" readonly>
                        <i class="dropdown-icon"></i>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <button class="btn btn-search">Search Flights</button>
            </div>
        </div>

        <div class="tab-content hidden" id="multi-city-content">
            <div class="multi-city-message">
                <p>Multi-city booking allows you to create a custom itinerary.</p>
                <button class="btn btn-coming-soon">Coming Soon</button>
            </div>
        </div>

        <!-- Calendar Popup -->
        <div class="calendar-popup" id="calendar-popup">
            <div class="calendar-header">
                <button class="calendar-nav prev">&lt;</button>
                <h3 id="calendar-month">April 2025</h3>
                <button class="calendar-nav next">&gt;</button>
            </div>
            <div class="calendar-weekdays">
                <div>Su</div>
                <div>Mo</div>
                <div>Tu</div>
                <div>We</div>
                <div>Th</div>
                <div>Fr</div>
                <div>Sa</div>
            </div>
            <div class="calendar-days" id="calendar-days">
                <!-- Days will be populated by JavaScript -->
            </div>
        </div>

        <!-- City Selection Dropdown -->
        <div class="city-dropdown" id="city-dropdown">
            <div class="city-search">
                <input type="text" placeholder="Search for a city">
            </div>
            <div class="city-list">
                <div class="city-item" data-city="New York">New York (JFK)</div>
                <div class="city-item" data-city="London">London (LHR)</div>
                <div class="city-item" data-city="Paris">Paris (CDG)</div>
                <div class="city-item" data-city="Tokyo">Tokyo (HND)</div>
                <div class="city-item" data-city="Dubai">Dubai (DXB)</div>
                <div class="city-item" data-city="Singapore">Singapore (SIN)</div>
            </div>
        </div>

        <!-- Passenger Selection Dropdown -->
        <div class="passenger-dropdown" id="passenger-dropdown">
            <div class="passenger-type">
                <span>Adults</span>
                <div class="passenger-counter">
                    <button class="decrease">-</button>
                    <span class="count" id="adult-count">1</span>
                    <button class="increase">+</button>
                </div>
            </div>
            <div class="passenger-type">
                <span>Children</span>
                <div class="passenger-counter">
                    <button class="decrease">-</button>
                    <span class="count" id="child-count">0</span>
                    <button class="increase">+</button>
                </div>
            </div>
            <div class="passenger-type">
                <span>Infants</span>
                <div class="passenger-counter">
                    <button class="decrease">-</button>
                    <span class="count" id="infant-count">0</span>
                    <button class="increase">+</button>
                </div>
            </div>
            <button class="btn btn-apply">Apply</button>
        </div>
    </main>

    <!-- Why Choose AeroDoot Section -->
    <section class="why-choose-section">
        <h2>Why Choose AeroDoot?</h2>
        <p class="section-description">
            Our advanced airline management system provides unparalleled convenience for passengers and powerful tools for administrators.
        </p>

        <div class="features-container">
            <div class="feature-card">
                <div class="feature-icon plane-icon">
                    <i class="fas fa-plane"></i>
                </div>
                <h3>Easy Flight Booking</h3>
                <p>Search, compare, and book flights with just a few clicks. Manage your bookings from anywhere, anytime.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon clock-icon">
                    <i class="fas fa-clock"></i>
                </div>
                <h3>Real-time Updates</h3>
                <p>Get instant notifications about flight status, changes, and important travel information.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon management-icon">
                    <i class="fas fa-tasks"></i>
                </div>
                <h3>Effortless Management</h3>
                <p>Administrators can easily manage flights, bookings, and customer information in one place.</p>
            </div>
        </div>
    </section>

    <!-- Ready to Take Flight Section -->
    <section class="cta-section">
        <h2>Ready to Take Flight?</h2>
        <p class="cta-description">Experience the future of airline management with AeroDoot.</p>

        <div class="cta-buttons">
            <a href="#" class="cta-btn create-account">Create Account</a>
            <a href="#" class="cta-btn sign-in">Sign In</a>
        </div>
    </section>
</div>
<script src="${pageContext.request.contextPath}/assets/js/home.js"></script>
<jsp:include page="tail.jsp"/>