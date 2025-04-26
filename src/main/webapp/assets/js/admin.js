// Static data for the application
console.log("loaded script")
const flightsData = [
    {
        id: "1",
        flightNumber: "AA1234",
        airline: "American Airlines",
        airlineCode: "AA",
        origin: "New York (JFK)",
        originCode: "jfk",
        destination: "London (LHR)",
        destinationCode: "lhr",
        departureDate: "2023-05-15",
        departureTime: "08:30",
        arrivalDate: "2023-05-15",
        arrivalTime: "20:45",
        status: "scheduled",
        aircraft: "Boeing 777-300ER",
        aircraftId: "1",
        capacity: 220,
        booked: 187,
        notes: ""
    },
    {
        id: "2",
        flightNumber: "BA5678",
        airline: "British Airways",
        airlineCode: "BA",
        origin: "London (LHR)",
        originCode: "lhr",
        destination: "Paris (CDG)",
        destinationCode: "cdg",
        departureDate: "2023-05-15",
        departureTime: "10:15",
        arrivalDate: "2023-05-15",
        arrivalTime: "12:30",
        status: "inair",
        aircraft: "Airbus A320",
        aircraftId: "3",
        capacity: 180,
        booked: 162,
        notes: ""
    },
    {
        id: "3",
        flightNumber: "UA9012",
        airline: "United Airlines",
        airlineCode: "UA",
        origin: "Chicago (ORD)",
        originCode: "ord",
        destination: "Los Angeles (LAX)",
        destinationCode: "lax",
        departureDate: "2023-05-15",
        departureTime: "12:00",
        arrivalDate: "2023-05-15",
        arrivalTime: "14:30",
        status: "delayed",
        aircraft: "Boeing 737-800",
        aircraftId: "2",
        capacity: 200,
        booked: 143,
        notes: "Delayed due to weather conditions"
    },
    {
        id: "4",
        flightNumber: "DL3456",
        airline: "Delta Air Lines",
        airlineCode: "DL",
        origin: "Atlanta (ATL)",
        originCode: "atl",
        destination: "Miami (MIA)",
        destinationCode: "mia",
        departureDate: "2023-05-15",
        departureTime: "14:45",
        arrivalDate: "2023-05-15",
        arrivalTime: "16:30",
        status: "ontime",
        aircraft: "Airbus A321",
        aircraftId: "4",
        capacity: 160,
        booked: 128,
        notes: ""
    },
    {
        id: "5",
        flightNumber: "EK7890",
        airline: "Emirates",
        airlineCode: "EK",
        origin: "Dubai (DXB)",
        originCode: "dxb",
        destination: "Singapore (SIN)",
        destinationCode: "sin",
        departureDate: "2023-05-15",
        departureTime: "23:30",
        arrivalDate: "2023-05-16",
        arrivalTime: "11:45",
        status: "scheduled",
        aircraft: "Airbus A380",
        aircraftId: "5",
        capacity: 350,
        booked: 298,
        notes: ""
    }
];

const bookingsData = [
    {
        id: "1",
        bookingId: "BK12345",
        passengerName: "John Smith",
        flightNumber: "AA1234",
        route: "JFK → LHR",
        bookingDate: "2023-04-28",
        status: "confirmed",
        amount: "$845.00"
    },
    {
        id: "2",
        bookingId: "BK12346",
        passengerName: "Emma Johnson",
        flightNumber: "BA5678",
        route: "LHR → CDG",
        bookingDate: "2023-04-29",
        status: "confirmed",
        amount: "$320.00"
    },
    {
        id: "3",
        bookingId: "BK12347",
        passengerName: "Michael Brown",
        flightNumber: "UA9012",
        route: "ORD → LAX",
        bookingDate: "2023-04-30",
        status: "pending",
        amount: "$560.00"
    },
    {
        id: "4",
        bookingId: "BK12348",
        passengerName: "Sophia Garcia",
        flightNumber: "DL3456",
        route: "ATL → MIA",
        bookingDate: "2023-05-01",
        status: "confirmed",
        amount: "$275.00"
    },
    {
        id: "5",
        bookingId: "BK12349",
        passengerName: "William Chen",
        flightNumber: "EK7890",
        route: "DXB → SIN",
        bookingDate: "2023-05-02",
        status: "cancelled",
        amount: "$1,250.00"
    }
];

