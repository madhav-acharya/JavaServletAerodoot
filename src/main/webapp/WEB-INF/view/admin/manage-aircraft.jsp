<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 26/04/2025
  Time: 6:16 PM
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
          <button class="tab-button active">Aircraft</button>
        </div>

        <div class="tab-actions">
          <button class="btn btn-primary" id="add-aircraft-btn">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
              <line x1="12" y1="5" x2="12" y2="19"></line>
              <line x1="5" y1="12" x2="19" y2="12"></line>
            </svg>
            Add Aircraft
          </button>
        </div>
      </div>

      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Aircraft Management</h3>
          <p class="card-description">View, add, edit, and delete aircraft</p>
        </div>
        <div class="card-content">
          <div class="filters">
            <div class="filter-group">
              <label for="search-aircraft">Search Aircraft</label>
              <input type="text" id="search-aircraft" class="input" placeholder="Search by registration, model, manufacturer...">
            </div>
            <div class="filter-group">
              <label for="aircraft-status-filter">Status</label>
              <select id="aircraft-status-filter" class="select">
                <option value="all">All Statuses</option>
                <option value="active">Active</option>
                <option value="maintenance">Maintenance</option>
                <option value="retired">Retired</option>
              </select>
            </div>
          </div>

          <div class="table-container">
            <table class="data-table" id="aircraft-table">
              <thead>
              <tr>
                <th>Aircraft ID</th>
                <th>Model</th>
                <th>Manufacturer</th>
                <th>Seat Capacity (Economy)</th>
                <th>Seat Capacity (Business)</th>
                <th>Last Maintenance Date</th>
                <th>Airline ID</th>
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>1</td>
                <td>Boeing 737</td>
                <td>Boeing</td>
                <td>150</td>
                <td>30</td>
                <td>2024-01-15</td>
                <td>1</td>
              </tr>
              <tr>
                <td>2</td>
                <td>A320</td>
                <td>Airbus</td>
                <td>180</td>
                <td>40</td>
                <td>2024-02-10</td>
                <td>2</td>
              </tr>
              </tbody>
            </table>
          </div>

          <div class="pagination">
            <button class="pagination-btn" id="aircraft-first-page-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                <polyline points="11 17 6 12 11 7"></polyline>
                <polyline points="18 17 13 12 18 7"></polyline>
              </svg>
            </button>
            <button class="pagination-btn" id="aircraft-prev-page-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                <polyline points="15 18 9 12 15 6"></polyline>
              </svg>
            </button>
            <div class="pagination-info">
              <input type="text" class="input pagination-input" id="aircraft-current-page" value="1">
              <span>of <span id="aircraft-total-pages">1</span></span>
            </div>
            <button class="pagination-btn" id="aircraft-next-page-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                <polyline points="9 18 15 12 9 6"></polyline>
              </svg>
            </button>
            <button class="pagination-btn" id="aircraft-last-page-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                <polyline points="13 17 18 12 13 7"></polyline>
                <polyline points="6 17 11 12 6 7"></polyline>
              </svg>
            </button>
          </div>
        </div>
      </div>

      <!-- Aircraft Form Modal -->
      <div class="modal" id="aircraft-form-modal">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="aircraft-modal-title">Add New Aircraft</h3>
            <button class="modal-close" id="close-aircraft-modal">×</button>
          </div>
          <div class="modal-body">
            <form id="aircraft-form">
              <input type="hidden" id="aircraft-id">
              <div class="form-grid">
                <div class="form-group">
                  <label for="registration">Registration</label>
                  <input type="text" id="registration" class="input" placeholder="e.g. N12345" required>
                </div>
                <div class="form-group">
                  <label for="manufacturer">Manufacturer</label>
                  <input type="text" id="manufacturer" class="input" placeholder="e.g. Boeing" required>
                </div>
                <div class="form-group">
                  <label for="model">Model</label>
                  <input type="text" id="model" class="input" placeholder="e.g. 737-800" required>
                </div>
                <div class="form-group">
                  <label for="year">Year</label>
                  <input type="number" id="year" class="input" placeholder="e.g. 2018" required>
                </div>
                <div class="form-group">
                  <label for="aircraft-capacity">Capacity</label>
                  <input type="number" id="aircraft-capacity" class="input" placeholder="Total seats" required>
                </div>
                <div class="form-group">
                  <label for="aircraft-status">Status</label>
                  <select id="aircraft-status" class="select" required>
                    <option value="active">Active</option>
                    <option value="maintenance">Maintenance</option>
                    <option value="retired">Retired</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="last-maintenance">Last Maintenance</label>
                  <input type="date" id="last-maintenance" class="input" required>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button class="btn btn-outline" id="cancel-aircraft-btn">Cancel</button>
            <button class="btn btn-primary" id="save-aircraft-btn">Add Aircraft</button>
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
    // Populate aircraft table
    populateAircraftTable();

    // Setup search functionality
    searchTable('aircraft-table', 'search-aircraft');

    // Setup status filter
    setupTableFilter('aircraft-table', 'aircraft-status-filter', 5);

    // Aircraft form modal
    const addAircraftBtn = document.getElementById('add-aircraft-btn');
    const closeAircraftModalBtn = document.getElementById('close-aircraft-modal');
    const cancelAircraftBtn = document.getElementById('cancel-aircraft-btn');
    const saveAircraftBtn = document.getElementById('save-aircraft-btn');
    const aircraftForm = document.getElementById('aircraft-form');
    const aircraftModalTitle = document.getElementById('aircraft-modal-title');

    addAircraftBtn.addEventListener('click', () => {
      // Reset form and prepare for adding a new aircraft
      aircraftForm.reset();
      document.getElementById('aircraft-id').value = '';
      aircraftModalTitle.textContent = 'Add New Aircraft';
      saveAircraftBtn.textContent = 'Add Aircraft';

      openModal('aircraft-form-modal');
    });

    closeAircraftModalBtn.addEventListener('click', () => closeModal('aircraft-form-modal'));
    cancelAircraftBtn.addEventListener('click', () => closeModal('aircraft-form-modal'));

    saveAircraftBtn.addEventListener('click', () => {
        closeModal('aircraft-form-modal');
    });

    // Function to populate aircraft table
    function populateAircraftTable() {

      // Add event listeners for edit and delete buttons
      document.querySelectorAll('#aircraft-table .edit-btn').forEach(btn => {
        btn.addEventListener('click', () => editAircraft(btn.getAttribute('data-id')));
      });

      document.querySelectorAll('#aircraft-table .delete-btn').forEach(btn => {
        btn.addEventListener('click', () => deleteAircraft(btn.getAttribute('data-id')));
      });
    }

    // Function to edit aircraft
    function editAircraft() {

        // Update modal title and button text
        aircraftModalTitle.textContent = 'Edit Aircraft';
        saveAircraftBtn.textContent = 'Update Aircraft';

        openModal('aircraft-form-modal');
    }

    // Function to delete aircraft
    function deleteAircraft(id) {
    }
  });
</script>
</body>
</html>
