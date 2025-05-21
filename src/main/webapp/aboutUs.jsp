<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp"/>
<!-- Hero Section -->
<section class="aerodoot-hero-section">
    <h1 class="aerodoot-company-title">About <span class="aerodoot-brand-highlight">AeroDoot</span></h1>

    <div class="aerodoot-plane-icon">
        <i class="fas fa-plane" aria-hidden="true"></i>
    </div>

    <p class="aerodoot-company-description">
        Your trusted partner for comprehensive airline management solutions,
        connecting passengers, airlines, and travel agencies worldwide since
        2023.
    </p>

    <div class="aerodoot-buttons-container">
        <a href="#contact" class="aerodoot-contact-btn">Contact Us</a>
        <a href="#join" class="aerodoot-join-btn">Join Now</a>
    </div>

    <div class="aerodoot-wave-shape"></div>
</section>

<!-- Stats Section -->
<section class="aerodoot-stats-section">
    <div class="aerodoot-stat-card">
        <h2 class="aerodoot-stat-number">50+</h2>
        <p class="aerodoot-stat-label">Airlines</p>
    </div>

    <div class="aerodoot-stat-card">
        <h2 class="aerodoot-stat-number">120+</h2>
        <p class="aerodoot-stat-label">Destinations</p>
    </div>

    <div class="aerodoot-stat-card">
        <h2 class="aerodoot-stat-number">1M+</h2>
        <p class="aerodoot-stat-label">Happy Customers</p>
    </div>

    <div class="aerodoot-stat-card">
        <h2 class="aerodoot-stat-number">24/7</h2>
        <p class="aerodoot-stat-label">Support</p>
    </div>
</section>

<!-- Our Purpose Section -->
<section class="aerodoot-purpose-section">
    <h2 class="aerodoot-section-title">Our Purpose</h2>
    <div class="aerodoot-underline"></div>
    <p class="aerodoot-section-subtitle">Driven by innovation and excellence in airline services management</p>

    <div class="aerodoot-mission-vision-container">
        <div class="aerodoot-card aerodoot-mission-card">
            <div class="aerodoot-icon-container">
                <i class="fas fa-plane"></i>
            </div>
            <h3 class="aerodoot-card-title">Our Mission</h3>
            <p class="aerodoot-card-text">
                AeroDoot is committed to revolutionizing the airline management industry by
                providing an intuitive, efficient, and secure platform that connects passengers,
                airlines, and travel agents. We aim to simplify the complexities of air travel
                management while ensuring exceptional service quality.
            </p>
        </div>

        <div class="aerodoot-card aerodoot-vision-card">
            <div class="aerodoot-icon-container aerodoot-globe-icon">
                <i class="fas fa-globe"></i>
            </div>
            <h3 class="aerodoot-card-title">Our Vision</h3>
            <p class="aerodoot-card-text">
                We envision a future where air travel management is seamless, transparent,
                and accessible to all. By leveraging cutting-edge technology and industry
                expertise, we strive to be the global leader in airline service management
                systems, setting new standards for efficiency and customer satisfaction.
            </p>
        </div>
    </div>
</section>

