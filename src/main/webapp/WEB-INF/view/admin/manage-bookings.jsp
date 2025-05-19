<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 26/04/2025
  Time: 6:52 PM
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
<jsp:include page="../../../includes/toast.jsp" />
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
<%--            <div class="filter-group">--%>
<%--              <label for="booking-status-filter">Status</label>--%>
<%--              <select id="booking-status-filter" class="select">--%>
<%--                <option value="all">All Statuses</option>--%>
<%--                <option value="confirmed">Confirmed</option>--%>
<%--                <option value="pending">Pending</option>--%>
<%--                <option value="cancelled">Cancelled</option>--%>
<%--              </select>--%>
<%--            </div>--%>
<%--            <div class="filter-group">--%>
<%--              <label>Booking Date</label>--%>
<%--              <div class="date-range-picker">--%>
<%--                <input type="date" id="booking-start-date" class="input date-input" value="2023-04-28">--%>
<%--                <span>to</span>--%>
<%--                <input type="date" id="booking-end-date" class="input date-input" value="2023-05-15">--%>
<%--              </div>--%>
<%--            </div>--%>
          </div>

          <div class="table-container">
            <table class="data-table" id="bookings-table">
              <thead>
              <tr>
                <th>Booking ID</th>
                <th>Booking Date</th>
                <th>Class Type</th>
                <th>Seats Booked</th>
                <th>Total Price</th>
                <th>Booking Status</th>
                <th>Flight ID</th>
                <th>Passenger ID</th>
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="booking" items="${bookings}">
                <tr>
                  <td>${booking.bookingId}</td>
                  <td>${booking.bookingDate}</td>
                  <td>${booking.classType}</td>
                  <td>${booking.seatsBooked}</td>
                  <td>${booking.totalPrice}</td>
                  <td>${booking.bookingStatus}</td>
                  <td>${booking.flightId}</td>
                  <td>${booking.passengerId}</td>
                  <td>
                    <div class="actions">
                      <button class="action-btn edit-btn" title="Edit" data-booking-id="${booking.bookingId}" data-booking-status="${booking.bookingStatus}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                          <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                          <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                        </svg>
                      </button>
<%--                      <button class="action-btn delete-btn" title="Delete" data-id="${booking.bookingId}">--%>
<%--                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">--%>
<%--                          <path d="M3 6h18"></path>--%>
<%--                          <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>--%>
<%--                          <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>--%>
<%--                        </svg>--%>
<%--                      </button>--%>
                    </div>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
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
            <form id="booking-status-form" method="post" action="${pageContext.request.contextPath}/admin/manage-booking">
              <input type="hidden" id="booking-id" name="bookingId">
              <div class="form-group">
                <label for="booking-status">Status</label>
                <select id="booking-status" name="bookingStatus" class="select" required>
                  <option value="CONFIRMED">Confirmed</option>
                  <option value="PENDING">Pending</option>
                  <option value="CANCELLED">Cancelled</option>
                </select>
              </div>
              <div class="form-group">
                <label for="status-notes">Notes</label>
                <textarea id="status-notes" class="textarea" placeholder="Reason for status change" rows="3"></textarea>
              </div>
              <div class="modal-footer">
                <button class="btn btn-outline" id="cancel-booking-status-btn">Cancel</button>
                <button type="submit" class="btn btn-primary" id="save-booking-status-btn">Update Status</button>
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
      console.log("bookingStatus: ", button.dataset.bookingStatus)
      console.log("bookingId: ", button.dataset.bookingId)
      document.getElementById('booking-status').value = button.dataset.bookingStatus;
      document.getElementById('booking-id').value = button.dataset.bookingId;
    }
    const savedTab = localStorage.getItem('activeTab');
    if (savedTab) {
      updateActiveMenuItem(savedTab);
    }
    // Setup search functionality
    searchTable('bookings-table', 'search-bookings');

    // Booking status modal
    const closeBookingStatusModalBtn = document.getElementById('close-booking-status-modal');
    const cancelBookingStatusBtn = document.getElementById('cancel-booking-status-btn');
    const saveBookingStatusBtn = document.getElementById('save-booking-status-btn');

    closeBookingStatusModalBtn.addEventListener('click', () => closeModal('booking-status-modal'));
    cancelBookingStatusBtn.addEventListener('click', () => closeModal('booking-status-modal'));

    saveBookingStatusBtn.addEventListener('click', () => {
        closeModal('booking-status-modal');
    });

    function editBooking(button) {
      populateForm(button)
      openModal('booking-status-modal');
    }
    const editBookingbtn = document.querySelectorAll('.edit-btn');
    editBookingbtn.forEach(editBtn =>{
      editBtn.addEventListener('click', ()=>{
        console.log("editing bookings...")
        editBooking(editBtn);
      });
    })
  });
</script>
</body>
</html>

