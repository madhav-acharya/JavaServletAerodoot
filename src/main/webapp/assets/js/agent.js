// Agent Dashboard JavaScript
document.addEventListener('DOMContentLoaded', function() {
    // Initialize date display
    updateCurrentDate();

    // Setup sidebar toggle
    setupSidebarToggle();

    // Initialize charts if on dashboard page
    if (document.getElementById('bookingTrendsChart')) {
        initializeCharts();
    }

    // Setup flight search if on booking page
    if (document.querySelector('.flight-search-form')) {
        setupFlightSearch();
    }
});

function updateCurrentDate() {
    const dateElem = document.getElementById('current-date');
    if (dateElem) {
        const now = new Date();
        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        dateElem.textContent = now.toLocaleDateString('en-US', options);
    }
}

function setupSidebarToggle() {
    const toggle = document.getElementById('sidebar-toggle');
    const container = document.querySelector('.dashboard-container');

    if (toggle && container) {
        toggle.addEventListener('click', () => {
            container.classList.toggle('sidebar-collapsed');
        });
    }
}

function initializeCharts() {
    // Booking Trends Chart
    const bookingTrends = document.getElementById('bookingTrendsChart');
    if (bookingTrends) {
        new Chart(bookingTrends, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Bookings',
                    data: [65, 59, 80, 81, 56, 55],
                    borderColor: '#4d90fe',
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });
    }

    // Revenue by Class Chart
    const revenueByClass = document.getElementById('revenueByClassChart');
    if (revenueByClass) {
        new Chart(revenueByClass, {
            type: 'doughnut',
            data: {
                labels: ['Economy', 'Business'],
                datasets: [{
                    data: [70, 30],
                    backgroundColor: ['#4d90fe', '#1a3a5f']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });
    }
}

function setupFlightSearch() {
    // Swap destinations
    const swapBtn = document.getElementById('swap-destinations');
    const departure = document.getElementById('departure');
    const arrival = document.getElementById('arrival');

    if (swapBtn && departure && arrival) {
        swapBtn.addEventListener('click', () => {
            const temp = departure.value;
            departure.value = arrival.value;
            arrival.value = temp;
        });
    }

    // Flight filters
    const filterBtns = document.querySelectorAll('.filter-btn');
    filterBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            filterBtns.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
        });
    });

    // Sort flights
    const sortSelect = document.getElementById('sort');
    if (sortSelect) {
        sortSelect.addEventListener('change', () => {
            // Implement sorting logic here
        });
    }
}

function selectFlight(flightId) {
    // Implement flight selection logic
    console.log('Selected flight:', flightId);
    // You would typically make an AJAX call to your server here
}