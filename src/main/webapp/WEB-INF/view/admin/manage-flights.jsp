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
<%--            <div class="filter-group">--%>
<%--              <label for="status-filter">Status</label>--%>
<%--              <select id="status-filter" class="select">--%>
<%--                <option value="ALL">All Statuses</option>--%>
<%--                <option value="SCHEDULED">Scheduled</option>--%>
<%--                <option value="ONTIME">On Time</option>--%>
<%--                <option value="DELAYED">Delayed</option>--%>
<%--                <option value="INAIR">In Air</option>--%>
<%--                <option value="LANDED">Landed</option>--%>
<%--                <option value="CANCELLED">Cancelled</option>--%>
<%--              </select>--%>
<%--            </div>--%>
<%--            <div class="filter-group">--%>
<%--              <label>Date Range</label>--%>
<%--              <div class="date-range-picker">--%>
<%--                <input type="date" id="flight-start-date" class="input date-input" value="2023-05-01">--%>
<%--                <span>to</span>--%>
<%--                <input type="date" id="flight-end-date" class="input date-input" value="2023-05-15">--%>
<%--              </div>--%>
<%--            </div>--%>
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
                      <button class="action-btn edit-btn" title="Edit"
                              data-flight-id="${flight.flightId}"
                              data-flight-number="${flight.flightNumber}"
                              data-departure-location="${flight.departureLocation}"
                              data-arrival-location="${flight.arrivalLocation}"
                              data-flight-date="${flight.flightDate}"
                              data-departure-time="${flight.departureTime}"
                              data-arrival-time="${flight.arrivalTime}"
                              data-duration="${flight.duration}"
                              data-status="${flight.status}"
                              data-available-seats-economy="${flight.availableSeatsEconomy}"
                              data-available-seats-business="${flight.availableSeatsBusiness}"
                              data-economy-price="${flight.economyPrice}"
                              data-business-price="${flight.businessPrice}"
                              data-airline-id="${flight.airlineId}"
                              data-aircraft-id="${flight.aircraftId}"
                      >
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                          <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                          <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                        </svg>
                      </button>
                      <form method="post" action="${pageContext.request.contextPath}/admin/manage-flight">
                        <input type="hidden"  name="flightId" value="${flight.flightId}">
                        <input type="hidden"  name="action" value="delete">
                      <button class="action-btn delete-btn" title="Delete" data-id="${flight.flightId}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                          <path d="M3 6h18"></path>
                          <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>
                          <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                        </svg>
                      </button>
                      </form>
                    </div>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <%--confirmation model--%>
      <jsp:include page="../../../confirmation-modal.jsp" />


      <!-- Flight Form Modal -->
      <div class="modal" id="flight-form-modal">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="flight-modal-title">Add New Flight</h3>
            <button class="modal-close" id="close-flight-modal">×</button>
          </div>
          <div class="modal-body">
            <form id="flight-form" method="post" action="${pageContext.request.contextPath}/admin/manage-flight">
              <input type="hidden" id="flight-id" name="flightId">
              <input type="hidden" id="flight-action" name="action">
              <div class="form-grid">

                <div class="form-group">
                  <label for="flight-number">Flight Number</label>
                  <input type="text" id="flight-number" name="flightNumber" class="input" placeholder="e.g. RA123" required>
                </div>

                <div class="form-group">
                  <label for="origin">Departure Location</label>
                  <select id="origin" name="departureLocation" class="select" required>
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
                  <label for="destination">Arrival Location</label>
                  <select id="destination" name="arrivalLocation" class="select" required>
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
                    <option value="SCHEDULED">Scheduled</option>
                    <option value="ONTIME">On Time</option>
                    <option value="DELAYED">Delayed</option>
                    <option value="INAIR">In Air</option>
                    <option value="LANDED">Landed</option>
                    <option value="CANCELLED">Cancelled</option>
                  </select>
                </div>

                <div class="form-group">
                  <label for="business-capacity">Seat Capacity (Business)</label>
                  <input type="number" id="business-capacity" name="availableSeatsBusiness" class="input" placeholder="Total business seats" required>
                </div>

                <div class="form-group">
                  <label for="economy-capacity">Seat Capacity (Economy)</label>
                  <input type="number" id="economy-capacity" name="availableSeatsEconomy" class="input" placeholder="Total economy seats" required>
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
                <label for="airline">Airline</label>
                <select id="airline" name="airlineId" class="select" required>
                  <option value="">Select Airline</option>
                  <c:forEach var="airline" items="${airlines}">
                    <option value="${airline.airlineId}">${airline.name}</option>
                  </c:forEach>
                </select>
              </div>


              <div class="form-group">
                <label for="aircraft">Aircraft</label>
                <select id="aircraft" name="aircraftId" class="select" required>
                  <option value="">Select Aircraft</option>
                  <c:forEach var="aircraft" items="${aircrafts}">
                    <option value="${aircraft.aircraftId}">${aircraft.model}</option>
                  </c:forEach>
                </select>
              </div>


              <div class="form-group">
                <label for="notes">Notes</label>
                <textarea id="notes" name="notes" class="textarea" placeholder="Additional information about this flight" rows="3"></textarea>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline" id="cancel-flight-btn">Cancel</button>
                <button type="submit" class="btn btn-primary" id="save-flight-btn">Save Flight</button>
              </div>
            </form>
          </div>

        </div>
      </div>

    </div>
  </main>