const aircraftData = [
    {
        id: "1",
        registration: "N12345",
        manufacturer: "Boeing",
        model: "777-300ER",
        year: 2015,
        capacity: 368,
        status: "active",
        lastMaintenance: "2023-04-15"
    },
    {
        id: "2",
        registration: "N54321",
        manufacturer: "Boeing",
        model: "737-800",
        year: 2018,
        capacity: 189,
        status: "active",
        lastMaintenance: "2023-04-20"
    },
    {
        id: "3",
        registration: "G-EUPT",
        manufacturer: "Airbus",
        model: "A320",
        year: 2016,
        capacity: 180,
        status: "active",
        lastMaintenance: "2023-04-10"
    },
    {
        id: "4",
        registration: "N802DZ",
        manufacturer: "Airbus",
        model: "A321",
        year: 2019,
        capacity: 200,
        status: "maintenance",
        lastMaintenance: "2023-05-05"
    },
    {
        id: "5",
        registration: "A6-EUW",
        manufacturer: "Airbus",
        model: "A380",
        year: 2014,
        capacity: 615,
        status: "active",
        lastMaintenance: "2023-03-28"
    }
];

const airlinesData = [
    {
        id: "1",
        code: "AA",
        name: "American Airlines",
        country: "United States",
        founded: 1934,
        fleetSize: 956,
        status: "active"
    },
    {
        id: "2",
        code: "BA",
        name: "British Airways",
        country: "United Kingdom",
        founded: 1974,
        fleetSize: 277,
        status: "active"
    },
    {
        id: "3",
        code: "UA",
        name: "United Airlines",
        country: "United States",
        founded: 1926,
        fleetSize: 857,
        status: "active"
    },
    {
        id: "4",
        code: "DL",
        name: "Delta Air Lines",
        country: "United States",
        founded: 1925,
        fleetSize: 913,
        status: "active"
    },
    {
        id: "5",
        code: "EK",
        name: "Emirates",
        country: "United Arab Emirates",
        founded: 1985,
        fleetSize: 262,
        status: "active"
    }
];

// Modal handling functions
function openModal(modalId) {
    document.getElementById(modalId).classList.add('active');
}

function closeModal(modalId) {
    document.getElementById(modalId).classList.remove('active');
}

// Confirmation modal
function showConfirmation(message, callback, actionText = 'Delete') {
    const confirmationModal = document.getElementById('confirmation-modal');
    const confirmationMessage = document.getElementById('confirmation-message');
    const confirmActionBtn = document.getElementById('confirm-action-btn');

    confirmationMessage.textContent = message;
    confirmActionBtn.textContent = actionText;

    // Set up the confirm action
    confirmActionBtn.onclick = function() {
        callback();
        closeModal('confirmation-modal');
    };

    // Set up the cancel action
    document.getElementById('cancel-confirmation-btn').onclick = function() {
        closeModal('confirmation-modal');
    };

    // Set up the close button
    document.getElementById('close-confirmation-modal').onclick = function() {
        closeModal('confirmation-modal');
    };

    openModal('confirmation-modal');
}

// Helper functions for populating dropdowns
function populateAirlineDropdown(selectId = 'airline') {
    const airlineSelect = document.getElementById(selectId);
    if (!airlineSelect) return;

    airlineSelect.innerHTML = '<option value="">Select Airline</option>';

    airlinesData.forEach(airline => {
        const option = document.createElement('option');
        option.value = airline.id;
        option.textContent = `${airline.code} - ${airline.name}`;
        airlineSelect.appendChild(option);
    });
}

