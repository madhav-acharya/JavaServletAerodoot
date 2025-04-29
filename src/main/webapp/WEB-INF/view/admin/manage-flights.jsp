<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="com.example.aerodoot.model.Flight" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 26/04/2025
  Time: 6:51 PM
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
      <div class="tabs">
        <div class="tabs-list">
          <button class="tab-button active">Flights</button>
        </div>

        <div class="tab-actions">
          <button class="btn btn-primary" id="add-flight-btn">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
              <line x1="12" y1="5" x2="12" y2="19"></line>
              <line x1="5" y1="12" x2="19" y2="12"></line>
            </svg>
            Add Flight
          </button>
        </div>
      </div>

      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Flight Management</h3>
          <p class="card-description">View, edit, and manage all flights</p>
        </div>
        <div class="card-content">
          <div class="filters">
            <div class="filter-group">
              <label for="search-flights">Search Flights</label>
              <input type="text" id="search-flights" class="input" placeholder="Search by flight number, origin, destination...">
            </div>
            <div class="filter-group">
              <label for="status-filter">Status</label>
              <select id="status-filter" class="select">
                <option value="all">All Statuses</option>
                <option value="scheduled">Scheduled</option>
                <option value="ontime">On Time</option>
                <option value="delayed">Delayed</option>
                <option value="inair">In Air</option>
                <option value="landed">Landed</option>
                <option value="cancelled">Cancelled</option>
              </select>
            </div>
            <div class="filter-group">
              <label>Date Range</label>
              <div class="date-range-picker">
                <input type="date" id="flight-start-date" class="input date-input" value="2023-05-01">
                <span>to</span>
                <input type="date" id="flight-end-date" class="input date-input" value="2023-05-15">
              </div>
            </div>
          </div>

          <div class="table-container">
            <table class="data-table" id="flights-table">
              <thead>
              <tr>
                <th>Flight Number</th>
                <th>Departure Location</th>
                <th>Arrival Location</th>
                <th>Departure Time</th>
                <th>Arrival Time</th>
                <th>Status</th>
                <th>Available Seats (Economy)</th>
                <th>Available Seats (Business)</th>
                <th>Economy Price</th>
                <th>Business Price</th>
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
                  <%--              <c:forEach var="flight" items="${flights}">--%>
                  <tr>
                    <td>AB123</td>
                    <td>New York</td>
                    <td>London</td>
                    <td>2025-05-01 10:00</td>
                    <td>2025-05-01 20:00</td>
                    <td>SCHEDULED</td>
                    <td>150</td>
                    <td>50</td>
                    <td>500.00</td>
                    <td>1200.00</td>
                    <td>
                      <div class="actions">
                        <button class="action-btn edit-btn" title="Edit" data-id="AB123">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                          </svg>
                        </button>
                        <button class="action-btn delete-btn" title="Delete" data-id="AB123">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                            <path d="M3 6h18"></path>
                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>
                            <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                          </svg>
                        </button>
                      </div>
                    </td>
                  </tr>

                  <!-- Flight 2 -->
                  <tr>
                    <td>CD456</td>
                    <td>Paris</td>
                    <td>Tokyo</td>
                    <td>2025-05-02 14:00</td>
                    <td>2025-05-02 22:00</td>
                    <td>DELAYED</td>
                    <td>100</td>
                    <td>30</td>
                    <td>550.00</td>
                    <td>1300.00</td>
                    <td>
                      <div class="actions">
                        <button class="action-btn edit-btn" title="Edit" data-id="CD456">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                          </svg>
                        </button>
                        <button class="action-btn delete-btn" title="Delete" data-id="CD456">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                            <path d="M3 6h18"></path>
                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>
                            <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                          </svg>
                        </button>
                      </div>
                    </td>
                  </tr>
                  <%--              </c:forEach>--%>
              </tbody>
            </table>
          </div>

          <div class="pagination">
            <button class="pagination-btn" id="first-page-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                <polyline points="11 17 6 12 11 7"></polyline>
                <polyline points="18 17 13 12 18 7"></polyline>
              </svg>
            </button>
            <button class="pagination-btn" id="prev-page-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                <polyline points="15 18 9 12 15 6"></polyline>
              </svg>
            </button>
            <div class="pagination-info">
              <input type="text" class="input pagination-input" id="current-page" value="1">
              <span>of <span id="total-pages">1</span></span>
            </div>
            <button class="pagination-btn" id="next-page-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                <polyline points="9 18 15 12 9 6"></polyline>
              </svg>
            </button>
            <button class="pagination-btn" id="last-page-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                <polyline points="13 17 18 12 13 7"></polyline>
                <polyline points="6 17 11 12 6 7"></polyline>
              </svg>
            </button>
          </div>
        </div>
      </div>

      <!-- Flight Form Modal -->
      <div class="modal" id="flight-form-modal">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="flight-modal-title">Add New Flight</h3>
            <button class="modal-close" id="close-flight-modal">×</button>
          </div>
          <div class="modal-body">
            <form id="flight-form">
              <input type="hidden" id="flight-id">
              <div class="form-grid">
                <div class="form-group">
                  <label for="flight-number">Flight Number</label>
                  <input type="text" id="flight-number" class="input" placeholder="e.g. AA1234" required>
                </div>
                <div class="form-group">
                  <label for="airline">Airline</label>
                  <select id="airline" class="select" required>
                    <option value="">Select Airline</option>
                    <!-- Airlines will be populated by JavaScript -->
                  </select>
                </div>
                <div class="form-group">
                  <label for="aircraft">Aircraft</label>
                  <select id="aircraft" class="select" required>
                    <option value="">Select Aircraft</option>
                    <!-- Aircraft will be populated by JavaScript -->
                  </select>
                </div>
                <div class="form-group">
                  <label for="origin">Origin</label>
                  <select id="origin" class="select" required>
                    <option value="">Select Origin Airport</option>
                    <option value="jfk">New York (JFK)</option>
                    <option value="lhr">London (LHR)</option>
                    <option value="cdg">Paris (CDG)</option>
                    <option value="dxb">Dubai (DXB)</option>
                    <option value="sin">Singapore (SIN)</option>
                    <option value="lax">Los Angeles (LAX)</option>
                    <option value="ord">Chicago (ORD)</option>
                    <option value="atl">Atlanta (ATL)</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="destination">Destination</label>
                  <select id="destination" class="select" required>
                    <option value="">Select Destination Airport</option>
                    <option value="jfk">New York (JFK)</option>
                    <option value="lhr">London (LHR)</option>
                    <option value="cdg">Paris (CDG)</option>
                    <option value="dxb">Dubai (DXB)</option>
                    <option value="sin">Singapore (SIN)</option>
                    <option value="lax">Los Angeles (LAX)</option>
                    <option value="ord">Chicago (ORD)</option>
                    <option value="atl">Atlanta (ATL)</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="departure-date">Departure Date</label>
                  <input type="date" id="departure-date" class="input" required>
                </div>
                <div class="form-group">
                  <label for="departure-time">Departure Time</label>
                  <input type="time" id="departure-time" class="input" required>
                </div>
                <div class="form-group">
                  <label for="arrival-date">Arrival Date</label>
                  <input type="date" id="arrival-date" class="input" required>
                </div>
                <div class="form-group">
                  <label for="arrival-time">Arrival Time</label>
                  <input type="time" id="arrival-time" class="input" required>
                </div>
                <div class="form-group">
                  <label for="status">Status</label>
                  <select id="status" class="select" required>
                    <option value="scheduled">Scheduled</option>
                    <option value="ontime">On Time</option>
                    <option value="delayed">Delayed</option>
                    <option value="inair">In Air</option>
                    <option value="landed">Landed</option>
                    <option value="cancelled">Cancelled</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="capacity">Capacity</label>
                  <input type="number" id="capacity" class="input" placeholder="Total seats" value="200" required>
                </div>
              </div>
              <div class="form-group">
                <label for="notes">Notes</label>
                <textarea id="notes" class="textarea" placeholder="Additional information about this flight" rows="3"></textarea>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button class="btn btn-outline" id="cancel-flight-btn">Cancel</button>
            <button class="btn btn-primary" id="save-flight-btn">Add Flight</button>
          </div>
        </div>
      </div>
    </div>
  </main>
