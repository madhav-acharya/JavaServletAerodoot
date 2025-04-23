<%--
  Created by IntelliJ IDEA.
  User: munal
  Date: 4/22/2025
  Time: 11:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../../header.jsp"/>
<div class="container-agent">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo">
            <h2>Airline</h2>
        </div>
        <ul class="nav-menu">
            <li class="nav-item">Dashboard</li>
            <li class="nav-item">Flights</li>
            <li class="nav-item">Bookings</li>
            <li class="nav-item">Passengers</li>
            <li class="nav-item">Reports</li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h1>Agent Dashboard</h1>
            <div class="search-box">
                <input type="text" placeholder="Search...">
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="stats-container">
            <div class="stat-card">
                <h3>Today's Flights</h3>
                <p>24</p>
            </div>
            <div class="stat-card">
                <h3>Bookings</h3>
                <p>156</p>
            </div>
            <div class="stat-card">
                <h3>Check-ins</h3>
                <p>89</p>
            </div>
            <div class="stat-card">
                <h3>Delays</h3>
                <p>3</p>
            </div>
        </div>

        <!-- Flights Table -->
        <div class="flights-table">
            <h2>Upcoming Flights</h2>
            <table>
                <thead>
                <tr>
                    <th>Flight No.</th>
                    <th>Route</th>
                    <th>Departure</th>
                    <th>Gate</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>AA101</td>
                    <td>JFK - LAX</td>
                    <td>08:00 AM</td>
                    <td>B12</td>
                    <td><span class="status on-time">On Time</span></td>
                    <td><button class="btn btn-primary">View</button></td>
                </tr>
                <tr>
                    <td>BA202</td>
                    <td>LHR - CDG</td>
                    <td>09:15 AM</td>
                    <td>A05</td>
                    <td><span class="status on-time">On Time</span></td>
                    <td><button class="btn btn-primary">View</button></td>
                </tr>
                <tr>
                    <td>DL303</td>
                    <td>ATL - SFO</td>
                    <td>10:30 AM</td>
                    <td>C08</td>
                    <td><span class="status delayed">Delayed</span></td>
                    <td><button class="btn btn-primary">View</button></td>
                </tr>
                <tr>
                    <td>UA404</td>
                    <td>ORD - MIA</td>
                    <td>11:45 AM</td>
                    <td>D03</td>
                    <td><span class="status on-time">On Time</span></td>
                    <td><button class="btn btn-primary">View</button></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<jsp:include page="../../tail.jsp"/>

