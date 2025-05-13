<%--
  Created by IntelliJ IDEA.
  User: munal
  Date: 5/13/2025
  Time: 7:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../../header.jsp"/>

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
    <!-- Booking Card 1 -->
    <div class="flight-booking-card">
        <div class="flight-booking-header">
            <div class="flight-booking-number">
                <i class="fas fa-ticket-alt"></i>
                Booking #BK1001
            </div>
            <div class="flight-booking-status">Confirmed</div>
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
                        <div class="flight-detail-value">AD1234</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-icon">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Route</div>
                        <div class="flight-route">New York (JFK) → Los Angeles (LAX)</div>
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
                        <div class="flight-detail-value">2025-04-20</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-icon">
                        <i class="far fa-clock"></i>
                    </div>
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Time</div>
                        <div class="flight-detail-value">10:30 AM - 1:45 PM</div>
                    </div>
                </div>
            </div>

            <div class="flight-booking-info-section">
                <h3 class="flight-section-title">Booking Info</h3>

                <div class="flight-detail-item">
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Booking Date</div>
                        <div class="flight-detail-value">2025-03-15</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Passengers</div>
                        <div class="flight-detail-value">1</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Total Price</div>
                        <div class="flight-price">$299</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="flight-booking-actions">
            <button class="flight-btn flight-btn-secondary" id="flight-btn-boarding-pass-1">Boarding Pass</button>
            <button class="flight-btn flight-btn-danger" id="flight-btn-cancel-booking-1">Cancel Booking</button>
        </div>
    </div>

    <!-- Booking Card 2 -->
    <div class="flight-booking-card">
        <div class="flight-booking-header">
            <div class="flight-booking-number">
                <i class="fas fa-ticket-alt"></i>
                Booking #BK1002
            </div>
            <div class="flight-booking-status">Confirmed</div>
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
                        <div class="flight-detail-value">AD5678</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-icon">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Route</div>
                        <div class="flight-route">Los Angeles (LAX) → New York (JFK)</div>
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
                        <div class="flight-detail-value">2025-04-27</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-icon">
                        <i class="far fa-clock"></i>
                    </div>
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Time</div>
                        <div class="flight-detail-value">1:45 PM - 10:00 PM</div>
                    </div>
                </div>
            </div>

            <div class="flight-booking-info-section">
                <h3 class="flight-section-title">Booking Info</h3>

                <div class="flight-detail-item">
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Booking Date</div>
                        <div class="flight-detail-value">2025-03-15</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Passengers</div>
                        <div class="flight-detail-value">1</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Total Price</div>
                        <div class="flight-price">$329</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="flight-booking-actions">
            <button class="flight-btn flight-btn-secondary" id="flight-btn-boarding-pass-2">Boarding Pass</button>
            <button class="flight-btn flight-btn-danger" id="flight-btn-cancel-booking-2">Cancel Booking</button>
        </div>
    </div>
</div>

<!-- Past Bookings Tab Content -->
<div class="flight-tab-content" id="flight-content-past">
    <!-- Past Booking Card 1 -->
    <div class="flight-booking-card">
        <div class="flight-booking-header">
            <div class="flight-booking-number">
                <i class="fas fa-ticket-alt"></i>
                Booking #BK901
            </div>
            <div class="flight-booking-status completed">Completed</div>
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
                        <div class="flight-detail-value">AD4321</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-icon">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Route</div>
                        <div class="flight-route">New York (JFK) → London (LHR)</div>
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
                        <div class="flight-detail-value">2025-02-15</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-icon">
                        <i class="far fa-clock"></i>
                    </div>
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Time</div>
                        <div class="flight-detail-value">9:30 PM - 9:45 AM</div>
                    </div>
                </div>
            </div>

            <div class="flight-booking-info-section">
                <h3 class="flight-section-title">Booking Info</h3>

                <div class="flight-detail-item">
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Booking Date</div>
                        <div class="flight-detail-value">2025-01-05</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Passengers</div>
                        <div class="flight-detail-value">1</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Total Price</div>
                        <div class="flight-price">$649</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="flight-booking-actions">
            <button class="flight-btn flight-btn-secondary">Download Invoice</button>
            <button class="flight-btn flight-btn-primary">Book Similar Flight</button>
        </div>
    </div>

    <!-- Past Booking Card 2 -->
    <div class="flight-booking-card">
        <div class="flight-booking-header">
            <div class="flight-booking-number">
                <i class="fas fa-ticket-alt"></i>
                Booking #BK902
            </div>
            <div class="flight-booking-status completed">Completed</div>
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
                        <div class="flight-detail-value">AD8765</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-icon">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Route</div>
                        <div class="flight-route">London (LHR) → New York (JFK)</div>
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
                        <div class="flight-detail-value">2025-02-22</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-icon">
                        <i class="far fa-clock"></i>
                    </div>
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Time</div>
                        <div class="flight-detail-value">11:15 AM - 2:30 PM</div>
                    </div>
                </div>
            </div>

            <div class="flight-booking-info-section">
                <h3 class="flight-section-title">Booking Info</h3>

                <div class="flight-detail-item">
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Booking Date</div>
                        <div class="flight-detail-value">2025-01-05</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Passengers</div>
                        <div class="flight-detail-value">1</div>
                    </div>
                </div>

                <div class="flight-detail-item">
                    <div class="flight-detail-content">
                        <div class="flight-detail-label">Total Price</div>
                        <div class="flight-price">$629</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="flight-booking-actions">
            <button class="flight-btn flight-btn-secondary">Download Invoice</button>
            <button class="flight-btn flight-btn-primary">Book Similar Flight</button>
        </div>
    </div>
