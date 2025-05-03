<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 26/04/2025
  Time: 6:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <th>Flight Date</th>
                <th>Departure Time</th>
                <th>Arrival Time</th>
                <th>Duration(in minutes)</th>
                <th>Status</th>
                <th>Available Seats (Economy)</th>
                <th>Available Seats (Business)</th>
                <th>Economy Price</th>
                <th>Business Price</th>
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="flight" items="${flights}">
                <tr>
                  <td>${flight.flightNumber}</td>
                  <td>${flight.departureLocation}</td>
                  <td>${flight.arrivalLocation}</td>
                  <td>${flight.flightDate}</td>
                  <td>${flight.departureTime}</td>
                  <td>${flight.arrivalTime}</td>
                  <td>${flight.duration}</td>
                  <td>${flight.status}</td>
                  <td>${flight.availableSeatsEconomy}</td>
                  <td>${flight.availableSeatsBusiness}</td>
                  <td>${flight.economyPrice}</td>
                  <td>${flight.businessPrice}</td>

                  <td>
                    <div class="actions">
                      <button class="action-btn edit-btn" title="Edit" data-id="${flight.flightId}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                          <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                          <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                        </svg>
                      </button>
                      <button class="action-btn delete-btn" title="Delete" data-id="${flight.flightId}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                          <path d="M3 6h18"></path>
                          <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>
                          <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                        </svg>
                      </button>
                    </div>
                  </td>
                </tr>
              </c:forEach>
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
              <input type="hidden" id="flight-id" name="flightId">
              <div class="form-grid">

                <div class="form-group">
                  <label for="flight-number">Flight Number</label>
                  <input type="text" id="flight-number" name="flightNumber" class="input" placeholder="e.g. RA123" required>
                </div>

                <div class="form-group">
                  <label for="origin">Origin</label>
                  <select id="origin" name="origin" class="select" required>
                    <option value="">Select Origin Airport</option>
                    <option value="KTM">Kathmandu (KTM)</option>
                    <option value="PKR">Pokhara (PKR)</option>
                    <option value="BHR">Bharatpur (BHR)</option>
                    <option value="BIR">Biratnagar (BIR)</option>
                    <option value="BWA">Bhairahawa (BWA)</option>
                    <option value="JKR">Janakpur (JKR)</option>
                    <option value="TMI">Tumlingtar (TMI)</option>
                    <option value="KEP">Nepalgunj (KEP)</option>
                  </select>
                </div>

                <div class="form-group">
                  <label for="destination">Destination</label>
                  <select id="destination" name="destination" class="select" required>
                    <option value="">Select Destination Airport</option>
                    <option value="KTM">Kathmandu (KTM)</option>
                    <option value="PKR">Pokhara (PKR)</option>
                    <option value="BHR">Bharatpur (BHR)</option>
                    <option value="BIR">Biratnagar (BIR)</option>
                    <option value="BWA">Bhairahawa (BWA)</option>
                    <option value="JKR">Janakpur (JKR)</option>
                    <option value="TMI">Tumlingtar (TMI)</option>
                    <option value="KEP">Nepalgunj (KEP)</option>
                  </select>
                </div>

                <div class="form-group">
                  <label for="flight-date">Flight Date</label>
                  <input type="date" id="flight-date" name="flightDate" class="input" required>
                </div>

                <div class="form-group">
                  <label for="departure-time">Departure Time</label>
                  <input type="time" id="departure-time" name="departureTime" class="input" required>
                </div>

                <div class="form-group">
                  <label for="arrival-time">Arrival Time</label>
                  <input type="time" id="arrival-time" name="arrivalTime" class="input" required>
                </div>

                <div class="form-group">
                  <label for="status">Status</label>
                  <select id="status" name="status" class="select" required>
                    <option value="scheduled">Scheduled</option>
                    <option value="ontime">On Time</option>
                    <option value="delayed">Delayed</option>
                    <option value="inair">In Air</option>
                    <option value="landed">Landed</option>
                    <option value="cancelled">Cancelled</option>
                  </select>
                </div>

                <div class="form-group">
                  <label for="business-capacity">Seat Capacity (Business)</label>
                  <input type="number" id="business-capacity" name="businessCapacity" class="input" placeholder="Total business seats" required>
                </div>

                <div class="form-group">
                  <label for="economy-capacity">Seat Capacity (Economy)</label>
                  <input type="number" id="economy-capacity" name="economyCapacity" class="input" placeholder="Total economy seats" required>
                </div>

                <div class="form-group">
                  <label for="business-price">Ticket Price (Business)</label>
                  <input type="number" id="business-price" name="businessPrice" class="input" placeholder="Price in NPR" required>
                </div>

                <div class="form-group">
                  <label for="economy-price">Ticket Price (Economy)</label>
                  <input type="number" id="economy-price" name="economyPrice" class="input" placeholder="Price in NPR" required>
                </div>

              </div>

              <div class="form-group">
                <label for="notes">Notes</label>
                <textarea id="notes" name="notes" class="textarea" placeholder="Additional information about this flight" rows="3"></textarea>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline" id="cancel-flight-btn">Cancel</button>
            <button type="submit" class="btn btn-primary" id="save-flight-btn">Save Flight</button>
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

