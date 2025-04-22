<%--
  Created by IntelliJ IDEA.
  User: munal
  Date: 4/22/2025
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AeroDoot - Passenger Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/passengerDashboard.css">
</head>
<body>
<div class="container">
    <header class="dashboard-header">
        <div class="greeting">
            <h1>Good Morning, <span id="passenger-name">John Passenger</span></h1>
            <p>Welcome to your passenger dashboard. Manage your flights and bookings here.</p>
        </div>
        <div class="profile-section">
            <div class="profile-image">
                <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%202025-04-22%20111642-gdcsMawOs661yDsYAZ4f3WJNW3ePdl.png" alt="Profile" id="profile-img">
            </div>
            <button class="btn-edit" id="edit-profile-btn">
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
                <a href="#" class="btn-view-all">View All</a>
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
                <a href="#" class="btn-view-history">View History</a>
            </div>
        </div>

        <div class="dashboard-card">
            <div class="card-header">
                <h2>Quick Actions</h2>
            </div>
            <div class="card-content quick-actions">
                <a href="#" class="btn-action primary">
                    <i class="fas fa-plane-departure"></i> Book a Flight
                </a>
                <a href="#" class="btn-action secondary">
                    <i class="fas fa-ticket-alt"></i> Check Booking
                </a>
            </div>
        </div>
    </div>

    <div class="tabs">
        <button class="tab-btn active" data-tab="upcoming">Upcoming Flights</button>
        <button class="tab-btn" data-tab="recent">Recent Bookings</button>
    </div>

    <div class="tab-content active" id="upcoming-tab">
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

    <div class="tab-content" id="recent-tab">
        <div class="booking-row">
            <div class="booking-card">
                <div class="booking-header">
                    <div class="booking-number">
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

            <div class="booking-card">
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
    <div class="modal-content">
        <div class="modal-header">
            <h2>Edit Profile</h2>
            <button class="close-btn" id="close-modal">&times;</button>
        </div>
        <div class="modal-body">
            <p class="modal-description">Make changes to your profile here. Click save when you're done.</p>

            <div class="profile-photo-section">
                <div class="profile-photo">
                    <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%202025-04-22%20111642-gdcsMawOs661yDsYAZ4f3WJNW3ePdl.png" alt="Profile" id="modal-profile-img">
                </div>
                <button class="btn-photo" id="change-photo-btn">
                    <i class="fas fa-camera"></i> Change Photo
                </button>
            </div>

            <div class="form-group">
                <label for="profile-name">Name</label>
                <input type="text" id="profile-name" value="John Passenger" class="form-input">
            </div>

            <div class="form-group">
                <label for="profile-email">Email</label>
                <input type="email" id="profile-email" value="passenger@aerodoot.com" class="form-input">
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn-secondary" id="cancel-changes">Cancel</button>
            <button class="btn-primary" id="save-changes">Save changes</button>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/passangerDashboard.js"></script>
</body>
</html>

