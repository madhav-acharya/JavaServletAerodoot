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

<%--<script>--%>
<%--    document.addEventListener('DOMContentLoaded', function() {--%>

<%--        const destinationsContainer = document.getElementById('destinations-container');--%>
<%--        const paginationDots = document.querySelectorAll('.pagination-dot');--%>
<%--        const itemsPerPage = 3;--%>
<%--        let currentPage = 1;--%>

<%--        // Function to render destinations--%>
<%--        function renderDestinations(page) {--%>
<%--            const startIndex = (page - 1) * itemsPerPage;--%>
<%--            const endIndex = startIndex + itemsPerPage;--%>
<%--            const currentDestinations = destinations.slice(startIndex, endIndex);--%>

<%--            destinationsContainer.innerHTML = '';--%>

<%--            currentDestinations.forEach(destination => {--%>
<%--                const card = document.createElement('div');--%>
<%--                card.className = 'destination-card';--%>

<%--                card.innerHTML = `--%>
<%--                        <div class="destination-image">--%>
<%--                            <img src="">--%>
<%--                            <div class="price-tag">From Rs 5500</div>--%>
<%--                        </div>--%>
<%--                        <div class="destination-info">--%>
<%--                            <h3 class="destination-title">Kathmandu to Lukla</h3>--%>
<%--                            <p class="destination-type">Direct Flight</p>--%>
<%--                        </div>--%>
<%--                    `;--%>

<%--                destinationsContainer.appendChild(card);--%>
<%--            });--%>

<%--            // Update active pagination dot--%>
<%--            paginationDots.forEach(dot => {--%>
<%--                if (parseInt(dot.getAttribute('data-page')) === page) {--%>
<%--                    dot.classList.add('active');--%>
<%--                } else {--%>
<%--                    dot.classList.remove('active');--%>
<%--                }--%>
<%--            });--%>
<%--        }--%>

<%--        // Initialize with first page--%>
<%--        renderDestinations(currentPage);--%>

<%--        // Add click event listeners to pagination dots--%>
<%--        paginationDots.forEach(dot => {--%>
<%--            dot.addEventListener('click', function() {--%>
<%--                const page = parseInt(this.getAttribute('data-page'));--%>
<%--                currentPage = page;--%>
<%--                renderDestinations(page);--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>