</div>
<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    function populateForm(button) {

      document.getElementById('flight-id').value = button.dataset.flightId;
      document.getElementById('flight-number').value = button.dataset.flightNumber;
      document.getElementById('origin').value = button.dataset.departureLocation;
      document.getElementById('destination').value = button.dataset.arrivalLocation;
      document.getElementById('flight-date').value = button.dataset.flightDate;
      document.getElementById('departure-time').value = button.dataset.departureTime;
      document.getElementById('arrival-time').value = button.dataset.arrivalTime;
      document.getElementById('status').value = button.dataset.status;
      document.getElementById('economy-capacity').value = button.dataset.availableSeatsEconomy;
      document.getElementById('business-capacity').value = button.dataset.availableSeatsBusiness;
      document.getElementById('economy-price').value = button.dataset.economyPrice;
      document.getElementById('business-price').value = button.dataset.businessPrice;
      document.getElementById('airline').value = button.dataset.airlineId;
      document.getElementById('aircraft').value = button.dataset.aircraftId;
    }
    const savedTab = localStorage.getItem('activeTab');
    if (savedTab) {
      updateActiveMenuItem(savedTab);
    }
    // Setup search functionality
    searchTable('flights-table', 'search-flights');

    // Flight form modal
    const addFlightBtn = document.getElementById('add-flight-btn');
    const closeFlightModalBtn = document.getElementById('close-flight-modal');
    const cancelFlightBtn = document.getElementById('cancel-flight-btn');
    const saveFlightBtn = document.getElementById('save-flight-btn');
    const flightModalTitle = document.getElementById('flight-modal-title');
    const editFlightbtn = document.querySelectorAll('.edit-btn');

    addFlightBtn.addEventListener('click', () => {
      document.getElementById('flight-id').value = '';
      document.getElementById('flight-action').value = 'add';
      flightModalTitle.textContent = 'Add New Flight';
      saveFlightBtn.textContent = 'Add Flight';
      openModal('flight-form-modal');
    });

    closeFlightModalBtn.addEventListener('click', () => closeModal('flight-form-modal'));
    cancelFlightBtn.addEventListener('click', () => closeModal('flight-form-modal'));

    // Function to edit flight
    function editFlight(button) {
        // Update modal title and button text
        document.getElementById('flight-action').value = 'update';
        flightModalTitle.textContent = 'Edit Flight';
        saveFlightBtn.textContent = 'Update Flight';
        populateForm(button)
        openModal('flight-form-modal');
    }

    const deleteFlightbtn = document.querySelectorAll('.delete-btn');
    deleteFlightbtn.forEach(deleteBtn =>{
      deleteBtn.addEventListener('click', (event)=>{
        event.preventDefault();
        const form = event.currentTarget.closest('form');
        showConfirmation('Are you sure you want to delete this FLight?', function() {
          console.log("submitting form for delete")
          form.submit();
        }, 'Delete');
      });
    })

    editFlightbtn.forEach(editBtn =>{
      editBtn.addEventListener('click', ()=>{
        editFlight(editBtn);
      });
    })
  });
</script>
</body>
</html>

