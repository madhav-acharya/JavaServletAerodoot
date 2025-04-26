<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 26/04/2025
  Time: 6:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
<body>
<div class="dashboard-container">
  <jsp:include page="../../../admin-sidebar.jsp" />
  <main class="main-content" id="main-content">
    <jsp:include page="../../../admin-header.jsp"/>
    <div class="content" id="content">
      <div class="analytics-controls">
        <div class="filter-group">
          <label>Date Range</label>
          <div class="date-range-picker">
            <input type="date" id="analytics-start-date" class="input date-input" value="2023-01-01">
            <span>to</span>
            <input type="date" id="analytics-end-date" class="input date-input" value="2023-12-31">
          </div>
        </div>
        <div class="filter-group">
          <label for="chart-type">Chart Type</label>
          <select id="chart-type" class="select">
            <option value="line">Line Chart</option>
            <option value="bar">Bar Chart</option>
            <option value="pie">Pie Chart</option>
          </select>
        </div>
        <button class="btn btn-outline" id="generate-report-btn">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
            <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
            <line x1="3" y1="9" x2="21" y2="9"></line>
            <line x1="9" y1="21" x2="9" y2="9"></line>
          </svg>
          Generate Report
        </button>
      </div>

      <div class="card chart-card">
        <div class="card-header">
          <h3 class="card-title">Booking Analytics</h3>
          <p class="card-description">Booking trends with date range filtering and zoom capabilities</p>
        </div>
        <div class="card-content">
          <div class="chart-container">
            <canvas id="booking-analytics-chart" height="400"></canvas>
          </div>
          <div class="chart-actions">
            <button class="btn btn-outline btn-sm" id="reset-zoom-btn">Reset Zoom</button>
            <button class="btn btn-outline btn-sm" id="download-csv-btn">Download CSV</button>
            <button class="btn btn-outline btn-sm" id="download-image-btn">Download Image</button>
          </div>
        </div>
      </div>

      <div class="card chart-card">
        <div class="card-header">
          <h3 class="card-title">Revenue by Route</h3>
          <p class="card-description">Top 10 routes by revenue</p>
        </div>
        <div class="card-content">
          <div class="chart-container">
            <canvas id="revenue-route-chart" height="350"></canvas>
          </div>
        </div>
      </div>

    </div>
  </main>
</div>
<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Booking Analytics Chart
    const bookingAnalyticsCtx = document.getElementById('booking-analytics-chart')?.getContext('2d');
    if (bookingAnalyticsCtx) {
      const bookingAnalyticsConfig = {
        type: 'line',
        data: {
          labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
          datasets: [
            {
              label: 'Economy Class',
              data: [1200, 1350, 1250, 1420, 1550, 1680, 1810, 1790, 1680, 1590, 1720, 1890],
              borderColor: 'rgb(59, 130, 246)',
              backgroundColor: 'rgba(59, 130, 246, 0.1)',
              tension: 0.3
            },
            {
              label: 'Business Class',
              data: [320, 350, 380, 410, 390, 450, 480, 460, 490, 510, 540, 580],
              borderColor: 'rgb(16, 185, 129)',
              backgroundColor: 'rgba(16, 185, 129, 0.1)',
              tension: 0.3
            },
            {
              label: 'First Class',
              data: [85, 90, 95, 110, 105, 120, 125, 130, 140, 135, 150, 160],
              borderColor: 'rgb(249, 115, 22)',
              backgroundColor: 'rgba(249, 115, 22, 0.1)',
              tension: 0.3
            }
          ]
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
              title: {
                display: true,
                text: 'Number of Bookings'
              }
            },
            x: {
              title: {
                display: true,
                text: 'Month'
              }
            }
          }
        }
      };

      const bookingAnalyticsChart = createZoomableChart(bookingAnalyticsCtx, bookingAnalyticsConfig);

      // Reset zoom button
      document.getElementById('reset-zoom-btn')?.addEventListener('click', function() {
        resetChartZoom(bookingAnalyticsChart);
      });

      // Download CSV button
      document.getElementById('download-csv-btn')?.addEventListener('click', function() {
        exportTableAsCSV('bookings-table', 'booking-analytics.csv');
      });

      // Download Image button
      document.getElementById('download-image-btn')?.addEventListener('click', function() {
        exportChartAsImage(bookingAnalyticsChart, 'booking-analytics.png');
      });

      // Date range filter
      const startDateInput = document.getElementById('analytics-start-date');
      const endDateInput = document.getElementById('analytics-end-date');

      function updateChartDateRange() {
        // In a real application, this would fetch data for the selected date range
        // For this demo, we'll just show an alert
        alert(`Date range updated: ${startDateInput.value} to ${endDateInput.value}`);
      }

      startDateInput.addEventListener('change', updateChartDateRange);
      endDateInput.addEventListener('change', updateChartDateRange);

      // Chart type selector
      const chartTypeSelect = document.getElementById('chart-type');

      chartTypeSelect.addEventListener('change', function() {
        const chartType = this.value;
        bookingAnalyticsChart.config.type = chartType;
        bookingAnalyticsChart.update();
      });

      // Generate report button
      document.getElementById('generate-report-btn').addEventListener('click', function() {
        alert('Generating report for date range: ' + startDateInput.value + ' to ' + endDateInput.value);
      });
    }

    // Revenue by Route Chart
    const revenueRouteCtx = document.getElementById('revenue-route-chart')?.getContext('2d');
    if (revenueRouteCtx) {
      const revenueRouteConfig = {
        type: 'bar',
        data: {
          labels: [
            'JFK-LHR',
            'LAX-SYD',
            'SIN-DXB',
            'LHR-CDG',
            'ORD-LAX',
            'ATL-MIA',
            'DXB-DEL',
            'SFO-HKG',
            'FRA-JFK',
            'AMS-CPT'
          ],
          datasets: [{
            label: 'Revenue (in thousands $)',
            data: [850, 780, 720, 650, 620, 580, 550, 520, 490, 460],
            backgroundColor: 'rgba(59, 130, 246, 0.7)'
          }]
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
              title: {
                display: true,
                text: 'Revenue (thousands $)'
              }
            },
            x: {
              title: {
                display: true,
                text: 'Route'
              }
            }
          }
        }
      };

      const revenueRouteChart = createZoomableChart(revenueRouteCtx, revenueRouteConfig);

      // Add reset zoom button
      const resetZoomBtn = document.createElement('button');
      resetZoomBtn.className = 'btn btn-outline btn-sm';
      resetZoomBtn.textContent = 'Reset Zoom';
      resetZoomBtn.addEventListener('click', function() {
        resetChartZoom(revenueRouteChart);
      });

      revenueRouteCtx.canvas.parentNode.parentNode.appendChild(resetZoomBtn);
    }

    // Handle window resize for chart responsiveness
    window.addEventListener('resize', function() {
      if (window.bookingAnalyticsChart) {
        window.bookingAnalyticsChart.resize();
      }
      if (window.revenueRouteChart) {
        window.revenueRouteChart.resize();
      }
    });
  });
</script>
</body>
</html>

