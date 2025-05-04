function openModal(modalId) {
    document.getElementById(modalId).classList.add('active');
}

function closeModal(modalId) {
    document.getElementById(modalId).classList.remove('active');
}

// Confirmation modal
function showConfirmation(message, callback, actionText = 'Confirm') {
    const confirmationMessage = document.getElementById('confirmation-message');
    const confirmActionBtn = document.getElementById('confirm-action-btn');
    const cancelConfirmationBtn = document.getElementById('cancel-confirmation-btn');
    const closeConfirmationModal = document.getElementById('close-confirmation-modal');

    confirmationMessage.textContent = message;
    confirmActionBtn.textContent = actionText;

    confirmActionBtn.onclick = function() {
        callback();
        closeModal('confirmation-modal');
    };

    cancelConfirmationBtn.onclick = function() {
        closeModal('confirmation-modal');
    };

    closeConfirmationModal.onclick = function() {
        closeModal('confirmation-modal');
    };

    openModal('confirmation-modal');
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
            const cellText = cell.textContent.toLowerCase() ;

            if (filterValue === 'all' || cellText.includes(filterValue) || cell.textContent.toUpperCase()) {
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
    console.log(tabId)
    document.querySelectorAll('.sidebar-menu-item').forEach(item => {
        item.classList.remove('active');
    });

    document.querySelector(`.sidebar-menu-item[data-tab="${tabId}"]`)?.classList.add('active');
    localStorage.setItem('activeTab', tabId);
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

function showSidebar() {
    document.getElementById('sidebar').classList.remove('collapsed');
    document.querySelector('.main-content').classList.remove('expanded');
}

function hideSidebar() {
    document.getElementById('sidebar').classList.add('collapsed');
    document.querySelector('.main-content').classList.add('expanded');
}

function checkmode()
{
    const isDarkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;

    if (isDarkMode) {
        console.log("System is in Dark Mode");
    } else {
        console.log("System is in Light Mode");
    }
}