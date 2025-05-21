// Agent Dashboard JavaScript

document.addEventListener('DOMContentLoaded', function() {
    // Initialize the current date display
    updateCurrentDate();

    // Initialize charts
    initializeCharts();

    // Setup tab navigation
    setupTabNavigation();

    // Setup sidebar toggle
    setupSidebarToggle();

    // Setup profile tab panels
    setupProfileTabs();

    // Setup modals
    setupModals();

    // Setup booking steps
    setupBookingSteps();

    // Setup flight search interactions
    setupFlightSearch();

    // Setup payment options
    setupPaymentOptions();

    // Setup passenger selection
    setupPassengerSelection();
});

// Update current date in header
function updateCurrentDate() {
    const dateElem = document.getElementById('current-date');
    if (dateElem) {
        const now = new Date();
        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        dateElem.textContent = now.toLocaleDateString('en-US', options);
    }
}

// Initialize analytics charts
function initializeCharts() {
    // Booking Trends Chart
    const bookingTrendsCtx = document.getElementById('bookingTrendsChart');
    if (bookingTrendsCtx) {
        new Chart(bookingTrendsCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [{
                    label: 'Bookings',
                    data: [12, 19, 15, 5, 8, 13, 17, 23, 18, 12, 9, 15],
                    borderColor: '#4d90fe',
                    backgroundColor: 'rgba(77, 144, 254, 0.1)',
                    tension: 0.3,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            display: true,
                            drawBorder: false
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        }
                    }
                }
            }
        });
    }

    // Revenue by Class Chart
    const revenueByClassCtx = document.getElementById('revenueByClassChart');
    if (revenueByClassCtx) {
        new Chart(revenueByClassCtx, {
            type: 'doughnut',
            data: {
                labels: ['Economy', 'Business'],
                datasets: [{
                    data: [7500, 4950],
                    backgroundColor: ['#4d90fe', '#1a3a5f'],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                cutout: '70%',
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });
    }
}

// Setup tab navigation
function setupTabNavigation() {
    const navLinks = document.querySelectorAll('.nav-link');
    const tabPanes = document.querySelectorAll('.tab-pane');

    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();

            // Remove active class from all links and their parent li
            navLinks.forEach(link => {
                link.parentElement.classList.remove('active');
            });

            // Add active class to clicked link's parent li
            this.parentElement.classList.add('active');

            // Hide all tab panes
            tabPanes.forEach(pane => {
                pane.classList.remove('active');
            });

            // Show the corresponding tab pane
            const tabId = this.getAttribute('data-tab');
            document.getElementById(tabId).classList.add('active');
        });
    });
}

// Setup sidebar toggle
function setupSidebarToggle() {
    const sidebarToggle = document.getElementById('sidebar-toggle');
    const dashboardContainer = document.querySelector('.dashboard-container');
    const sidebar = document.querySelector('.sidebar');

    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', function() {
            dashboardContainer.classList.toggle('sidebar-collapsed');
            sidebar.classList.toggle('show');
        });
    }

    // Close sidebar on smaller screens when clicking outside
    document.addEventListener('click', function(e) {
        const isSmallScreen = window.innerWidth <= 768;
        const isClickInsideSidebar = sidebar.contains(e.target);
        const isClickOnToggle = sidebarToggle.contains(e.target);

        if (isSmallScreen && !isClickInsideSidebar && !isClickOnToggle && sidebar.classList.contains('show')) {
            sidebar.classList.remove('show');
        }
    });
}

// Setup profile tab panels
function setupProfileTabs() {
    const tabBtns = document.querySelectorAll('.tab-btn');
    const tabPanels = document.querySelectorAll('.tab-panel');

    tabBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const tabId = this.getAttribute('data-tab');

            // Remove active class from all buttons
            tabBtns.forEach(btn => {
                btn.classList.remove('active');
            });

            // Add active class to clicked button
            this.classList.add('active');

            // Hide all tab panels
            tabPanels.forEach(panel => {
                panel.classList.remove('active');
            });

            // Show the corresponding tab panel
            document.getElementById(tabId).classList.add('active');
        });
    });
}

// Setup modals
function setupModals() {
    // Passenger Modal
    const addPassengerBtn = document.getElementById('add-passenger-btn');
    const passengerModal = document.getElementById('passenger-modal');
    const closeModalBtns = document.querySelectorAll('.close-modal');
    const cancelPassengerBtn = document.getElementById('cancel-passenger');
    const savePassengerBtn = document.getElementById('save-passenger');

    if (addPassengerBtn && passengerModal) {
        addPassengerBtn.addEventListener('click', function() {
            passengerModal.classList.add('active');
        });
    }

    // Add New Passenger from Booking Modal
    const addNewPassengerBtn = document.getElementById('add-new-passenger-btn');
    if (addNewPassengerBtn && passengerModal) {
        addNewPassengerBtn.addEventListener('click', function() {
            passengerModal.classList.add('active');
        });
    }

    // Close modal buttons
    closeModalBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const modal = this.closest('.modal');
            modal.classList.remove('active');
        });
    });

    // Cancel passenger registration
    if (cancelPassengerBtn) {
        cancelPassengerBtn.addEventListener('click', function() {
            passengerModal.classList.remove('active');
        });
    }

    // Save passenger (mock functionality)
    if (savePassengerBtn) {
        savePassengerBtn.addEventListener('click', function() {
            // Here you would normally validate the form and submit it
            passengerModal.classList.remove('active');
            showToast('Passenger registered successfully!');
        });
    }

    // Booking Modal
    const bookingModal = document.getElementById('booking-modal');
    const btnPrimary = document.querySelector('.btn-primary');

    if (btnPrimary && bookingModal) {
        btnPrimary.addEventListener('click', function() {
            bookingModal.classList.add('active');
        });
    }

    // Close modals when clicking outside
    window.addEventListener('click', function(e) {
        if (e.target.classList.contains('modal')) {
            e.target.classList.remove('active');
        }
    });
}

