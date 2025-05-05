<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp" />

<div class="container">
    <header class="aerodoot-contact__header">
        <h1 class="aerodoot-contact__header-title">Contact Us</h1>
        <div class="aerodoot-contact__header-line"></div>
        <p class="aerodoot-contact__header-subtitle">We're here to help and answer any questions you might have</p>
    </header>

    <div class="aerodoot-contact__cards">
        <div class="aerodoot-contact__card">
            <div class="aerodoot-contact__card-icon">
                <i class="fas fa-map-marker-alt"></i>
            </div>
            <h2 class="aerodoot-contact__card-title">Our Location</h2>
            <p>123 Airline Plaza, Aviation District</p>
            <p>Skyview City, SV 54321</p>
            <p>United States</p>
        </div>

        <div class="aerodoot-contact__card">
            <div class="aerodoot-contact__card-icon">
                <i class="fas fa-phone-alt"></i>
            </div>
            <h2 class="aerodoot-contact__card-title">Phone Support</h2>
            <p>Customer Service: <a href="tel:+18001234567">+1 (800) 123-4567</a></p>
            <p>Technical Support: <a href="tel:+18007654321">+1 (800) 765-4321</a></p>
            <p class="aerodoot-contact__card-hours">Hours: 24/7, 365 days</p>
        </div>

        <div class="aerodoot-contact__card">
            <div class="aerodoot-contact__card-icon">
                <i class="fas fa-envelope"></i>
            </div>
            <h2 class="aerodoot-contact__card-title">Email</h2>
            <p>General Inquiries: <a href="mailto:info@aerodoot.com">info@aerodoot.com</a></p>
            <p>Support: <a href="mailto:support@aerodoot.com">support@aerodoot.com</a></p>
            <p>Business: <a href="mailto:partnerships@aerodoot.com">partnerships@aerodoot.com</a></p>
        </div>
    </div>

    <div class="aerodoot-contact__form-container">
        <h2 class="aerodoot-contact__form-title">Send Us a Message</h2>
        <form id="aerodootContactForm">
            <div class="aerodoot-contact__form-row">
                <div class="aerodoot-contact__form-group">
                    <label class="aerodoot-contact__form-label" for="fullName">Full Name</label>
                    <input type="text" id="fullName" class="aerodoot-contact__form-input" placeholder="John Doe">
                </div>
                <div class="aerodoot-contact__form-group">
                    <label class="aerodoot-contact__form-label" for="email">Email Address</label>
                    <input type="email" id="email" class="aerodoot-contact__form-input" placeholder="john@example.com">
                </div>
            </div>

            <div class="aerodoot-contact__form-group">
                <label class="aerodoot-contact__form-label" for="subject">Subject</label>
                <input type="text" id="subject" class="aerodoot-contact__form-input" placeholder="How can we help you?">
            </div>

            <div class="aerodoot-contact__form-group">
                <label class="aerodoot-contact__form-label" for="message">Your Message</label>
                <textarea id="message" class="aerodoot-contact__form-input aerodoot-contact__form-textarea" placeholder="Please provide details about your inquiry..."></textarea>
            </div>

            <button type="submit" class="aerodoot-contact__form-button">Send Message</button>
        </form>
    </div>
</div>

<jsp:include page="tail.jsp" />
