<%--
  Created by IntelliJ IDEA.
  User: munal
  Date: 4/22/2025
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../../header.jsp"/>
<jsp:include page="../../includes/toast.jsp" />

<div class="container">
    <header class="dashboard-header">
        <div class="greeting">
            <h1>Namaste, <span id="passenger-name">${passenger.user.firstName} ${passenger.user.lastName}</span></h1>
            <p>Welcome to your passenger dashboard. Manage your flights and bookings here.</p>
        </div>
        <div class="profile-section-passdb">
            <div class="profile-image-passdb">
                <c:if test="${not empty profileImage}">
                    <img src="data:${mimeType};base64,${profileImage}" />
                </c:if>
                <c:if test="${empty profileImage}">
                    <img src="${pageContext.request.contextPath}/assets/image/default-profile.jpg" />
                </c:if>
            </div>
            <button class="btn-edit-passdb" id="edit-profile-btn">
                <i class="fas fa-user"></i> Edit Profile
            </button>
        </div>
    </header>

    <div class="dashboard-grid">
        <div class="dashboard-card">
            <div class="card-header">
                <h2>My Flights</h2>
            </div>
            <div class="card-content">
                <div class="stat-number">${upcomingBookingNum}</div>
                <div class="stat-label">Upcoming flights</div>
            </div>
            <div class="card-footer">
                <a href="#" class="btn-view-passdb">View All</a>
            </div>
        </div>

        <div class="dashboard-card">
            <div class="card-header">
                <h2>My Bookings</h2>
            </div>
            <div class="card-content">
                <div class="stat-number">${totalBookingNum}</div>
                <div class="stat-label">Total bookings</div>
            </div>
            <div class="card-footer">
                <a href="#" class="btn-view-passdb">View History</a>
            </div>
        </div>

        <div class="dashboard-card">
            <div class="card-header">
                <h2>Quick Actions</h2>
            </div>
            <div class="card-content quick-actions">
                <a href="#" class="btn-action-passdb">
                    <i class="fas fa-plane-departure"></i> Book a Flight
                </a>
                <a href="#" class="btn-action-passdb">
                    <i class="fas fa-ticket-alt"></i> Check Booking
                </a>
            </div>
        </div>
    </div>

    <%-- Booking info section --%>
    <div class="flight-header">
        <h1 class="flight-title">My Bookings</h1>
        <p class="flight-subtitle">View and manage all your flight bookings</p>
    </div>

    <div class="flight-tabs">
        <button class="flight-tab active" id="flight-tab-upcoming">Upcoming Bookings</button>
        <button class="flight-tab" id="flight-tab-past">Past Bookings</button>
    </div>

    <!-- Upcoming Bookings Tab Content -->
    <div class="flight-tab-content active" id="flight-content-upcoming">
        <c:if test="${not empty upcomingFlights}">
        <c:forEach var="item" items="${upcomingFlights}">
            <div class="flight-booking-card">
                <div class="flight-booking-header">
                    <div class="flight-booking-number">
                        <i class="fas fa-ticket-alt"></i>
                        Booking #BK10${item.booking.bookingId}
                    </div>
                    <div class="flight-booking-status">${item.booking.bookingStatus}</div>
                </div>

                <div class="flight-booking-content">
                    <div class="flight-details-section">
                        <h3 class="flight-section-title">Flight Details</h3>

                        <div class="flight-detail-item">
                            <div class="flight-detail-icon">
                                <i class="fas fa-plane"></i>
                            </div>
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Flight</div>
                                <div class="flight-detail-value">${item.airline.name} → ${item.aircraft.model}</div>
                            </div>
                        </div>

                        <div class="flight-detail-item">
                            <div class="flight-detail-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Route</div>
                                <div class="flight-route-db">${item.flight.departureLocation} → ${item.flight.arrivalLocation}</div>
                            </div>
                        </div>
                    </div>

                    <div class="flight-date-section">
                        <h3 class="flight-section-title">Date & Time</h3>

                        <div class="flight-detail-item">
                            <div class="flight-detail-icon">
                                <i class="far fa-calendar-alt"></i>
                            </div>
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Departure Date</div>
                                <div class="flight-detail-value">${item.flight.flightDate}</div>
                            </div>
                        </div>

                        <div class="flight-detail-item">
                            <div class="flight-detail-icon">
                                <i class="far fa-clock"></i>
                            </div>
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Time</div>
                                <div class="flight-detail-value">${item.flight.departureTime} - ${item.flight.arrivalTime}</div>
                            </div>
                        </div>
                    </div>

                    <div class="flight-booking-info-section">
                        <h3 class="flight-section-title">Booking Info</h3>

                        <div class="flight-detail-item">
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Booking Date</div>
                                <div class="flight-detail-value">${item.booking.bookingDate}</div>
                            </div>
                        </div>

                        <div class="flight-detail-item">
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Passengers</div>
                                <div class="flight-detail-value">${item.booking.seatsBooked}</div>
                            </div>
                        </div>

                        <div class="flight-detail-item">
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Total Price</div>
                                <div class="flight-price">NPR ${item.booking.totalPrice}</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="flight-booking-actions">
                    <button class="flight-btn flight-btn-secondary" id="flight-btn-boarding-pass-${item.booking.bookingId}">Boarding Pass</button>
                    <button class="flight-btn flight-btn-danger" id="flight-btn-cancel-booking-${item.booking.bookingId}">Cancel Booking</button>
                </div>
            </div>
        </c:forEach>
        </c:if>

        <c:if test="${upcomingBookingNum == 0}">
            <div class="empty-booking-container">
                <div class="empty-booking-icon">
                    <i class="fas fa-plane-departure"></i>
                </div>
                <h3 class="empty-booking-title">No Upcoming Flights</h3>
                <p class="empty-booking-message">You haven't booked any flights yet. Ready to plan your next adventure?</p>
                <a href="#" class="book-now-btn">
                    <i class="fas fa-search"></i>
                    Find Flights
                </a>
            </div>
        </c:if>
    </div>

    <!-- Past Bookings Tab Content -->
    <div class="flight-tab-content" id="flight-content-past">

        <c:if test="${not empty recentFlights}">
            <c:forEach var="item" items="${recentFlights}">
            <div class="flight-booking-card">
                <div class="flight-booking-header-recent">
                    <div class="flight-booking-number">
                        <i class="fas fa-ticket-alt"></i>
                        Booking #BK10${item.booking.bookingId}
                    </div>
                    <div class="flight-booking-status completed">${item.booking.bookingStatus}</div>
                </div>

                <div class="flight-booking-content">
                    <div class="flight-details-section">
                        <h3 class="flight-section-title">Flight Details</h3>

                        <div class="flight-detail-item">
                            <div class="flight-detail-icon">
                                <i class="fas fa-plane"></i>
                            </div>
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Flight</div>
                                <div class="flight-detail-value">${item.airline.name} → ${item.aircraft.model}</div>
                            </div>
                        </div>

                        <div class="flight-detail-item">
                            <div class="flight-detail-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Route</div>
                                <div class="flight-route-db">${item.flight.departureLocation} → ${item.flight.arrivalLocation}</div>
                            </div>
                        </div>
                    </div>

                    <div class="flight-date-section">
                        <h3 class="flight-section-title">Date & Time</h3>

                        <div class="flight-detail-item">
                            <div class="flight-detail-icon">
                                <i class="far fa-calendar-alt"></i>
                            </div>
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Departure Date</div>
                                <div class="flight-detail-value">${item.flight.flightDate}</div>
                            </div>
                        </div>

                        <div class="flight-detail-item">
                            <div class="flight-detail-icon">
                                <i class="far fa-clock"></i>
                            </div>
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Time</div>
                                <div class="flight-detail-value">${item.flight.departureTime} - ${item.flight.arrivalTime}</div>
                            </div>
                        </div>
                    </div>

                    <div class="flight-booking-info-section">
                        <h3 class="flight-section-title">Booking Info</h3>

                        <div class="flight-detail-item">
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Booking Date</div>
                                <div class="flight-detail-value">${item.booking.bookingDate}</div>
                            </div>
                        </div>

                        <div class="flight-detail-item">
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Passengers</div>
                                <div class="flight-detail-value">${item.booking.seatsBooked}</div>
                            </div>
                        </div>

                        <div class="flight-detail-item">
                            <div class="flight-detail-content">
                                <div class="flight-detail-label">Total Price</div>
                                <div class="flight-price">NPR ${item.booking.totalPrice}</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="flight-booking-actions">
                    <button class="flight-btn flight-btn-secondary">Download Invoice</button>
                    <button class="flight-btn flight-btn-primary">Book Similar Flight</button>
                </div>
            </div>
            </c:forEach>
        </c:if>
        <c:if test="${recentBookingNum == 0}">
            <div class="empty-booking-container past">
                <div class="empty-booking-icon">
                    <i class="fas fa-history"></i>
                </div>
                <h3 class="empty-booking-title">No Past Flights</h3>
                <p class="empty-booking-message">Your flight history will appear here once you've completed trips with us.</p>
                <a href="#" class="book-now-btn">
                    <i class="fas fa-paper-plane"></i>
                    Book Your First Trip
                </a>
            </div>
        </c:if>
    </div>

    <!-- Boarding Pass Modals - One for each upcoming flight -->
    <c:if test="${not empty upcomingFlights}">
        <c:forEach var="item" items="${upcomingFlights}">
            <div class="flight-modal-backdrop" id="flight-boarding-pass-modal-${item.booking.bookingId}">
                <div class="flight-modal">
                    <div class="flight-modal-header">
                        <div class="flight-modal-title">Boarding Pass - #BK10${item.booking.bookingId}</div>
                        <button class="flight-modal-close">&times;</button>
                    </div>
                    <div class="flight-modal-body">
                        <div class="flight-modal-message">Your boarding pass will be available before departure.</div>
                        <div class="flight-modal-boarding-pass">
                            <p>Boarding pass for Flight ${item.airline.name} ${item.aircraft.model} will be available on ${item.flight.flightDate} at ${item.flight.departureTime}.</p>
                            <p>Route: ${item.flight.departureLocation} → ${item.flight.arrivalLocation}</p>
                        </div>
                        <div class="flight-modal-actions">
                            <button class="flight-btn flight-btn-primary" id="flight-close-boarding-modal-${item.booking.bookingId}">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="flight-modal-backdrop" id="flight-cancel-booking-modal-${item.booking.bookingId}">
                <div class="flight-modal">
                    <div class="flight-modal-header">
                        <div class="flight-modal-title">Cancel Booking #BK10${item.booking.bookingId}</div>
                        <button class="flight-modal-close">&times;</button>
                    </div>
                    <div class="flight-modal-body">
                        <div class="flight-modal-message">Are you sure you want to cancel this booking? This action cannot be undone.</div>

                        <div class="flight-warning">
                            <div class="flight-warning-icon">
                                <i class="fas fa-exclamation-triangle"></i>
                            </div>
                            <div class="flight-warning-content">
                                <strong>Warning</strong>
                                <p>Cancellation fees may apply based on your fare type. Refunds will be processed within 7 business days.</p>
                            </div>
                        </div>

                        <form method="post" action="${pageContext.request.contextPath}/cancel-booking" class="flight-modal-actions">
                            <input type="hidden" name="bookingId" value="${item.booking.bookingId}" />
                            <button type="button" class="flight-btn flight-btn-secondary" id="flight-keep-booking-${item.booking.bookingId}">No, Keep My Booking</button>
                            <button type="submit" class="flight-btn flight-btn-danger" id="flight-confirm-cancel-${item.booking.bookingId}">Yes, Cancel Booking</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>

