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
                <div class="stat-number">2</div>
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
                <div class="stat-number">4</div>
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

    <div class="tabs-passdb">
        <button class="tab-btn-passdb active" data-tab="upcoming">Upcoming Flights</button>
        <button class="tab-btn-passdb" data-tab="recent">Recent Bookings</button>
    </div>

    <div class="tab-content-passdb active" id="upcoming-tab">
        <div class="flight-row">
            <div class="flight-card">
                <div class="flight-header">
                    <div class="flight-number">
                        <i class="fas fa-plane"></i> AD1234
                    </div>
                    <div class="flight-status confirmed">Confirmed</div>
                </div>
                <div class="flight-details">
                    <div class="flight-route">
                        <div class="route-from">
                            <div class="label">From</div>
                            <div class="city">New York (JFK)</div>
                        </div>
                        <div class="route-icon">
                            <i class="fas fa-exchange-alt"></i>
                        </div>
                        <div class="route-to">
                            <div class="label">To</div>
                            <div class="city">Los Angeles (LAX)</div>
                        </div>
                    </div>
                    <div class="flight-info">
                        <div class="info-item">
                            <div class="label">
                                <i class="far fa-calendar-alt"></i> Date
                            </div>
                            <div class="value">2025-04-20</div>
                        </div>
                        <div class="info-item">
                            <div class="label">
                                <i class="far fa-clock"></i> Time
                            </div>
                            <div class="value">10:30 AM</div>
                        </div>
                    </div>
                </div>
                <div class="flight-actions">
                    <button class="btn-details">View Details</button>
                    <button class="btn-cancel">Cancel</button>
                </div>
            </div>

            <div class="flight-card">
                <div class="flight-header">
                    <div class="flight-number">
                        <i class="fas fa-plane"></i> AD5678
                    </div>
                    <div class="flight-status confirmed">Confirmed</div>
                </div>
                <div class="flight-details">
                    <div class="flight-route">
                        <div class="route-from">
                            <div class="label">From</div>
                            <div class="city">Los Angeles (LAX)</div>
                        </div>
                        <div class="route-icon">
                            <i class="fas fa-exchange-alt"></i>
                        </div>
                        <div class="route-to">
                            <div class="label">To</div>
                            <div class="city">New York (JFK)</div>
                        </div>
                    </div>
                    <div class="flight-info">
                        <div class="info-item">
                            <div class="label">
                                <i class="far fa-calendar-alt"></i> Date
                            </div>
                            <div class="value">2025-04-27</div>
                        </div>
                        <div class="info-item">
                            <div class="label">
                                <i class="far fa-clock"></i> Time
                            </div>
                            <div class="value">1:45 PM</div>
                        </div>
                    </div>
                </div>
                <div class="flight-actions">
                    <button class="btn-details">View Details</button>
                    <button class="btn-cancel">Cancel</button>
                </div>
            </div>
        </div>
    </div>

    <div class="tab-content-passdb" id="recent-tab">
        <div class="booking-row">
            <div class="booking-card-passdb">
                <div class="booking-header">
                    <div class="booking-number">-
                        <i class="fas fa-ticket-alt"></i> Booking #101
                    </div>
                    <div class="booking-status completed">Completed</div>
                </div>
                <div class="booking-details">
                    <div class="booking-route">
                        <div class="flight-label">Flight</div>
                        <div class="flight-value">AD4321</div>
                        <div class="route-icon">
                            <i class="fas fa-exchange-alt"></i>
                        </div>
                        <div class="route-label">Route</div>
                        <div class="route-value">New York (JFK) → London (LHR)</div>
                    </div>
                    <div class="booking-info">
                        <div class="info-item">
                            <div class="label">
                                <i class="far fa-calendar-alt"></i> Booking Date
                            </div>
                            <div class="value">2025-03-15</div>
                        </div>
                    </div>
                </div>
                <div class="booking-actions">
                    <button class="btn-details-full">View Details</button>
                </div>
            </div>

            <div class="booking-card-passdb">
                <div class="booking-header">
                    <div class="booking-number">
                        <i class="fas fa-ticket-alt"></i> Booking #102
                    </div>
                    <div class="booking-status completed">Completed</div>
                </div>
                <div class="booking-details">
                    <div class="booking-route">
                        <div class="flight-label">Flight</div>
                        <div class="flight-value">AD8765</div>
                        <div class="route-icon">
                            <i class="fas fa-exchange-alt"></i>
                        </div>
                        <div class="route-label">Route</div>
                        <div class="route-value">London (LHR) → New York (JFK)</div>
                    </div>
                    <div class="booking-info">
                        <div class="info-item">
                            <div class="label">
                                <i class="far fa-calendar-alt"></i> Booking Date
                            </div>
                            <div class="value">2025-02-28</div>
                        </div>
                    </div>
                </div>
                <div class="booking-actions">
                    <button class="btn-details-full">View Details</button>
                </div>
            </div>
        </div>
    </div>
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