</div>
<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const savedTab = localStorage.getItem('activeTab');
    if (savedTab) {
      updateActiveMenuItem(savedTab);
    }
    // Setup search functionality
    searchTable('flights-table', 'search-flights');

    // Setup status filter
    setupTableFilter('flights-table', 'status-filter', 6);

    // Setup date range filter
    setupDateRangeFilter('flights-table', 'flight-start-date', 'flight-end-date', 4);

    // Flight form modal
    const addFlightBtn = document.getElementById('add-flight-btn');
    const closeFlightModalBtn = document.getElementById('close-flight-modal');
    const cancelFlightBtn = document.getElementById('cancel-flight-btn');
    const saveFlightBtn = document.getElementById('save-flight-btn');
    const flightForm = document.getElementById('flight-form');
    const flightModalTitle = document.getElementById('flight-modal-title');
    const editFlightbtn = document.querySelectorAll('.edit-btn');

    addFlightBtn.addEventListener('click', () => {
      document.getElementById('flight-id').value = '';
      flightModalTitle.textContent = 'Add New Flight';
      saveFlightBtn.textContent = 'Add Flight';
      openModal('flight-form-modal');
    });

    closeFlightModalBtn.addEventListener('click', () => closeModal('flight-form-modal'));
    cancelFlightBtn.addEventListener('click', () => closeModal('flight-form-modal'));

    // Function to edit flight
    function editFlight() {
        // Update modal title and button text
        flightModalTitle.textContent = 'Edit Flight';
        saveFlightBtn.textContent = 'Update Flight';

        openModal('flight-form-modal');
    }
    editFlightbtn.forEach(editBtn =>{
      editBtn.addEventListener('click', ()=>{
        editFlight();
      });
    })
  });
</script>
</body>
</html>

