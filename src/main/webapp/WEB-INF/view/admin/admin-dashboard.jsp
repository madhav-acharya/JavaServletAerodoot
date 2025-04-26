<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 26/04/2025
  Time: 6:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-zoom"></script>
<body>
<div class="dashboard-container">
  <jsp:include page="../../../admin-sidebar.jsp" />
  <main class="main-content" id="main-content">
    <jsp:include page="../../../admin-header.jsp"/>
    <div class="content" id="content">
      <div class="stats-grid">
        <div class="card stat-card">
          <div class="card-header">
            <h3 class="card-title">Total Flights</h3>
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
              <path d="M17.8 19.2 16 11l3.5-3.5C21 6 21.5 4 21 3c-1-.5-3 0-4.5 1.5L13 8 4.8 6.2c-.5-.1-.9.1-1.1.5l-.3.5c-.2.5-.1 1 .3 1.3L9 12l-2 3H4l-1 1 3 2 2 3 1-1v-3l3-2 3.5 5.3c.3.4.8.5 1.3.3l.5-.2c.4-.3.6-.7.5-1.2z"></path>
            </svg>
          </div>
          <div class="card-content">
            <div class="stat-value">1,284</div>
            <p class="stat-change positive">+12.5% from last month</p>
          </div>
        </div>
        <div class="card stat-card">
          <div class="card-header">
            <h3 class="card-title">Active Bookings</h3>
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
              <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
              <line x1="16" y1="2" x2="16" y2="6"></line>
              <line x1="8" y1="2" x2="8" y2="6"></line>
              <line x1="3" y1="10" x2="21" y2="10"></line>
            </svg>
          </div>
          <div class="card-content">
            <div class="stat-value">3,567</div>
            <p class="stat-change positive">+8.2% from last month</p>
          </div>
        </div>
        <div class="card stat-card">
          <div class="card-header">
            <h3 class="card-title">Total Revenue</h3>
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
              <rect x="3" y="3" width="18" height="18" rx="2"></rect>
              <path d="M3 9h18"></path>
              <path d="M9 21V9"></path>
            </svg>
          </div>
          <div class="card-content">
            <div class="stat-value">$428,651</div>
            <p class="stat-change positive">+18.3% from last month</p>
          </div>
        </div>
        <div class="card stat-card">
          <div class="card-header">
            <h3 class="card-title">Total Passengers</h3>
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
              <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
              <circle cx="9" cy="7" r="4"></circle>
              <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
              <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
            </svg>
          </div>
          <div class="card-content">
            <div class="stat-value">24,836</div>
            <p class="stat-change positive">+5.7% from last month</p>
          </div>
        </div>
      </div>

      <div class="charts-grid">
        <div class="card chart-card">
          <div class="card-header">
            <h3 class="card-title">Booking Trends</h3>
            <p class="card-description">Daily booking counts for the last 30 days</p>
          </div>
          <div class="card-content">
            <div class="chart-container">
              <canvas id="booking-trends-chart" height="300"></canvas>
            </div>
          </div>
        </div>
        <div class="card chart-card">
          <div class="card-header">
            <h3 class="card-title">Flight Distribution</h3>
            <p class="card-description">Flights by destination region</p>
          </div>
          <div class="card-content">
            <div class="chart-container">
              <canvas id="flight-distribution-chart" height="300"></canvas>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
</div>
<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    console.log('Page loaded');
    // Booking Trends Chart
    const bookingTrendsCtx = document.getElementById('booking-trends-chart')?.getContext('2d');
    if (bookingTrendsCtx) {
      const bookingTrendsConfig = {
        type: 'line',
        data: {
          labels: ['Apr 1', 'Apr 5', 'Apr 10', 'Apr 15', 'Apr 20', 'Apr 25', 'Apr 30'],
          datasets: [{
            label: 'Bookings',
            data: [65, 78, 52, 91, 83, 106, 123],
            borderColor: 'rgb(59, 130, 246)',
            backgroundColor: 'rgba(59, 130, 246, 0.1)',
            tension: 0.3,
            fill: true
          }]
        },
        options: {
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      };

      const bookingTrendsChart = createZoomableChart(bookingTrendsCtx, bookingTrendsConfig);

      // Add reset zoom button
      const resetZoomBtn = document.createElement('button');
      resetZoomBtn.className = 'btn btn-outline btn-sm';
      resetZoomBtn.textContent = 'Reset Zoom';
      resetZoomBtn.addEventListener('click', function() {
        resetChartZoom(bookingTrendsChart);
      });

      bookingTrendsCtx.canvas.parentNode.parentNode.appendChild(resetZoomBtn);
    }

    // Flight Distribution Chart
    const flightDistributionCtx = document.getElementById('flight-distribution-chart')?.getContext('2d');
    if (flightDistributionCtx) {
      const flightDistributionConfig = {
        type: 'bar',
        data: {
          labels: ['North America', 'Europe', 'Asia', 'Australia', 'Africa', 'South America'],
          datasets: [{
            label: 'Flights',
            data: [125, 95, 86, 45, 32, 68],
            backgroundColor: [
              'rgba(59, 130, 246, 0.7)',
              'rgba(16, 185, 129, 0.7)',
              'rgba(249, 115, 22, 0.7)',
              'rgba(139, 92, 246, 0.7)',
              'rgba(239, 68, 68, 0.7)',
              'rgba(234, 179, 8, 0.7)'
            ]
          }]
        },
        options: {}
      };

      const flightDistributionChart = createZoomableChart(flightDistributionCtx, flightDistributionConfig);

      // Add reset zoom button
      const resetZoomBtn = document.createElement('button');
      resetZoomBtn.className = 'btn btn-outline btn-sm';
      resetZoomBtn.textContent = 'Reset Zoom';
      resetZoomBtn.addEventListener('click', function() {
        resetChartZoom(flightDistributionChart);
      });

      flightDistributionCtx.canvas.parentNode.parentNode.appendChild(resetZoomBtn);
    }

    // Handle window resize for chart responsiveness
    window.addEventListener('resize', function() {
      if (window.bookingTrendsChart) {
        window.bookingTrendsChart.resize();
      }
      if (window.flightDistributionChart) {
        window.flightDistributionChart.resize();
      }
    });
  });
</script>
</body>
</html>