<!-- Our Journey Section -->
<section class="aerodoot-journey-section">
    <h2 class="aerodoot-section-title">Our Journey</h2>
    <div class="aerodoot-underline"></div>

    <div class="aerodoot-journey-container">
        <div class="aerodoot-journey-image">
            <img src="${pageContext.request.contextPath}/assets/image/aboutUs-bg.jpg" alt="Airplane on runway at dusk with mountains in background">
        </div>

        <div class="aerodoot-journey-timeline">
            <div class="aerodoot-timeline-item">
                <div class="aerodoot-timeline-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="aerodoot-timeline-content">
                    <h3 class="aerodoot-timeline-title">Founded with a Purpose</h3>
                    <p class="aerodoot-timeline-text">
                        Founded in 2023, AeroDoot emerged from recognizing a significant gap in the
                        airline management sector. Our founders combined their extensive expertise in
                        aviation and technology to create a solution that addresses real industry
                        challenges.
                    </p>
                </div>
            </div>

            <div class="aerodoot-timeline-item">
                <div class="aerodoot-timeline-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="aerodoot-timeline-content">
                    <h3 class="aerodoot-timeline-title">Rapid Growth</h3>
                    <p class="aerodoot-timeline-text">
                        What began as a solution for small regional airlines has evolved into a
                        comprehensive management system trusted by major carriers, travel agencies,
                        and millions of passengers worldwide.
                    </p>
                </div>
            </div>

            <div class="aerodoot-timeline-item">
                <div class="aerodoot-timeline-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="aerodoot-timeline-content">
                    <h3 class="aerodoot-timeline-title">Continuous Innovation</h3>
                    <p class="aerodoot-timeline-text">
                        Today, AeroDoot stands as a testament to innovation meeting expertise. We
                        continue to expand our services, refine our platform, and forge new partnerships
                        to make air travel management more efficient for all stakeholders.
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Our Core Values Section -->
<section class="aerodoot-values-section">
    <h2 class="aerodoot-section-title">Our Core Values</h2>
    <div class="aerodoot-underline"></div>
    <p class="aerodoot-section-subtitle">The principles that guide everything we do</p>

    <div class="aerodoot-values-container">
        <div class="aerodoot-value-card">
            <div class="aerodoot-value-icon">
                <i class="fas fa-shield-alt"></i>
            </div>
            <h3 class="aerodoot-value-title">Trust & Security</h3>
            <p class="aerodoot-value-text">
                We prioritize data security and build trust
                through transparent operations and reliable
                service.
            </p>
        </div>

        <div class="aerodoot-value-card">
            <div class="aerodoot-value-icon">
                <i class="fas fa-users"></i>
            </div>
            <h3 class="aerodoot-value-title">Customer Focus</h3>
            <p class="aerodoot-value-text">
                Every feature and decision is guided by the
                needs and experiences of our users across
                all roles.
            </p>
        </div>

        <div class="aerodoot-value-card">
            <div class="aerodoot-value-icon">
                <i class="fas fa-globe"></i>
            </div>
            <h3 class="aerodoot-value-title">Global Perspective</h3>
            <p class="aerodoot-value-text">
                We design our solutions with global
                standards and diverse market requirements
                in mind.
            </p>
        </div>
    </div>
</section>

<!-- What We Offer Section -->
<section class="aerodoot-offer-section">
    <h2 class="aerodoot-section-title">What We Offer</h2>
    <div class="aerodoot-underline"></div>
    <p class="aerodoot-section-subtitle">Comprehensive solutions for all your airline management needs</p>

    <div class="aerodoot-offer-container">
        <div class="aerodoot-service-card">
            <div class="aerodoot-service-icon">
                <i class="fas fa-plane"></i>
            </div>
            <h3 class="aerodoot-service-title">Flight Management</h3>
            <p class="aerodoot-service-text">
                Complete solutions for airlines to
                manage flights, schedules, and
                passenger information efficiently.
            </p>
        </div>

        <div class="aerodoot-service-card">
            <div class="aerodoot-service-icon">
                <i class="fas fa-clock"></i>
            </div>
            <h3 class="aerodoot-service-title">Real-time Updates</h3>
            <p class="aerodoot-service-text">
                Instant booking confirmations and
                real-time updates on flight status
                and schedule changes.
            </p>
        </div>

        <div class="aerodoot-service-card">
            <div class="aerodoot-service-icon">
                <i class="fas fa-users"></i>
            </div>
            <h3 class="aerodoot-service-title">Multi-role Platform</h3>
            <p class="aerodoot-service-text">
                Tailored interfaces and functionality
                for passengers, airline
                administrators, and travel agents.
            </p>
        </div>

        <div class="aerodoot-service-card">
            <div class="aerodoot-service-icon">
                <i class="fas fa-shield-alt"></i>
            </div>
            <h3 class="aerodoot-service-title">Secure Payments</h3>
            <p class="aerodoot-service-text">
                Multiple secure payment options
                with comprehensive transaction
                records.
            </p>
        </div>
    </div>
</section>
<jsp:include page="tail.jsp"/>