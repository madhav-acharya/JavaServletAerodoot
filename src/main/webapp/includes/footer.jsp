<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-brand">
                <h3> <img src="${pageContext.request.contextPath}/assets/image/aerodoot-logo.svg" alt="AeroDoot Logo" class="logo" /> AeroDoot</h3>
                <p>Your trusted partner for air travel management. Fly with confidence, manage with ease.</p>
            </div>

            <div class="footer-links">
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Login</a></li>
                        <li><a href="#">Register</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h4>Support</h4>
                    <ul>
                        <li><a href="#">Help Center</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">FAQs</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h4>Legal</h4>
                    <ul>
                        <li><a href="#">Terms of Service</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Cookie Policy</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="footer-bottom">
            <p>&copy; <%= java.time.Year.now().getValue() %> AeroDoot Airlines Management System. All rights reserved.</p>
        </div>
    </div>
</footer>
