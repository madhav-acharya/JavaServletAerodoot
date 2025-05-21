<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 21/05/2025
  Time: 3:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
  <title>Agent Analytics Dashboard</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/agent.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<jsp:include page="../../../includes/toast.jsp" />
<div class="app-container">
  <!-- Sidebar -->
  <div class="sidebar">
    <div class="sidebar-header">
      <h2 class="sidebar-title">AeroDoot Agent</h2>
    </div>
    <ul class="sidebar-menu">
      <li class="sidebar-menu-item">
        <a href="${pageContext.request.contextPath}/agent/dashboard"  class="active">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z" />
            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z" />
          </svg>
          Dashboard
        </a>
      </li>
      <li class="sidebar-menu-item">
        <a href="${pageContext.request.contextPath}/agent/booking" >
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
            <path d="M4 3a2 2 0 100 4h12a2 2 0 100-4H4z" />
            <path fill-rule="evenodd" d="M3 8h14v7a2 2 0 01-2 2H5a2 2 0 01-2-2V8zm5 3a1 1 0 011-1h2a1 1 0 110 2H9a1 1 0 01-1-1z" clip-rule="evenodd" />
          </svg>
          Bookings
        </a>
      </li>
      <li class="sidebar-menu-item">
        <a href="${pageContext.request.contextPath}/home" >
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
            <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
            <polyline points="16 17 21 12 16 7"></polyline>
            <line x1="21" y1="12" x2="9" y2="12"></line>
          </svg>
          Exit Agent
        </a>
      </li>
    </ul>
  </div>

  <!-- Main Content -->
  <div class="agent-dashboard-container">
    <h1 class="page-title">Analytics Dashboard</h1>

    <!-- Stats Cards -->
    <div class="stats-container">
      <div class="stat-card">
        <h3 class="stat-card-title">Active Bookings</h3>
        <div class="stat-card-value">
          <div class="stat-card-number">${activeBookings}</div>
          <span class="stat-card-change positive">+12%</span>
        </div>
      </div>

      <div class="stat-card">
        <h3 class="stat-card-title">Total Revenue</h3>
        <div class="stat-card-value">
          <div class="stat-card-number">Rs.${totalRevenue}</div>
          <span class="stat-card-change positive">+8%</span>
        </div>
      </div>

      <div class="stat-card">
        <h3 class="stat-card-title">Active Flights</h3>
        <div class="stat-card-value">
          <div class="stat-card-number">${totalFlights}</div>
          <span class="stat-card-change negative">-3%</span>
        </div>
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
          <button class="btn btn-outline btn-sm" id="download-image-btn">Download Image</button>
        </div>
      </div>
    </div>

    <!-- Recent Bookings Table -->
    <div class="table-card">
      <div class="table-header">
        <h3 class="table-title">Recent Bookings</h3>
      </div>
      <div class="table-container">
        <table>
          <thead>
          <tr>
            <th>Booking ID</th>
            <th>Booking Date</th>
            <th>Class Type</th>
            <th>Seats Booked</th>
            <th>Booking Status</th>
            <th>Total Price</th>
            <th>Flight ID</th>
            <th>Passenger ID</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="booking" items="${bookings}">
            <tr>
              <td>${booking.bookingId}</td>
              <td>${booking.bookingDate}</td>
              <td>${booking.classType}</td>
              <td>${booking.seatsBooked}</td>
              <td>
                <span class="status-badge
                    ${booking.bookingStatus == 'Confirmed' ? 'status-confirmed' : 'status-pending'}">
                    ${booking.bookingStatus}
                </span>
              </td>
              <td>
                  ${'Rs.'}${booking.totalPrice}
              </td>
              <td>${booking.flightId}</td>
              <td>${booking.passengerId}</td>
            </tr>
          </c:forEach>
          </tbody>

        </table>
      </div>
    </div>
  </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/agent.js"></script>
<script>
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

  console.log("bookkkkk", bookingAnalysisByClass)
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

</script>

</body>
</html>
