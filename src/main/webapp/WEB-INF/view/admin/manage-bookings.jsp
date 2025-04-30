<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 26/04/2025
  Time: 6:52 PM
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
          <button class="tab-button active">Bookings</button>
        </div>
      </div>

      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Booking Management</h3>
          <p class="card-description">View and manage all passenger bookings</p>
        </div>
        <div class="card-content">
          <div class="filters">
            <div class="filter-group">
              <label for="search-bookings">Search Bookings</label>
              <input type="text" id="search-bookings" class="input" placeholder="Search by booking ID, passenger name, flight...">
            </div>
            <div class="filter-group">
              <label for="booking-status-filter">Status</label>
              <select id="booking-status-filter" class="select">
                <option value="all">All Statuses</option>
                <option value="confirmed">Confirmed</option>
                <option value="pending">Pending</option>
                <option value="cancelled">Cancelled</option>
                <option value="refunded">Refunded</option>
              </select>
            </div>
            <div class="filter-group">
              <label>Booking Date</label>
              <div class="date-range-picker">
                <input type="date" id="booking-start-date" class="input date-input" value="2023-04-28">
                <span>to</span>
                <input type="date" id="booking-end-date" class="input date-input" value="2023-05-15">
              </div>
            </div>
          </div>

          <div class="table-container">
            <table class="data-table" id="bookings-table">
              <thead>
              <tr>
                <th>Booking ID</th>
                <th>Booking Date</th>
                <th>Class Type</th>
                <th>Seats Booked</th>
                <th>Seat Numbers</th>
                <th>Total Price</th>
                <th>Booking Status</th>
                <th>Flight ID</th>
                <th>Passenger ID</th>
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>1</td>
                <td>2024-04-01 10:00:00</td>
                <td>ECONOMY</td>
                <td>2</td>
                <td>12A,12B</td>
                <td>300.00</td>
                <td>CONFIRMED</td>
                <td>101</td>
                <td>201</td>
                <td>
                  <div class="actions">
                    <button class="action-btn edit-btn" title="Edit" data-id="1">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                      </svg>
                    </button>
                    <button class="action-btn delete-btn" title="Delete" data-id="1">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                        <path d="M3 6h18"></path>
                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>
                        <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                      </svg>
                    </button>
                  </div>
                </td>
              </tr>
              <tr>
                <td>2</td>
                <td>2024-04-02 11:30:00</td>
                <td>BUSINESS</td>
                <td>1</td>
                <td>1A</td>
                <td>500.00</td>
                <td>PENDING</td>
                <td>102</td>
                <td>202</td>
                <td>
                  <div class="actions">
                    <button class="action-btn edit-btn" title="Edit" data-id="2">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                      </svg>
                    </button>
                    <button class="action-btn delete-btn" title="Delete" data-id="2">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                        <path d="M3 6h18"></path>
                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>
                        <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                      </svg>
                    </button>
                  </div>
                </td>
              </tr>
              </tbody>
            </table>
          </div>

          <div class="pagination">
            <button class="pagination-btn" id="bookings-first-page-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                <polyline points="11 17 6 12 11 7"></polyline>
                <polyline points="18 17 13 12 18 7"></polyline>
              </svg>
            </button>
            <button class="pagination-btn" id="bookings-prev-page-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                <polyline points="15 18 9 12 15 6"></polyline>
              </svg>
            </button>
            <div class="pagination-info">
              <input type="text" class="input pagination-input" id="bookings-current-page" value="1">
              <span>of <span id="bookings-total-pages">1</span></span>
            </div>
            <button class="pagination-btn" id="bookings-next-page-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                <polyline points="9 18 15 12 9 6"></polyline>
              </svg>
            </button>
            <button class="pagination-btn" id="bookings-last-page-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                <polyline points="13 17 18 12 13 7"></polyline>
                <polyline points="6 17 11 12 6 7"></polyline>
              </svg>
            </button>
          </div>
        </div>
      </div>

      <!-- Booking Status Modal -->
      <div class="modal" id="booking-status-modal">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title">Update Booking Status</h3>
            <button class="modal-close" id="close-booking-status-modal">×</button>
          </div>
          <div class="modal-body">
            <form id="booking-status-form">
              <input type="hidden" id="booking-id">
              <div class="form-group">
                <label for="booking-status">Status</label>
                <select id="booking-status" class="select" required>
                  <option value="confirmed">Confirmed</option>
                  <option value="pending">Pending</option>
                  <option value="cancelled">Cancelled</option>
                  <option value="refunded">Refunded</option>
                </select>
              </div>
              <div class="form-group">
                <label for="status-notes">Notes</label>
                <textarea id="status-notes" class="textarea" placeholder="Reason for status change" rows="3"></textarea>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button class="btn btn-outline" id="cancel-booking-status-btn">Cancel</button>
            <button class="btn btn-primary" id="save-booking-status-btn">Update Status</button>
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
    searchTable('bookings-table', 'search-bookings');

    // Setup status filter
    setupTableFilter('bookings-table', 'booking-status-filter', 5);

    // Setup date range filter
    setupDateRangeFilter('bookings-table', 'booking-start-date', 'booking-end-date', 4);

    // Booking status modal
    const closeBookingStatusModalBtn = document.getElementById('close-booking-status-modal');
    const cancelBookingStatusBtn = document.getElementById('cancel-booking-status-btn');
    const saveBookingStatusBtn = document.getElementById('save-booking-status-btn');
    const bookingStatusForm = document.getElementById('booking-status-form');

    closeBookingStatusModalBtn.addEventListener('click', () => closeModal('booking-status-modal'));
    cancelBookingStatusBtn.addEventListener('click', () => closeModal('booking-status-modal'));

    saveBookingStatusBtn.addEventListener('click', () => {
        closeModal('booking-status-modal');
    });

    function editBooking() {
      openModal('booking-status-modal');
    }
    const editBookingbtn = document.querySelectorAll('.edit-btn');
    editBookingbtn.forEach(editBtn =>{
      editBtn.addEventListener('click', ()=>{
        console.log("editing bookings...")
        editBooking();
      });
    })
  });
</script>
</body>
</html>

