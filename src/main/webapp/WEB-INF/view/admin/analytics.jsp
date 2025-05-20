<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-zoom"></script>
<body>
<div class="dashboard-container">
  <jsp:include page="../../../admin-sidebar.jsp" />
  <main class="main-content" id="main-content">
    <jsp:include page="../../../admin-header.jsp"/>
    <jsp:include page="../../../includes/toast.jsp" />
    <div class="content" id="content">
      <div class="analytics-controls">
<%--        <div class="filter-group">--%>
<%--          <label>Date Range</label>--%>
<%--          <div class="date-range-picker">--%>
<%--            <input type="date" id="analytics-start-date" class="input date-input" value="2023-01-01">--%>
<%--            <span>to</span>--%>
<%--            <input type="date" id="analytics-end-date" class="input date-input" value="2023-12-31">--%>
<%--          </div>--%>
<%--        </div>--%>
        <div class="filter-group">
          <label for="chart-type">Chart Type</label>
          <select id="chart-type" class="select">
            <option value="line">Line Chart</option>
            <option value="bar">Bar Chart</option>
            <option value="pie">Pie Chart</option>
          </select>
        </div>
<%--        <button class="btn btn-outline" id="generate-report-btn">--%>
<%--          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">--%>
<%--            <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>--%>
<%--            <line x1="3" y1="9" x2="21" y2="9"></line>--%>
<%--            <line x1="9" y1="21" x2="9" y2="9"></line>--%>
<%--          </svg>--%>
<%--          Generate Report--%>
<%--        </button>--%>
      </div>

      <div class="card chart-card">
        <div class="card-header">
          <h3 class="card-title">Booking Analytics</h3>
          <p class="card-description">Booking trends with date range filtering and zoom capabilities</p>
        </div>
        <div class="card-content">
          <div class="chart-container">
            <canvas id="booking-analytics-chart" height="200"></canvas>
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
            <canvas id="revenue-route-chart" height="200"></canvas>
          </div>
        </div>
      </div>

    </div>
  </main>
</div>
<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    // Restore active tab from localStorage
    const savedTab = localStorage.getItem('activeTab');
    if (savedTab) {
      updateActiveMenuItem(savedTab);
    }

    // Booking Analysis Data (from JSP)
    const bookingAnalysisByClass = [
      <c:forEach var="b" items="${bookingAnalysisByClass}" varStatus="status">
      {
        classType: '${b.classType}',
        bookingCount: ${b.bookingCount},
        month: ${b.month}
      }<c:if test="${!status.last}">,</c:if>
      </c:forEach>
    ];

    const bookingAnalyticsCtx = document.getElementById('booking-analytics-chart')?.getContext('2d');
    if (bookingAnalyticsCtx) {
      const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

      const economyData = months.map((month, index) =>
              bookingAnalysisByClass
                      .filter(b => b.classType === 'ECONOMY' && b.month === (index + 1))
                      .reduce((total, b) => total + b.bookingCount, 0)
      );

      const businessData = months.map((month, index) =>
              bookingAnalysisByClass
                      .filter(b => b.classType === 'BUSINESS' && b.month === (index + 1))
                      .reduce((total, b) => total + b.bookingCount, 0)
      );

      const bookingAnalyticsChart = createZoomableChart(bookingAnalyticsCtx, {
        type: 'line',
        data: {
          labels: months,
          datasets: [
            {
              label: 'Economy Class',
              data: economyData,
              borderColor: 'rgb(59, 130, 246)',
              backgroundColor: 'rgba(59, 130, 246, 0.1)',
              tension: 0.3
            },
            {
              label: 'Business Class',
              data: businessData,
              borderColor: 'rgb(16, 185, 129)',
              backgroundColor: 'rgba(16, 185, 129, 0.1)',
              tension: 0.3
            },
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
      });

      window.bookingAnalyticsChart = bookingAnalyticsChart;

      // Extra controls
      document.getElementById('reset-zoom-btn')?.addEventListener('click', () => {
        resetChartZoom(bookingAnalyticsChart);
      });

      document.getElementById('download-csv-btn')?.addEventListener('click', () => {
        exportTableAsCSV('bookings-table', 'booking-analytics.csv');
      });

      document.getElementById('download-image-btn')?.addEventListener('click', () => {
        exportChartAsImage(bookingAnalyticsChart, 'booking-analytics.png');
      });

      const chartTypeSelect = document.getElementById('chart-type');
      if (chartTypeSelect) {
        chartTypeSelect.addEventListener('change', function () {
          bookingAnalyticsChart.config.type = this.value;
          bookingAnalyticsChart.update();
        });
      }
    }

    // Revenue By Route Data (from JSP)
    const revenueRouteLabels = [
      <c:forEach var="r" items="${revenueByRoute}" varStatus="status">
      '${r.routeName}'<c:if test="${!status.last}">,</c:if>
      </c:forEach>
    ];

    const revenueRouteData = [
      <c:forEach var="r" items="${revenueByRoute}" varStatus="status">
      ${r.totalRevenue}<c:if test="${!status.last}">,</c:if>
      </c:forEach>
    ];

    const revenueRouteCtx = document.getElementById('revenue-route-chart')?.getContext('2d');
    if (revenueRouteCtx) {
      const revenueRouteChart = createZoomableChart(revenueRouteCtx, {
        type: 'bar',
        data: {
          labels: revenueRouteLabels,
          datasets: [{
            label: 'Revenue RS.',
            data: revenueRouteData,
            backgroundColor: 'rgba(59, 130, 246, 0.7)'
          }]
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
              title: {
                display: true,
                text: 'Revenue RS.'
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
      });

      window.revenueRouteChart = revenueRouteChart;

      // Optional: Add reset zoom button dynamically
      const resetZoomBtn = document.createElement('button');
      resetZoomBtn.className = 'btn btn-outline btn-sm mt-2';
      resetZoomBtn.textContent = 'Reset Zoom';
      resetZoomBtn.addEventListener('click', () => {
        resetChartZoom(revenueRouteChart);
      });
      revenueRouteCtx.canvas.parentNode.parentNode.appendChild(resetZoomBtn);
    }

    // Handle window resize for responsiveness
    window.addEventListener('resize', function () {
      if (window.bookingAnalyticsChart) window.bookingAnalyticsChart.resize();
      if (window.revenueRouteChart) window.revenueRouteChart.resize();
    });
  });
</script>
</body>
</html>