// Setup booking steps
function setupBookingSteps() {
    const nextStepBtn = document.getElementById('next-step');
    const prevStepBtn = document.getElementById('prev-step');
    const steps = document.querySelectorAll('.booking-steps .step');
    const stepContents = document.querySelectorAll('.booking-step-content');
    let currentStep = 0;

    if (nextStepBtn && prevStepBtn) {
        nextStepBtn.addEventListener('click', function() {
            if (currentStep < steps.length - 1) {
                currentStep++;
                updateBookingSteps();
            }
        });

        prevStepBtn.addEventListener('click', function() {
            if (currentStep > 0) {
                currentStep--;
                updateBookingSteps();
            }
        });
    }

    function updateBookingSteps() {
        // Update step indicators
        steps.forEach((step, index) => {
            if (index <= currentStep) {
                step.classList.add('active');
            } else {
                step.classList.remove('active');
            }
        });

        // Update step content visibility
        stepContents.forEach((content, index) => {
            content.classList.remove('active');
        });
        stepContents[currentStep].classList.add('active');

        // Update buttons
        prevStepBtn.disabled = currentStep === 0;
        if (currentStep === steps.length - 1) {
            nextStepBtn.textContent = 'Finish';
        } else {
            nextStepBtn.textContent = 'Next';
        }
    }
}

// Setup flight search interactions
function setupFlightSearch() {
    const swapDestinationsBtn = document.getElementById('swap-destinations');
    const departureSelect = document.getElementById('departure');
    const arrivalSelect = document.getElementById('arrival');

    if (swapDestinationsBtn && departureSelect && arrivalSelect) {
        swapDestinationsBtn.addEventListener('click', function() {
            const tempValue = departureSelect.value;
            departureSelect.value = arrivalSelect.value;
            arrivalSelect.value = tempValue;
        });
    }

    // Filter buttons
    const filterBtns = document.querySelectorAll('.filter-btn');

    filterBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            filterBtns.forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // Select flight
    const selectFlightBtns = document.querySelectorAll('.select-flight');
    const bookingModal = document.getElementById('booking-modal');

    selectFlightBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const flightCard = this.closest('.flight-card');
            bookingModal.classList.add('active');
        });
    });
}

// Setup payment options
function setupPaymentOptions() {
    const paymentOptions = document.querySelectorAll('.payment-option');

    paymentOptions.forEach(option => {
        option.addEventListener('click', function() {
            const radioInput = this.querySelector('input[type="radio"]');

            // Uncheck all radio inputs
            document.querySelectorAll('.payment-option input[type="radio"]').forEach(input => {
                input.checked = false;
                input.closest('.payment-option').classList.remove('selected');
            });

            // Check the clicked radio input
            radioInput.checked = true;
            this.classList.add('selected');
        });
    });
}

// Setup passenger selection
function setupPassengerSelection() {
    const passengerItems = document.querySelectorAll('.passenger-item');

    passengerItems.forEach(item => {
        item.addEventListener('click', function() {
            const radioInput = this.querySelector('input[type="radio"]');

            // Uncheck all radio inputs
            document.querySelectorAll('.passenger-item input[type="radio"]').forEach(input => {
                input.checked = false;
                input.closest('.passenger-item').classList.remove('selected');
            });

            // Check the clicked radio input
            radioInput.checked = true;
            this.classList.add('selected');
        });
    });
}

// Show toast notification
function showToast(message, type = 'success') {
    const toast = document.getElementById('toast');
    const toastMessage = toast.querySelector('.toast-message');
    const toastIcon = toast.querySelector('.toast-icon i');

    // Set message
    toastMessage.textContent = message;

    // Set icon based on type
    if (type === 'success') {
        toastIcon.className = 'fas fa-check-circle';
        toastIcon.style.color = 'var(--success-color)';
    } else if (type === 'error') {
        toastIcon.className = 'fas fa-times-circle';
        toastIcon.style.color = 'var(--error-color)';
    } else if (type === 'warning') {
        toastIcon.className = 'fas fa-exclamation-circle';
        toastIcon.style.color = 'var(--warning-color)';
    } else if (type === 'info') {
        toastIcon.className = 'fas fa-info-circle';
        toastIcon.style.color = 'var(--secondary-color)';
    }

    // Show the toast
    toast.classList.add('show');

    // Hide after 3 seconds
    setTimeout(() => {
        toast.classList.remove('show');
    }, 3000);

    // Close toast when clicking close button
    const closeToast = toast.querySelector('.toast-close');
    closeToast.addEventListener('click', function() {
        toast.classList.remove('show');
    });
}