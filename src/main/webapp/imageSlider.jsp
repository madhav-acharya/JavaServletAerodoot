<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="slider-container">
<div class="slider">
    <!-- Slide 1 -->
    <div class="slide">
        <img src="https://images.unsplash.com/photo-1436491865332-7a61a109cc05?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="Flight to Asia">
        <div class="slide-content">
            <h2>MH Online Specials</h2>
            <p>Book online for unmissable deals of up to 15% off</p>
            <div class="benefits">
                <div class="benefit-item">
                    <i class="fas fa-suitcase-rolling"></i>
                    <span>Complimentary relocating</span>
                </div>
                <div class="benefit-item">
                    <i class="fas fa-money-bill-wave"></i>
                    <span>Free refund</span>
                </div>
                <div class="benefit-item">
                    <i class="fas fa-sliders-h"></i>
                    <span>Customise your booking</span>
                </div>
                <div class="benefit-item">
                    <i class="fas fa-child"></i>
                    <span>Child discounts</span>
                </div>
            </div>
            <button class="cta-button">
                Book now
                <i class="fas fa-arrow-right"></i>
            </button>
            <div class="terms">Your Gateway to Asia & Beyond | T&Cs apply</div>
        </div>
    </div>

    <!-- Slide 2 -->
    <div class="slide">
        <img src="${pageContext.request.contextPath}/assets/image/KTM-POK-04.jpg" alt="Summer Vacation">
        <div class="slide-content">
            <h2>Summer Getaway Deals</h2>
            <p>Save up to 20% on selected destinations this summer</p>
            <div class="benefits">
                <div class="benefit-item">
                    <i class="fas fa-umbrella-beach"></i>
                    <span>Exclusive beach resorts</span>
                </div>
                <div class="benefit-item">
                    <i class="fas fa-plane"></i>
                    <span>Flexible flight dates</span>
                </div>
                <div class="benefit-item">
                    <i class="fas fa-hotel"></i>
                    <span>Free hotel upgrades</span>
                </div>
                <div class="benefit-item">
                    <i class="fas fa-gift"></i>
                    <span>Bonus travel credits</span>
                </div>
            </div>
            <button class="cta-button">
                Explore Deals
                <i class="fas fa-arrow-right"></i>
            </button>
            <div class="terms">Limited time offer | T&Cs apply</div>
        </div>
    </div>

    <!-- Slide 3 -->
    <div class="slide">
        <img src="${pageContext.request.contextPath}/assets/image/KTM-BHRTPUR-05.jpg" alt="Business Class">
        <div class="slide-content">
            <h2>Business Class Upgrade</h2>
            <p>Experience luxury in the skies with 30% off business class</p>
            <div class="benefits">
                <div class="benefit-item">
                    <i class="fas fa-chair"></i>
                    <span>Lie-flat seats</span>
                </div>
                <div class="benefit-item">
                    <i class="fas fa-utensils"></i>
                    <span>Gourmet dining</span>
                </div>
                <div class="benefit-item">
                    <i class="fas fa-wifi"></i>
                    <span>Premium WiFi</span>
                </div>
                <div class="benefit-item">
                    <i class="fas fa-suitcase"></i>
                    <span>Extra baggage allowance</span>
                </div>
            </div>
            <button class="cta-button">
                Upgrade Now
                <i class="fas fa-arrow-right"></i>
            </button>
            <div class="terms">Limited seats available | T&Cs apply</div>
        </div>
    </div>
</div>

<button class="slider-arrow left">
    <i class="fas fa-chevron-left"></i>
</button>
<button class="slider-arrow right">
    <i class="fas fa-chevron-right"></i>
</button>

<div class="slider-nav">
    <div class="slider-dot active"></div>
    <div class="slider-dot"></div>
    <div class="slider-dot"></div>
</div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const slider = document.querySelector('.slider');
        const slides = document.querySelectorAll('.slide');
        const dots = document.querySelectorAll('.slider-dot');
        const prevBtn = document.querySelector('.slider-arrow.left');
        const nextBtn = document.querySelector('.slider-arrow.right');

        let currentSlide = 0;
        const slideCount = slides.length;

        // Initialize slider
        function updateSlider() {
            console.log("Updating to slide:", currentSlide)
            slider.style.transform = `translateX(-${currentSlide * 100}%)`;

            // Update dots
            dots.forEach((dot, index) => {
                dot.classList.toggle('active', index === currentSlide);
            });
        }

        // Next slide
        function nextSlide() {
            currentSlide = (currentSlide + 1) % slideCount;
            updateSlider();
        }

        // Previous slide
        function prevSlide() {
            currentSlide = (currentSlide - 1 + slideCount) % slideCount;
            updateSlider();
        }

        // Click on dot
        dots.forEach((dot, index) => {
            dot.addEventListener('click', () => {
                currentSlide = index;
                updateSlider();
            });
        });

        // Button events
        nextBtn.addEventListener('click', nextSlide);
        prevBtn.addEventListener('click', prevSlide);

        // Auto slide
        let slideInterval = setInterval(nextSlide, 5000);

        // Pause on hover
        slider.addEventListener('mouseenter', () => {
            clearInterval(slideInterval);
        });

        slider.addEventListener('mouseleave', () => {
            slideInterval = setInterval(nextSlide, 5000);
        });

        // Keyboard navigation
        document.addEventListener('keydown', (e) => {
            if (e.key === 'ArrowRight') {
                nextSlide();
            } else if (e.key === 'ArrowLeft') {
                prevSlide();
            }
        });

        // Touch events for mobile
        let touchStartX = 0;
        let touchEndX = 0;

        slider.addEventListener('touchstart', (e) => {
            touchStartX = e.changedTouches[0].screenX;
        }, {passive: true});

        slider.addEventListener('touchend', (e) => {
            touchEndX = e.changedTouches[0].screenX;
            handleSwipe();
        }, {passive: true});

        function handleSwipe() {
            if (touchEndX < touchStartX - 50) {
                nextSlide();
            } else if (touchEndX > touchStartX + 50) {
                prevSlide();
            }
        }
    });
</script>