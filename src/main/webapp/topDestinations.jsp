<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="top-destinations-container">
    <h2 class="section-title">Top Destinations</h2>

    <div class="destinations-container" id="destinations-container">
        <!-- Destinations will be loaded dynamically via JavaScript -->
        <div class="destination-card">
            <div class="destination-image">
                <img src="${pageContext.request.contextPath}/assets/image/KTM-LUK.jpg">
                <div class="price-tag">From Rs 6500</div>
            </div>
            <div class="destination-info">
                <h3 class="destination-title">Kathmandu to Lukla</h3>
                <p class="destination-type">Direct Flight</p>
            </div>
        </div>

        <div class="destination-card">
            <div class="destination-image">
                <img src="${pageContext.request.contextPath}/assets/image/KTM-BHRTPUR-05.jpg">
                <div class="price-tag">From Rs 5500</div>
            </div>
            <div class="destination-info">
                <h3 class="destination-title">Kathmandu to Bharatpur</h3>
                <p class="destination-type">Direct Flight</p>
            </div>
        </div>

        <div class="destination-card">
            <div class="destination-image">
                <img src="${pageContext.request.contextPath}/assets/image/KTM-POK-04.jpg">
                <div class="price-tag">From Rs 5000</div>
            </div>
            <div class="destination-info">
                <h3 class="destination-title">Kathmandu to Pokhara</h3>
                <p class="destination-type">Direct Flight</p>
            </div>
        </div>
    </div>
</div>