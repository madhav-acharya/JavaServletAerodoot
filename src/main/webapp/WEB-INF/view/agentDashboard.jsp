<%--
  Created by IntelliJ IDEA.
  User: munal
  Date: 4/22/2025
  Time: 11:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../../header.jsp"/>
<jsp:include page="../../includes/toast.jsp" />
<div class="dashboard-container">
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <h2 class="logo">AeroDoot</h2>
            <button id="sidebar-toggle" class="sidebar-toggle">☰</button>
        </div>

        <div class="agent-profile">
            <div class="agent-avatar">
                <div class="avatar-placeholder">
                    <c:out value="${agent.firstName.charAt(0)}${agent.lastName.charAt(0)}"/>
                </div>
            </div>
            <div class="agent-info">
                <h3><c:out value="${agent.firstName} ${agent.lastName}"/></h3>
                <p><c:out value="${agent.position}"/></p>
                <p class="agent-license">License: <c:out value="${agent.licenseNumber}"/></p>
            </div>
        </div>

        <nav class="sidebar-nav">
            <ul>
                <li class="active">
                    <a href="agentDashboard.jsp" class="nav-link">
                        <i class="fas fa-chart-line"></i>
                        <span>Analytics</span>
                    </a>
                </li>
                <li>
                    <a href="agentBooking.jsp" class="nav-link">
                        <i class="fas fa-ticket"></i>
                        <span>Booking</span>
                    </a>
                </li>
            </ul>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <div class="content-header">
            <div class="header-search">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search...">
            </div>
            <div class="header-actions">
                <div class="notifications">
                    <i class="fas fa-bell"></i>
                    <span class="notification-badge">3</span>
                </div>
                <div class="date-time" id="current-date"></div>
            </div>
        </div>

        <div class="tab-content">
            <!-- Analytics Dashboard -->
            <div class="analytics-cards">
                <div class="card">
                    <div class="card-icon booking-icon">
                        <i class="fas fa-ticket"></i>
                    </div>
                    <div class="card-content">
                        <h3>Total Bookings</h3>
                        <div class="stat-value">${totalBookings}</div>
                        <div class="stat-change positive">
                            <i class="fas fa-arrow-up"></i>
                            <span>12.5% vs last month</span>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-icon revenue-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <div class="card-content">
                        <h3>Revenue</h3>
                        <div class="stat-value">$${totalRevenue}</div>
                        <div class="stat-change positive">
                            <i class="fas fa-arrow-up"></i>
                            <span>8.3% vs last month</span>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-icon passenger-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="card-content">
                        <h3>Total Passengers</h3>
                        <div class="stat-value">${totalPassengers}</div>
                        <div class="stat-change positive">
                            <i class="fas fa-arrow-up"></i>
                            <span>5.2% vs last month</span>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-icon commission-icon">
                        <i class="fas fa-percentage"></i>
                    </div>
                    <div class="card-content">
                        <h3>Commission</h3>
                        <div class="stat-value">$${totalCommission}</div>
                        <div class="stat-change positive">
                            <i class="fas fa-arrow-up"></i>
                            <span>10.1% vs last month</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="analytics-charts">
                <div class="chart-container">
                    <h3>Booking Trends</h3>
                    <canvas id="bookingTrendsChart"></canvas>
                </div>
                <div class="chart-container">
                    <h3>Revenue by Class</h3>
                    <canvas id="revenueByClassChart"></canvas>
                </div>
            </div>

            <div class="analytics-details">
                <div class="recent-activity">
                    <h3>Recent Activity</h3>
                    <div class="activity-list">
                        <c:forEach items="${recentActivities}" var="activity">
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-plane"></i>
                                </div>
                                <div class="activity-details">
                                    <div class="activity-title">${activity.title}</div>
                                    <div class="activity-info">${activity.description}</div>
                                    <div class="activity-time">${activity.timestamp}</div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="top-destinations">
                    <h3>Top Destinations</h3>
                    <div class="destination-items">
                        <c:forEach items="${topDestinations}" var="destination" varStatus="status">
                            <div class="destination-item">
                                <div class="destination-rank">${status.index + 1}</div>
                                <div class="destination-details">
                                    <div class="destination-name">${destination.name}</div>
                                    <div class="destination-stats">
                                        <span>${destination.bookings} bookings</span>
                                        <span>•</span>
                                        <span>${destination.revenue}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<script src="${pageContext.request.contextPath}/assets/js/agent.js"></script>
<jsp:include page="../../tail.jsp" />