</div>

<!-- Boarding Pass Modal -->
<div class="flight-modal-backdrop" id="flight-boarding-pass-modal">
    <div class="flight-modal">
        <div class="flight-modal-header">
            <div class="flight-modal-title">Boarding Pass</div>
            <button class="flight-modal-close">&times;</button>
        </div>
        <div class="flight-modal-body">
            <div class="flight-modal-message">Your boarding pass will be available 24 hours before departure.</div>
            <div class="flight-modal-boarding-pass">
                <p>Boarding pass for Flight AD1234 will be available on 2025-04-20 at 10:30 AM.</p>
            </div>
            <div class="flight-modal-actions">
                <button class="flight-btn flight-btn-primary" id="flight-close-boarding-modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Cancel Booking Modal -->
<div class="flight-modal-backdrop" id="flight-cancel-booking-modal">
    <div class="flight-modal">
        <div class="flight-modal-header">
            <div class="flight-modal-title">Cancel Booking</div>
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

            <div class="flight-modal-actions">
                <button class="flight-btn flight-btn-secondary" id="flight-keep-booking">No, Keep My Booking</button>
                <button class="flight-btn flight-btn-danger" id="flight-confirm-cancel">Yes, Cancel Booking</button>
            </div>
        </div>
    </div>
</div>

<script>
    // Make sure to execute JavaScript after DOM is fully loaded
    document.addEventListener('DOMContentLoaded', function() {
        // Tab navigation
        const upcomingTab = document.getElementById('flight-tab-upcoming');
        const pastTab = document.getElementById('flight-tab-past');
        const upcomingContent = document.getElementById('flight-content-upcoming');
        const pastContent = document.getElementById('flight-content-past');

        upcomingTab.addEventListener('click', function() {
            upcomingTab.classList.add('active');
            pastTab.classList.remove('active');
            upcomingContent.classList.add('active');
            pastContent.classList.remove('active');
        });

        pastTab.addEventListener('click', function() {
            pastTab.classList.add('active');
            upcomingTab.classList.remove('active');
            pastContent.classList.add('active');
            upcomingContent.classList.remove('active');
        });

        // Boarding Pass Modal Functions
        const boardingPassModal = document.getElementById('flight-boarding-pass-modal');
        const boardingPassButtons = document.querySelectorAll('[id^="flight-btn-boarding-pass"]');
        const closeBoardingModalBtn = document.getElementById('flight-close-boarding-modal');
        const boardingModalCloseBtn = boardingPassModal.querySelector('.flight-modal-close');

        // Open boarding pass modal
        boardingPassButtons.forEach(btn => {
            btn.addEventListener('click', function() {
                boardingPassModal.style.display = 'flex';
            });
        });

        // Close boarding pass modal
        closeBoardingModalBtn.addEventListener('click', function() {
            boardingPassModal.style.display = 'none';
        });

        boardingModalCloseBtn.addEventListener('click', function() {
            boardingPassModal.style.display = 'none';
        });

        // Cancel Booking Modal Functions
        const cancelBookingModal = document.getElementById('flight-cancel-booking-modal');
        const cancelBookingButtons = document.querySelectorAll('[id^="flight-btn-cancel-booking"]');
        const keepBookingBtn = document.getElementById('flight-keep-booking');
        const confirmCancelBtn = document.getElementById('flight-confirm-cancel');
        const cancelModalCloseBtn = cancelBookingModal.querySelector('.flight-modal-close');

        // Open cancel booking modal
        cancelBookingButtons.forEach(btn => {
            btn.addEventListener('click', function() {
                cancelBookingModal.style.display = 'flex';
            });
        });

        // Close cancel booking modal
        keepBookingBtn.addEventListener('click', function() {
            cancelBookingModal.style.display = 'none';
        });

        confirmCancelBtn.addEventListener('click', function() {
            // Here you would typically send a request to cancel the booking
            // For this demo, we'll just close the modal
            cancelBookingModal.style.display = 'none';
            // You could add additional code here to handle the actual cancellation
        });

        cancelModalCloseBtn.addEventListener('click', function() {
            cancelBookingModal.style.display = 'none';
        });

        // Close modals when clicking outside of them
        window.addEventListener('click', function(event) {
            if (event.target === boardingPassModal) {
                boardingPassModal.style.display = 'none';
            }
            if (event.target === cancelBookingModal) {
                cancelBookingModal.style.display = 'none';
            }
        });
    });
</script>
<jsp:include page="../../tail.jsp"/>