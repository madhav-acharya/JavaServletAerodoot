<%--
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
                <th>Flight No.</th>
                <th>Airline</th>
                <th>Origin</th>
                <th>Destination</th>
                <th>Departure</th>
                <th>Arrival</th>
                <th>Status</th>
                <th>Aircraft</th>
                <th>Capacity</th>
                <th>Booked</th>
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
              <!-- Flight data will be populated by JavaScript -->
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
    // Populate flights table
    populateFlightsTable();

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

    addFlightBtn.addEventListener('click', () => {
      // Reset form and prepare for adding a new flight
      flightForm.reset();
      document.getElementById('flight-id').value = '';
      flightModalTitle.textContent = 'Add New Flight';
      saveFlightBtn.textContent = 'Add Flight';

      // Populate airline and aircraft dropdowns
      populateAirlineDropdown();
      populateAircraftDropdown();

      openModal('flight-form-modal');
    });

    closeFlightModalBtn.addEventListener('click', () => closeModal('flight-form-modal'));
    cancelFlightBtn.addEventListener('click', () => closeModal('flight-form-modal'));

    saveFlightBtn.addEventListener('click', () => {
      if (flightForm.checkValidity()) {
        const flightId = document.getElementById('flight-id').value;
        const isEditing = flightId !== '';

        // Get form values
        const flightNumber = document.getElementById('flight-number').value;
        const airlineSelect = document.getElementById('airline');
        const aircraftSelect = document.getElementById('aircraft');
        const originSelect = document.getElementById('origin');
        const destinationSelect = document.getElementById('destination');
        const departureDate = document.getElementById('departure-date').value;
        const departureTime = document.getElementById('departure-time').value;
        const arrivalDate = document.getElementById('arrival-date').value;
        const arrivalTime = document.getElementById('arrival-time').value;
        const status = document.getElementById('status').value;
        const capacity = document.getElementById('capacity').value;
        const notes = document.getElementById('notes').value;

        // Get selected airline and aircraft details
        const selectedAirline = airlinesData.find(a => a.id === airlineSelect.value);
        const selectedAircraft = aircraftData.find(a => a.id === aircraftSelect.value);
        const originText = originSelect.options[originSelect.selectedIndex].text;
        const destinationText = destinationSelect.options[destinationSelect.selectedIndex].text;

        // Create flight object
        const flight = {
          id: isEditing ? flightId : (flightsData.length + 1).toString(),
          flightNumber,
          airline: selectedAirline.name,
          airlineCode: selectedAirline.code,
          origin: originText,
          originCode: originSelect.value,
          destination: destinationText,
          destinationCode: destinationSelect.value,
          departureDate,
          departureTime,
          arrivalDate,
          arrivalTime,
          status,
          aircraft: `${selectedAircraft.manufacturer} ${selectedAircraft.model}`,
          aircraftId: selectedAircraft.id,
          capacity: parseInt(capacity),
          booked: isEditing ? flightsData.find(f => f.id === flightId).booked : 0,
          notes
        };

        if (isEditing) {
          // Update existing flight
          const index = flightsData.findIndex(f => f.id === flightId);
          if (index !== -1) {
            flightsData[index] = flight;
          }
        } else {
          // Add new flight
          flightsData.push(flight);
        }

        // Refresh flights table
        populateFlightsTable();
        closeModal('flight-form-modal');

        // Show success message
        alert(isEditing ? 'Flight updated successfully!' : 'Flight added successfully!');
      } else {
        // Trigger form validation
        flightForm.reportValidity();
      }
    });

    // Function to populate flights table
    function populateFlightsTable() {
      const tableBody = document.querySelector('#flights-table tbody');
      tableBody.innerHTML = '';

      flightsData.forEach(flight => {
        const row = document.createElement('tr');

        row.innerHTML = `
                        <td>${flight.flightNumber}</td>
                        <td>${flight.airline} (${flight.airlineCode})</td>
                        <td>${flight.origin}</td>
                        <td>${flight.destination}</td>
                        <td>${flight.departureDate} ${flight.departureTime}</td>
                        <td>${flight.arrivalDate} ${flight.arrivalTime}</td>
                        <td><span class="status-badge ${flight.status}">${flight.status.charAt(0).toUpperCase() + flight.status.slice(1)}</span></td>
                        <td>${flight.aircraft}</td>
                        <td>${flight.capacity}</td>
                        <td>${flight.booked}</td>
                        <td>
                            <div class="actions">
                                <button class="action-btn edit-btn" title="Edit" data-id="${flight.id}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </button>
                                <button class="action-btn delete-btn" title="Delete" data-id="${flight.id}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                        <path d="M3 6h18"></path>
                                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>
                                        <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    `;

        tableBody.appendChild(row);
      });

      // Add event listeners for edit and delete buttons
      document.querySelectorAll('#flights-table .edit-btn').forEach(btn => {
        btn.addEventListener('click', () => editFlight(btn.getAttribute('data-id')));
      });

      document.querySelectorAll('#flights-table .delete-btn').forEach(btn => {
        btn.addEventListener('click', () => deleteFlight(btn.getAttribute('data-id')));
      });
    }

    // Function to edit flight
    function editFlight(id) {
      const flight = flightsData.find(f => f.id === id);
      if (flight) {
        // Set form values
        document.getElementById('flight-id').value = flight.id;
        document.getElementById('flight-number').value = flight.flightNumber;
        document.getElementById('departure-date').value = flight.departureDate;
        document.getElementById('departure-time').value = flight.departureTime;
        document.getElementById('arrival-date').value = flight.arrivalDate;
        document.getElementById('arrival-time').value = flight.arrivalTime;
        document.getElementById('status').value = flight.status;
        document.getElementById('capacity').value = flight.capacity;
        document.getElementById('notes').value = flight.notes;

        // Populate dropdowns
        populateAirlineDropdown();
        populateAircraftDropdown();

        // Set selected values after populating dropdowns
        const airlineId = airlinesData.find(a => a.code === flight.airlineCode)?.id;
        const aircraftId = flight.aircraftId;
        document.getElementById('airline').value = airlineId;
        document.getElementById('aircraft').value = aircraftId;
        document.getElementById('origin').value = flight.originCode;
        document.getElementById('destination').value = flight.destinationCode;

        // Update modal title and button text
        flightModalTitle.textContent = 'Edit Flight';
        saveFlightBtn.textContent = 'Update Flight';

        openModal('flight-form-modal');
      }
    }

    // Function to delete flight
    function deleteFlight(id) {
      showConfirmation('Are you sure you want to delete this flight?', () => {
        const index = flightsData.findIndex(f => f.id === id);
        if (index !== -1) {
          flightsData.splice(index, 1);
          populateFlightsTable();
          alert('Flight deleted successfully!');
        }
      });
    }
  });
</script>
</body>
</html>