<!-- Profile Edit Modal -->
<div class="modal" id="profile-modal">
    <form action="${pageContext.request.contextPath}/passenger/dashboard" method="post" class="modal-content" enctype="multipart/form-data">
        <div class="modal-header">
            <h2>Edit Profile</h2>
            <button type="button" class="close-btn" id="close-modal">&times;</button>
        </div>
        <div class="modal-body">
            <p class="modal-description">Make changes to your profile here. Click save when you're done.</p>

            <div class="profile-photo-section">
                <c:if test="${not empty profileImage}">
                    <img src="data:${mimeType};base64,${profileImage}" class="profile-photo" id="modal-profile-img" alt="Profile Photo" />
                </c:if>
                <c:if test="${empty profileImage}">
                    <img src="${pageContext.request.contextPath}/assets/image/default-profile.jpg" class="profile-photo" id="modal-profile-img" alt="Default Profile Photo" />
                </c:if>
                <div class="profile-picture-chnage-">
                    <button class="upload-btn"><i class="fas fa-camera"></i> Select Photo</button>
                    <input type="file" name="profilePicture" id="profile-upload" accept="image/*" />
                </div>
            </div>

            <% if (request.getAttribute("error") != null) { %>
            <div style="
                    background-color: #FFF0F0;
                    color: #D32F2F;
                    padding: 12px 16px;
                    border-radius: 6px;
                    margin: 15px 25px;
                    border: 1px solid #FFCDD2;
                    display: flex;
                    align-items: center;
                    gap: 10px;
                    font-size: 0.95rem;
                    line-height: 1.4;
                    ">
                <i class="fas fa-exclamation-circle" style="
        font-size: 1.1rem;
        flex-shrink: 0;"></i>
                <%= request.getAttribute("error") %>
            </div>
            <% } %>

            <div class="form-group">
                <label for="profile-name">Name</label>
                <input type="text" id="profile-name" name="fullName" value="${passenger.user.firstName} ${passenger.user.lastName}" class="form-input">
            </div>

            <div class="form-group">
                    <label for="profile-email">Email</label>
                    <input type="email" id="profile-email" name="email" value="${passenger.user.email}" class="form-input">
            </div>

            <div class="form-group">
                <label for="profile-phoneNumber">PhoneNumber</label>
                <input type="text" id="profile-phoneNumber" name="phoneNumber" value="${passenger.user.phoneNumber}" class="form-input">
            </div>

            <div class="form-group">
                <label for="address">
                    <i class="fas fa-home"></i> Address
                </label>
                <input type="text" id="address" name="address" value="${passenger.passenger.address}" class="form-input" required>
            </div>

            <div class="form-group">
                <label for="passportNumber">
                    <i class="fas fa-passport"></i> Passport Number
                </label>
                <input type="text" id="passportNumber" name="passportNumber" value="${passenger.passenger.passportNumber}" class="form-input" required>
            </div>

            <div class="form-group">
                <label class="label-with-icon">
                    <i class="fas fa-venus-mars"></i> Gender
                </label>
                <div class="radio-group">
                    <div class="radio-option">
                        <input type="radio" id="male" name="gender" value="MALE"
                               <c:if test="${passenger.passenger.gender == 'MALE'}">checked</c:if> required>
                        <label for="male"><i class="fas fa-male"></i> Male</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="female" name="gender" value="FEMALE"
                               <c:if test="${passenger.passenger.gender == 'FEMALE'}">checked</c:if>>
                        <label for="female"><i class="fas fa-female"></i> Female</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="other" name="gender" value="OTHER"
                               <c:if test="${passenger.passenger.gender == 'OTHER'}">checked</c:if>>
                        <label for="other"><i class="fas fa-user"></i> Other</label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="dateOfBirth">
                    <i class="fas fa-calendar-alt"></i> Date of Birth
                </label>
                <input type="date" id="dateOfBirth" name="dateOfBirth" value="${passenger.passenger.dateOfBirth}" class="form-input" required>
            </div>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn-secondary" id="cancel-changes">Cancel</button>
            <button type="submit" class="btn-primary" id="save-changes">Save changes</button>
        </div>
    </form>
</div>
<script>
    document.getElementById('profile-upload').addEventListener('change', function (e) {
        const file = e.target.files[0];
        if (file && file.type.startsWith('image/')) {
            const reader = new FileReader();

            reader.onload = function (e) {
                const img = document.getElementById('modal-profile-img');
                img.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    })
</script>
<script src="${pageContext.request.contextPath}/assets/js/passangerDashboard.js"></script>
<jsp:include page="../../tail.jsp" />