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
                <!-- Error message will be inserted here by JavaScript -->
            </div>

            <div class="form-group">
                <label for="to">To</label>
                <div class="input-with-icon">
                    <i class="location-icon"></i>
                    <input type="text" id="to" name="destination" placeholder="Select destination city" readonly>
                    <i class="dropdown-icon"></i>
                </div>
                <!-- Error message will be inserted here by JavaScript -->
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="departure-date">Departure Date</label>
                <div class="input-with-icon">
                    <i class="calendar-icon"></i>
                    <input type="text" id="departure-date" name="departureDate" placeholder="Select date" readonly>
                </div>
                <!-- Error message will be inserted here by JavaScript -->
            </div>

            <div class="form-group" id="return-date-group">
                <label for="return-date">Return Date</label>
                <div class="input-with-icon">
                    <i class="calendar-icon"></i>
                    <input type="text" id="return-date" name="returnDate" placeholder="Select date" readonly>
                </div>
                <!-- Error message will be inserted here by JavaScript -->
            </div>

            <div class="form-group">
                <label for="passengers">Passengers</label>
                <div class="input-with-icon">
                    <i class="passenger-icon"></i>
                    <input type="text" id="passengers" name="passenger" value="1 Passenger" readonly>
                    <i class="dropdown-icon"></i>
                </div>
                <!-- Error message will be inserted here by JavaScript -->
            </div>
        </div>

        <div class="form-row">
            <button type="submit" class="btn-main btn-search">Search Flights</button>
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
                <!-- Error message will be inserted here by JavaScript -->
            </div>

            <div class="form-group">
                <label for="one-way-to">To</label>
                <div class="input-with-icon">
                    <i class="location-icon"></i>
                    <input type="text" id="one-way-to" name="destination" placeholder="Select destination city" readonly>
                    <i class="dropdown-icon"></i>
                </div>
                <!-- Error message will be inserted here by JavaScript -->
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="one-way-departure-date">Departure Date</label>
                <div class="input-with-icon">
                    <i class="calendar-icon"></i>
                    <input type="text" id="one-way-departure-date" name="departureDate" placeholder="Select date" readonly>
                </div>
                <!-- Error message will be inserted here by JavaScript -->
            </div>

            <div class="form-group">
                <label for="one-way-passengers">Passengers</label>
                <div class="input-with-icon">
                    <i class="passenger-icon"></i>
                    <input type="text" id="one-way-passengers" name="passenger" value="1 Passenger" readonly>
                    <i class="dropdown-icon"></i>
                </div>
                <!-- Error message will be inserted here by JavaScript -->
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
            <div class="city-item" data-city="KTM">Kathmandu (KTM)</div>
            <div class="city-item" data-city="PHH">Pokhara International Airport (PHH)</div>
            <div class="city-item" data-city="PKR">Pokhara (PKR)</div>
            <div class="city-item" data-city="BWA">Bhairahawa – Gautam Buddha Int'l (BWA)</div>
            <div class="city-item" data-city="BIR">Biratnagar (BIR)</div>
            <div class="city-item" data-city="KEP">Nepalgunj (KEP)</div>
            <div class="city-item" data-city="BDP">Bhadrapur (BDP)</div>
            <div class="city-item" data-city="JKR">Janakpur (JKR)</div>
            <div class="city-item" data-city="DHI">Dhangadhi (DHI)</div>
            <div class="city-item" data-city="BHR">Bharatpur (BHR)</div>
            <div class="city-item" data-city="SIF">Simara (SIF)</div>
            <div class="city-item" data-city="LUA">Lukla (LUA)</div>
            <div class="city-item" data-city="TMI">Tumlingtar (TMI)</div>
            <div class="city-item" data-city="JMO">Jomsom (JMO)</div>
            <div class="city-item" data-city="SKH">Surkhet (SKH)</div>
            <div class="city-item" data-city="PPL">Phaplu (PPL)</div>
            <div class="city-item" data-city="RJB">Rajbiraj (RJB)</div>
            <div class="city-item" data-city="RHP">Ramechhap (RHP)</div>
            <div class="city-item" data-city="DOP">Dolpa (DOP)</div>
            <div class="city-item" data-city="JUM">Jumla (JUM)</div>
            <div class="city-item" data-city="BJU">Bajura (BJU)</div>
            <div class="city-item" data-city="BJH">Bajhang (BJH)</div>
            <div class="city-item" data-city="DAP">Darchula (DAP)</div>
            <div class="city-item" data-city="HRJ">Chaurjhari (HRJ)</div>
            <div class="city-item" data-city="LDN">Lamidanda (LDN)</div>
            <div class="city-item" data-city="MEY">Meghauli (MEY)</div>
            <div class="city-item" data-city="SYH">Syangboche (SYH)</div>
            <div class="city-item" data-city="NGX">Manang (NGX)</div>
            <div class="city-item" data-city="XMG">Mahendranagar (XMG)</div>
            <div class="city-item" data-city="RUK">Rukumkot (RUK)</div>
            <div class="city-item" data-city="RPA">Rolpa (RPA)</div>
            <div class="city-item" data-city="RUM">Rumjatar (RUM)</div>
            <div class="city-item" data-city="JIR">Jiri (JIR)</div>
            <div class="city-item" data-city="BIT">Baitadi (BIT)</div>
            <div class="city-item" data-city="BGL">Baglung (BGL)</div>
            <div class="city-item" data-city="BHP">Bhojpur (BHP)</div>
            <div class="city-item" data-city="LTG">Langtang (LTG)</div>
            <div class="city-item" data-city="MWP">Mountain (MWP)</div>
            <div class="city-item" data-city="IMK">Simikot (IMK)</div>
            <div class="city-item" data-city="TAL">Talcha (TAL)</div>
            <div class="city-item" data-city="TMK">Thamkharka (TMK)</div>
            <div class="city-item" data-city="TPJ">Taplejung (TPJ)</div>
            <div class="city-item" data-city="TPU">Tikapur (TPU)</div>
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