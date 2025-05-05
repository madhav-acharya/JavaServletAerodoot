<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<main class="booking-card">
    <div class="trip-type-tabs">
        <div class="tab-item active" data-tab="round-trip">Round Trip</div>
        <div class="tab-item" data-tab="one-way">One Way</div>
        <div class="tab-item" data-tab="multi-city">Multi-City</div>
    </div>

    <form class="tab-content" id="round-trip-content" action="flight-booking" method="post">
        <div class="form-row">
            <div class="form-group">
                <label for="from">From</label>
                <div class="input-with-icon">
                    <i class="location-icon"></i>
                    <input type="text" id="from" name="departure" placeholder="Select departure city" readonly>
                    <i class="dropdown-icon"></i>
                </div>
            </div>

            <div class="form-group">
                <label for="to">To</label>
                <div class="input-with-icon">
                    <i class="location-icon"></i>
                    <input type="text" id="to" name="destination" placeholder="Select destination city" readonly>
                    <i class="dropdown-icon"></i>
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="departure-date">Departure Date</label>
                <div class="input-with-icon">
                    <i class="calendar-icon"></i>
                    <input type="text" id="departure-date" name="departureDate" placeholder="Select date" readonly>
                </div>
            </div>

            <div class="form-group" id="return-date-group">
                <label for="return-date">Return Date</label>
                <div class="input-with-icon">
                    <i class="calendar-icon"></i>
                    <input type="text" id="return-date" name="returnDate" placeholder="Select date" readonly>
                </div>
            </div>

            <div class="form-group">
                <label for="passengers">Passengers</label>
                <div class="input-with-icon">
                    <i class="passenger-icon"></i>
                    <input type="text" id="passengers" name="passenger" value="1 Passenger" readonly>
                    <i class="dropdown-icon"></i>
                </div>
            </div>
        </div>

        <div class="form-row">
            <button class="btn-main btn-search">Search Flights</button>
        </div>
    </form>

    <form class="tab-content hidden" id="one-way-content" action="flight-booking" method="post">
        <div class="form-row">
            <div class="form-group">
                <label for="one-way-from">From</label>
                <div class="input-with-icon">
                    <i class="location-icon"></i>
                    <input type="text" id="one-way-from" name="departure" placeholder="Select departure city" readonly>
                    <i class="dropdown-icon"></i>
                </div>
            </div>

            <div class="form-group">
                <label for="one-way-to">To</label>
                <div class="input-with-icon">
                    <i class="location-icon"></i>
                    <input type="text" id="one-way-to" name="destination" placeholder="Select destination city" readonly>
                    <i class="dropdown-icon"></i>
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="one-way-departure-date">Departure Date</label>
                <div class="input-with-icon">
                    <i class="calendar-icon"></i>
                    <input type="text" id="one-way-departure-date" name="departureDate" placeholder="Select date" readonly>
                </div>
            </div>

            <div class="form-group">
                <label for="one-way-passengers">Passengers</label>
                <div class="input-with-icon">
                    <i class="passenger-icon"></i>
                    <input type="text" id="one-way-passengers" name="passenger" value="1 Passenger" readonly>
                    <i class="dropdown-icon"></i>
                </div>
            </div>
        </div>

        <div class="form-row">
            <button type="submit" class="btn-main btn-search">Search Flights</button>
        </div>
    </form>

    <div class="tab-content hidden" id="multi-city-content">
        <div class="multi-city-message">
            <p>Multi-city booking allows you to create a custom itinerary.</p>
            <button class="btn-main btn-coming-soon">Coming Soon</button>
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
            <div class="city-item" data-city="Kathmandu">Kathmandu (KTM)</div>
            <div class="city-item" data-city="Pokhara">Pokhara (PKR)</div>
            <div class="city-item" data-city="Biratnagar">Biratnagar (BIR)</div>
            <div class="city-item" data-city="Nepalgunj">Nepalgunj (KEP)</div>
            <div class="city-item" data-city="Bharatpur">Bharatpur (BHR)</div>
            <div class="city-item" data-city="Bhadrapur">Bhadrapur (BDP)</div>
            <div class="city-item" data-city="Dhangadhi">Dhangadhi (DHI)</div>
            <div class="city-item" data-city="Janakpur">Janakpur (JKR)</div>
            <div class="city-item" data-city="Simara">Simara (SIF)</div>
            <div class="city-item" data-city="Lukla">Lukla (LUA)</div>
            <div class="city-item" data-city="Bhairahawa">Bhairahawa (BWA)</div>
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
        <button class="btn-main btn-apply">Apply</button>
    </div>
</main>