<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp" />
<jsp:include page="includes/toast.jsp"/>

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
        <form id="aerodootContactForm" method="post" action="${pageContext.request.contextPath}/contact">
            <div class="aerodoot-contact__form-row">
                <div class="aerodoot-contact__form-group">
                    <label class="aerodoot-contact__form-label" for="fullName">Full Name</label>
                    <input type="text" id="fullName" class="aerodoot-contact__form-input" placeholder="John Doe" required>
                </div>
                <div class="aerodoot-contact__form-group">
                    <label class="aerodoot-contact__form-label" for="email">Email Address</label>
                    <input type="email" id="email" class="aerodoot-contact__form-input" placeholder="john@example.com" required>
                </div>
            </div>

            <div class="aerodoot-contact__form-group">
                <label class="aerodoot-contact__form-label" for="subject">Subject</label>
                <input type="text" id="subject" class="aerodoot-contact__form-input" placeholder="How can we help you?" required>
            </div>

            <div class="aerodoot-contact__form-group">
                <label class="aerodoot-contact__form-label" for="message">Your Message</label>
                <textarea id="message" class="aerodoot-contact__form-input aerodoot-contact__form-textarea" placeholder="Please provide details about your inquiry..." required></textarea>
            </div>

            <button type="submit" class="aerodoot-contact__form-button">Send Message</button>
        </form>
    </div>

    <!-- FAQ Section -->
    <div class="aerodoot-contact__container">
        <header class="aerodoot-contact__header">
            <h1 class="aerodoot-contact__header-title">Frequently Asked Questions</h1>
            <div class="aerodoot-contact__header-line"></div>
            <p class="aerodoot-contact__header-subtitle">Quick answers about domestic flight bookings</p>
        </header>

        <div class="aerodoot-contact__faq">
            <div class="aerodoot-contact__faq-item">
                <div class="aerodoot-contact__faq-question">
                    <h3>How do I check my flight status?</h3>
                    <span class="aerodoot-contact__faq-icon"><i class="fas fa-chevron-down"></i></span>
                </div>
                <div class="aerodoot-contact__faq-answer">
                    <p>You can check your flight status by entering your booking reference or flight number in the "Flight Status" section of our website or mobile app. Real-time updates for all domestic flights are provided including delays, gate changes, and estimated arrival times. You can also enable notifications to receive automatic updates about your flight.</p>
                </div>
            </div>

            <div class="aerodoot-contact__faq-item">
                <div class="aerodoot-contact__faq-question">
                    <h3>What is AeroDoot's cancellation policy?</h3>
                    <span class="aerodoot-contact__faq-icon"><i class="fas fa-chevron-down"></i></span>
                </div>
                <div class="aerodoot-contact__faq-answer">
                    <p>For domestic flights, you can cancel your booking up to 24 hours before departure for a full refund minus a $25 processing fee. Cancellations made less than 24 hours before departure are eligible for a partial refund (typically 50% of the fare) or a full credit toward a future flight within 12 months. Economy Saver fares are non-refundable but can be changed for a fee. For emergency situations, please contact our customer service team directly.</p>
                </div>
            </div>

            <div class="aerodoot-contact__faq-item">
                <div class="aerodoot-contact__faq-question">
                    <h3>How can I select or change my seat assignment?</h3>
                    <span class="aerodoot-contact__faq-icon"><i class="fas fa-chevron-down"></i></span>
                </div>
                <div class="aerodoot-contact__faq-answer">
                    <p>You can select your seat during the booking process or afterward by logging into your AeroDoot account and accessing the "Manage Booking" section. Seat selection is complimentary for Premium and Flex fare tickets. For Basic Economy tickets, seat selection is available for a fee starting at $8, depending on the flight duration and seat location. Seat changes can be made up to 2 hours before departure, subject to availability.</p>
                </div>
            </div>

            <div class="aerodoot-contact__faq-item">
                <div class="aerodoot-contact__faq-question">
                    <h3>How much baggage can I bring on my flight?</h3>
                    <span class="aerodoot-contact__faq-icon"><i class="fas fa-chevron-down"></i></span>
                </div>
                <div class="aerodoot-contact__faq-answer">
                    <p>All AeroDoot tickets include one personal item (like a purse or laptop bag) that fits under the seat. Standard Economy tickets include one carry-on bag. Premium tickets include one carry-on plus one checked bag up to 50 lbs. Additional bags or overweight items incur fees starting at $30 per bag. You can purchase additional baggage allowance during booking or through the "Manage Booking" section up to 3 hours before departure for a discount compared to airport rates.</p>
                </div>
            </div>

            <div class="aerodoot-contact__faq-item">
                <div class="aerodoot-contact__faq-question">
                    <h3>Do I need to print my boarding pass?</h3>
                    <span class="aerodoot-contact__faq-icon"><i class="fas fa-chevron-down"></i></span>
                </div>
                <div class="aerodoot-contact__faq-answer">
                    <p>No, printing is not required. AeroDoot offers mobile boarding passes through our app and via email. Simply download our app, log in to your account, and your boarding pass will be available 24 hours before departure. You can also check in online and receive your boarding pass via email. If you prefer a paper boarding pass, you can print one at home or use our self-service kiosks at the airport.</p>
                </div>
            </div>

            <div class="aerodoot-contact__faq-item">
                <div class="aerodoot-contact__faq-question">
                    <h3>How do I use my flight credits or vouchers?</h3>
                    <span class="aerodoot-contact__faq-icon"><i class="fas fa-chevron-down"></i></span>
                </div>
                <div class="aerodoot-contact__faq-answer">
                    <p>To redeem flight credits or vouchers, start a new booking on our website or app and enter your voucher code in the payment section when prompted. Your credit will be automatically applied to your purchase. Flight credits are typically valid for 12 months from the date of issue. If your credit doesn't cover the full amount of your new booking, you can pay the difference with a credit card. For assistance with expired vouchers, please contact our support team.</p>
                </div>
            </div>
        </div>
    </div>
</div>

    <script>
        // JavaScript for FAQ accordion functionality
        document.addEventListener('DOMContentLoaded', function() {
            const faqItems = document.querySelectorAll('.aerodoot-contact__faq-question');

            faqItems.forEach(item => {
                item.addEventListener('click', function() {
                    // Toggle active class on the clicked item
                    this.parentNode.classList.toggle('aerodoot-contact__faq-active');

                    // Rotate the icon
                    const icon = this.querySelector('.aerodoot-contact__faq-icon i');
                    if (this.parentNode.classList.contains('aerodoot-contact__faq-active')) {
                        icon.classList.replace('fa-chevron-down', 'fa-chevron-up');
                    } else {
                        icon.classList.replace('fa-chevron-up', 'fa-chevron-down');
                    }
                });
            });
        });
    </script>

<jsp:include page="tail.jsp" />