function populateAircraftDropdown(selectId = 'aircraft') {
    const aircraftSelect = document.getElementById(selectId);
    if (!aircraftSelect) return;

    aircraftSelect.innerHTML = '<option value="">Select Aircraft</option>';

    aircraftData.forEach(aircraft => {
        const option = document.createElement('option');
        option.value = aircraft.id;
        option.textContent = `${aircraft.registration} - ${aircraft.manufacturer} ${aircraft.model}`;
        aircraftSelect.appendChild(option);
    });
}

// Search functionality
function searchTable(tableId, searchInputId) {
    const searchInput = document.getElementById(searchInputId);
    const table = document.getElementById(tableId);

    if (!searchInput || !table) return;

    searchInput.addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        const rows = table.querySelectorAll('tbody tr');

        rows.forEach(row => {
            const text = row.textContent.toLowerCase();
            if (text.includes(searchTerm)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
}

// Filter functionality
function setupTableFilter(tableId, filterId, columnIndex) {
    const filterSelect = document.getElementById(filterId);
    const table = document.getElementById(tableId);

    if (!filterSelect || !table) return;

    filterSelect.addEventListener('change', function() {
        const filterValue = this.value.toLowerCase();
        const rows = table.querySelectorAll('tbody tr');

        rows.forEach(row => {
            const cell = row.cells[columnIndex];
            const cellText = cell.textContent.toLowerCase();

            if (filterValue === 'all' || cellText.includes(filterValue)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
}

// Date range filter
function setupDateRangeFilter(tableId, startDateId, endDateId, columnIndex) {
    const startDateInput = document.getElementById(startDateId);
    const endDateInput = document.getElementById(endDateId);
    const table = document.getElementById(tableId);

    if (!startDateInput || !endDateInput || !table) return;

    function filterByDateRange() {
        const startDate = new Date(startDateInput.value);
        const endDate = new Date(endDateInput.value);

        if (isNaN(startDate.getTime()) || isNaN(endDate.getTime())) return;

        const rows = table.querySelectorAll('tbody tr');

        rows.forEach(row => {
            const cell = row.cells[columnIndex];
            const dateText = cell.textContent.split(' ')[0]; // Extract date part
            const rowDate = new Date(dateText);

            if (rowDate >= startDate && rowDate <= endDate) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }

    startDateInput.addEventListener('change', filterByDateRange);
    endDateInput.addEventListener('change', filterByDateRange);
}

// Chart responsiveness
function setupChartResponsiveness(chartId, chart) {
    if (!chartId || !chart) return;

    // Handle window resize
    window.addEventListener('resize', function() {
        chart.resize();
    });

    // Handle orientation change for mobile devices
    window.addEventListener('orientationchange', function() {
        setTimeout(() => {
            chart.resize();
        }, 100);
    });
}

// Helper function to create charts with proper zoom configuration
function createZoomableChart(ctx, config) {
    if (!ctx) return null;

    // Ensure zoom plugin is properly configured
    const defaultZoomConfig = {
        zoom: {
            wheel: { enabled: false }, // Disable wheel zoom
            pinch: {
                enabled: true,         // Enable pinch zoom
                sensitivity: 1       // Increase sensitivity for better touch response
            },
            mode: 'xy',
        },
        pan: {
            enabled: true,
            mode: 'xy',
            threshold: 1,             // Reduce threshold for better touch response
        },
        limits: {
            y: { min: 'original', max: 'original' }
        }
    };

    // Merge default zoom config with provided config
    if (!config.options.plugins) {
        config.options.plugins = {};
    }

    config.options.plugins.zoom = {
        ...defaultZoomConfig,
        ...(config.options.plugins.zoom || {})
    };

    // Add responsive option
    config.options.responsive = true;
    config.options.maintainAspectRatio = false;

    // Create chart
    const chart = new Chart(ctx, config);

    // Setup chart responsiveness
    setupChartResponsiveness(ctx.canvas.id, chart);

    return chart;
}

// Reset zoom for a chart
function resetChartZoom(chart) {
    if (!chart) return;
    chart.resetZoom();
}

// Export chart as image
function exportChartAsImage(chart, filename = 'chart.png') {
    if (!chart) return;

    const url = chart.toBase64Image();
    const link = document.createElement('a');
    link.href = url;
    link.download = filename;
    link.click();
}

// Export data as CSV
function exportTableAsCSV(tableId, filename = 'data.csv') {
    const table = document.getElementById(tableId);
    if (!table) return;

    let csvContent = "data:text/csv;charset=utf-8,";

    // Get headers
    const headers = [];
    const headerCells = table.querySelectorAll('thead th');
    headerCells.forEach(cell => {
        headers.push(cell.textContent);
    });
    csvContent += headers.join(',') + '\r\n';

    // Get rows
    const rows = table.querySelectorAll('tbody tr');
    rows.forEach(row => {
        const rowData = [];
        const cells = row.querySelectorAll('td');
        cells.forEach(cell => {
            // Remove any commas from the cell text to avoid CSV issues
            let text = cell.textContent.replace(/,/g, ' ');
            // Remove any HTML content
            text = text.replace(/<[^>]*>/g, '');
            rowData.push(text);
        });
        csvContent += rowData.join(',') + '\r\n';
    });

    // Create download link
    const encodedUri = encodeURI(csvContent);
    const link = document.createElement('a');
    link.setAttribute('href', encodedUri);
    link.setAttribute('download', filename);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

// Utility function to format date
function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString();
}

// Utility function to format time
function formatTime(timeString) {
    return timeString;
}

// Utility function to capitalize first letter
function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

// Utility function to generate a unique ID
function generateId() {
    return Date.now().toString(36) + Math.random().toString(36).substr(2, 5);
}

// Utility function to debounce function calls
function debounce(func, wait) {
    let timeout;
    return function(...args) {
        const context = this;
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(context, args), wait);
    };
}

// Utility function to throttle function calls
function throttle(func, limit) {
    let inThrottle;
    return function(...args) {
        const context = this;
        if (!inThrottle) {
            func.apply(context, args);
            inThrottle = true;
            setTimeout(() => inThrottle = false, limit);
        }
    };
}

function updateActiveMenuItem(tabId) {
    document.querySelectorAll('.sidebar-menu-item').forEach(item => {
        item.classList.remove('active');
    });

    document.querySelector(`.sidebar-menu-item[data-tab="${tabId}"]`)?.classList.add('active');
}

// Handle touch events for mobile
document.addEventListener('touchstart', handleTouchStart, false);
document.addEventListener('touchmove', handleTouchMove, false);

let xDown = null;
let yDown = null;

function handleTouchStart(evt) {
    xDown = evt.touches[0].clientX;
    yDown = evt.touches[0].clientY;
}

function handleTouchMove(evt) {
    if (!xDown || !yDown) {
        return;
    }

    const xUp = evt.touches[0].clientX;
    const yUp = evt.touches[0].clientY;

    const xDiff = xDown - xUp;
    const yDiff = yDown - yUp;

    if (Math.abs(xDiff) > Math.abs(yDiff)) {
        if (xDiff > 0) {
            // Swipe left - hide sidebar on mobile
            if (window.innerWidth <= 992) {
                document.getElementById('sidebar').classList.add('collapsed');
                document.querySelector('.main-content').classList.add('expanded');
            }
        } else {
            // Swipe right - show sidebar on mobile
            if (window.innerWidth <= 992) {
                document.getElementById('sidebar').classList.remove('collapsed');
                document.querySelector('.main-content').classList.remove('expanded');
            }
        }
    }

    xDown = null;
    yDown = null;
}
