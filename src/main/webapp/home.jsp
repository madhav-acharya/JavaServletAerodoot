<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" />

<div class="container">
    <header class="home-header">
        <h1>Your Journey Begins with AeroDoot</h1>
        <p>Seamless flight bookings, exceptional service, and unforgettable journeys await.</p>

        <div class="header-buttons">
            <button class="btn-main btn-primary">Book Your Flight</button>
            <button class="btn-main btn-secondary">Manage Booking</button>
        </div>
    </header>

    <jsp:include page="BookingContainer.jsp" />

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
<script src="${pageContext.request.contextPath}/assets/js/bookingContainer.js"></script>
<jsp:include page="tail.jsp"/>