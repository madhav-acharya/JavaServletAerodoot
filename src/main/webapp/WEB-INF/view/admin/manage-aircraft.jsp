<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 26/04/2025
  Time: 6:16 PM
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
<%--            <div class="filter-group">--%>
<%--              <label for="aircraft-status-filter">Status</label>--%>
<%--              <select id="aircraft-status-filter" class="select">--%>
<%--                <option value="all">All Statuses</option>--%>
<%--                <option value="active">Active</option>--%>
<%--                <option value="maintenance">Maintenance</option>--%>
<%--                <option value="retired">Retired</option>--%>
<%--              </select>--%>
<%--            </div>--%>
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
              <c:forEach var="aircraft" items="${aircrafts}">
                <tr>
                  <td>${aircraft.aircraftId}</td>
                  <td>${aircraft.model}</td>
                  <td>${aircraft.manufacturer}</td>
                  <td>${aircraft.seatCapacityEconomy}</td>
                  <td>${aircraft.seatCapacityBusiness}</td>
                  <td>${aircraft.lastMaintenanceDate}</td>
                  <td>${aircraft.airlineId}</td>
                  <td>
                    <div class="actions">
                      <button class="action-btn edit-btn" title="Edit"
                              data-aircraft-id="${aircraft.aircraftId}"
                              data-model="${aircraft.model}"
                              data-manufacturer="${aircraft.manufacturer}"
                              data-seat-capacity-economy="${aircraft.seatCapacityEconomy}"
                              data-seat-capacity-business="${aircraft.seatCapacityBusiness}"
                              data-last-maintenance-date="${aircraft.lastMaintenanceDate}"
                              data-airline-id="${aircraft.airlineId}" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                          <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                          <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                        </svg>
                      </button>
                      <form method="post" action="${pageContext.request.contextPath}/admin/manage-aircraft">
                        <input type="hidden" name="aircraftId" value="${aircraft.aircraftId}">
                        <input type="hidden"  name="action" value="delete">
                      <button class="action-btn delete-btn" title="Delete" data-aircraft-id="${aircraft.aircraftId}">
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

      <jsp:include page="../../../confirmation-modal.jsp" />

<%--      Aircraft form modal--%>
      <div class="modal" id="aircraft-form-modal">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="aircraft-modal-title">Add New Aircraft</h3>
            <button class="modal-close" id="close-aircraft-modal">×</button>
          </div>
          <div class="modal-body">
            <form id="aircraft-form" method="post" action="${pageContext.request.contextPath}/admin/manage-aircraft">
              <input type="hidden" id="aircraft-id" name="aircraftId">
              <input type="hidden" id="aircraft-action" name="action" >
              <div class="form-grid">

                <div class="form-group">
                  <label for="model">Model</label>
                  <input type="text" id="model" name="model" class="input" placeholder="e.g. 737-800" required>
                </div>

                <div class="form-group">
                  <label for="manufacturer">Manufacturer</label>
                  <input type="text" id="manufacturer" name="manufacturer" class="input" placeholder="e.g. Boeing" required>
                </div>

                <div class="form-group">
                  <label for="seat-capacity-economy">Seat Capacity (Economy)</label>
                  <input type="number" id="seat-capacity-economy" name="seatCapacityEconomy" class="input" placeholder="e.g. 150" required>
                </div>

                <div class="form-group">
                  <label for="seat-capacity-business">Seat Capacity (Business)</label>
                  <input type="number" id="seat-capacity-business" name="seatCapacityBusiness" class="input" placeholder="e.g. 30" required>
                </div>

                <div class="form-group">
                  <label for="last-maintenance-date">Last Maintenance Date</label>
                  <input type="date" id="last-maintenance-date" name="lastMaintenanceDate" class="input" required>
                </div>

                <div class="form-group">
                  <label for="airline-id">Airline ID</label>
                  <select id="airline-id" name="airlineId" class="select" required>
                    <option value="">Select Airline ID</option>
                    <c:forEach var="airline" items="${airlines}">
                      <option value="${airline.airlineId}">${airline.name}</option>
                    </c:forEach>
                  </select>
                </div>


              </div>
              <div class="modal-footer">
                <button class="btn btn-outline" id="cancel-aircraft-btn">Cancel</button>
                <button type="submit" class="btn btn-primary" id="save-aircraft-btn">Save Aircraft</button>
              </div>
            </form>
          </div>
        </div>
      </div>

    <%--      --%>
    </div>
  </main>
</div>
<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    function populateForm(button) {
      document.getElementById('aircraft-id').value = button.dataset.aircraftId;
      document.getElementById('model').value = button.dataset.model;
      document.getElementById('manufacturer').value = button.dataset.manufacturer;
      document.getElementById('seat-capacity-economy').value = button.dataset.seatCapacityEconomy;
      document.getElementById('seat-capacity-business').value = button.dataset.seatCapacityBusiness;
      document.getElementById('last-maintenance-date').value = button.dataset.lastMaintenanceDate;
      document.getElementById('airline-id').value = button.dataset.airlineId;
    }

    const savedTab = localStorage.getItem('activeTab');
    if (savedTab) {
      updateActiveMenuItem(savedTab);
    }

    // Setup search functionality
    searchTable('aircraft-table', 'search-aircraft');

    // Aircraft form modal
    const addAircraftBtn = document.getElementById('add-aircraft-btn');
    const closeAircraftModalBtn = document.getElementById('close-aircraft-modal');
    const cancelAircraftBtn = document.getElementById('cancel-aircraft-btn');
    const saveAircraftBtn = document.getElementById('save-aircraft-btn');
    const aircraftModalTitle = document.getElementById('aircraft-modal-title');

    addAircraftBtn.addEventListener('click', () => {
      document.getElementById('aircraft-id').value = '';
      document.getElementById('aircraft-action').value = "add";
      aircraftModalTitle.textContent = 'Add New Aircraft';
      saveAircraftBtn.textContent = 'Add Aircraft';

      openModal('aircraft-form-modal');
    });

    closeAircraftModalBtn.addEventListener('click', () => closeModal('aircraft-form-modal'));
    cancelAircraftBtn.addEventListener('click', () => closeModal('aircraft-form-modal'));

    saveAircraftBtn.addEventListener('click', () => {
        closeModal('aircraft-form-modal');
    });

    // Function to edit aircraft
    function editAircraft(button) {
        aircraftModalTitle.textContent = 'Edit Aircraft';
        saveAircraftBtn.textContent = 'Update Aircraft';
        document.getElementById('aircraft-action').value = "update";
        populateForm(button);
        openModal('aircraft-form-modal');
    }

    const deleteAircraftbtn = document.querySelectorAll('.delete-btn');
    deleteAircraftbtn.forEach(deleteBtn =>{
      deleteBtn.addEventListener('click', (event)=>{
        event.preventDefault();
        const form = event.currentTarget.closest('form');
        showConfirmation('Are you sure you want to delete this aircraft?', function() {
          console.log("submitting form for delete")
          form.submit();
        }, 'Delete');
      });
    })

    const editAircraftbtn = document.querySelectorAll('.edit-btn');
    editAircraftbtn.forEach(editBtn =>{
      editBtn.addEventListener('click', ()=>{
        editAircraft(editBtn);
      });
    })
  });
</script>
</body>
</html>
