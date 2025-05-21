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
    </ul>
  </div>

  <!-- Main Content -->
  <div class="agent-dashboard-container">
    <h1 class="page-title">Analytics Dashboard</h1>

    <!-- Stats Cards -->
    <div class="stats-container">
      <div class="stat-card">
        <h3 class="stat-card-title">Total Bookings</h3>
        <div class="stat-card-value">
          <div class="stat-card-number">128</div>
          <span class="stat-card-change positive">+12%</span>
        </div>
      </div>

      <div class="stat-card">
        <h3 class="stat-card-title">Revenue</h3>
        <div class="stat-card-value">
          <div class="stat-card-number">$24,300</div>
          <span class="stat-card-change positive">+8%</span>
        </div>
      </div>

      <div class="stat-card">
        <h3 class="stat-card-title">Active Flights</h3>
        <div class="stat-card-value">
          <div class="stat-card-number">42</div>
          <span class="stat-card-change negative">-3%</span>
        </div>
      </div>
    </div>

    <!-- Charts -->
    <div class="charts-container">
      <div class="chart-card">
        <h3 class="chart-title">Bookings by Class</h3>
        <div class="chart-container">
          <canvas id="bookingsByClassChart"></canvas>
        </div>
      </div>

      <div class="chart-card">
        <h3 class="chart-title">Monthly Revenue</h3>
        <div class="chart-container">
          <canvas id="revenueChart"></canvas>
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
            <th>Passenger</th>
            <th>Flight</th>
            <th>Class</th>
            <th>Status</th>
            <th>Amount</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>B-1001</td>
            <td>John Doe</td>
            <td>KTM-DEL-001</td>
            <td>Business</td>
            <td>
              <span class="status-badge status-confirmed">Confirmed</span>
            </td>
            <td>$850</td>
          </tr>
          <tr>
            <td>B-1002</td>
            <td>Jane Smith</td>
            <td>KTM-BOM-002</td>
            <td>Economy</td>
            <td>
              <span class="status-badge status-pending">Pending</span>
            </td>
            <td>$320</td>
          </tr>
          <tr>
            <td>B-1003</td>
            <td>Mike Johnson</td>
            <td>KTM-BKK-003</td>
            <td>Economy</td>
            <td>
              <span class="status-badge status-confirmed">Confirmed</span>
            </td>
            <td>$420</td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<script>
  // Bookings by Class Chart
  const bookingsByClassCtx = document.getElementById('bookingsByClassChart').getContext('2d');
  const bookingsByClassChart = new Chart(bookingsByClassCtx, {
    type: 'doughnut',
    data: {
      labels: ['Economy', 'Business'],
      datasets: [{
        data: [65, 35],
        backgroundColor: ['#3B82F6', '#10B981'],
        hoverOffset: 4
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false
    }
  });

  // Revenue Chart
  const revenueCtx = document.getElementById('revenueChart').getContext('2d');
  const revenueChart = new Chart(revenueCtx, {
    type: 'line',
    data: {
      labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
      datasets: [{
        label: 'Revenue',
        data: [12000, 19000, 15000, 21000, 18000, 24000],
        fill: false,
        borderColor: '#3B82F6',
        tension: 0.1
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>
<script src="${pageContext.request.contextPath}/assets/js/agent.js"></script>
</body>
</html>
