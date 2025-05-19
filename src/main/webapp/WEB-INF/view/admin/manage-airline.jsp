<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 26/04/2025
  Time: 6:47 PM
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
                    <button class="tab-button active">Airlines</button>
                </div>

                <div class="tab-actions">
                    <button class="btn btn-primary" id="add-airline-btn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                        Add Airline
                    </button>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Airline Management</h3>
                    <p class="card-description">View, add, edit, and delete airlines</p>
                </div>
                <div class="card-content">
                    <div class="filters">
                        <div class="filter-group">
                            <label for="search-airlines">Search Airlines</label>
                            <input type="text" id="search-airlines" class="input" placeholder="Search by name, code, country...">
                        </div>
<%--                        <div class="filter-group">--%>
<%--                            <label for="airline-status-filter">Status</label>--%>
<%--                            <select id="airline-status-filter" class="select">--%>
<%--                                <option value="all">All Statuses</option>--%>
<%--                                <option value="active">Active</option>--%>
<%--                                <option value="inactive">Inactive</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>
                    </div>

                    <div class="table-container">
                        <table class="data-table" id="airlines-table">
                            <thead>
                            <tr>
                                <th>Airline ID</th>
                                <th>Name</th>
                                <th>Headquarters</th>
                                <th>Contact Number</th>
                                <th>Email</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="airline" items="${airlines}">
                                <tr>
                                    <td>${airline.airlineId}</td>
                                    <td>${airline.name}</td>
                                    <td>${airline.headquarters}</td>
                                    <td>${airline.contactNumber}</td>
                                    <td>${airline.email}</td>
                                    <td>
                                        <div class="actions">
                                            <button class="action-btn edit-btn" title="Edit"
                                                    data-airline-id="${airline.airlineId}"
                                                    data-name="${airline.name}"
                                                    data-headquarters="${airline.headquarters}"
                                                    data-contact-number="${airline.contactNumber}"
                                                    data-email="${airline.email}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                                </svg>
                                            </button>
                                            <form method="post" action="${pageContext.request.contextPath}/admin/manage-airline">
                                                <input type="hidden" name="airlineId" value="${airline.airlineId}">
                                                <input type="hidden"  name="action" value="delete">
                                            <button class="action-btn delete-btn" title="Delete" data-id="${airline.airlineId}">
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

            <!-- Airline Form Modal -->
            <div class="modal" id="airline-form-modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="airline-modal-title">Add New Airline</h3>
                        <button class="modal-close" id="close-airline-modal">×</button>
                    </div>
                    <div class="modal-body">
                        <form id="airline-form" method="post" action="${pageContext.request.contextPath}/admin/manage-airline">
                            <input type="hidden" id="airline-action" name="action">
                            <div class="form-grid">
                                <div class="form-group">
                                    <label for="airline-id">Airline ID</label>
                                    <input type="text" id="airline-id" name="airlineId" class="input" placeholder="e.g. RA01" required>
                                </div>

                                <div class="form-group">
                                    <label for="airline-name">Name</label>
                                    <input type="text" id="airline-name" name="name" class="input" placeholder="e.g. Nepal Airlines" required>
                                </div>

                                <div class="form-group">
                                    <label for="headquarters">Headquarters</label>
                                    <input type="text" id="headquarters" name="headquarters" class="input" placeholder="e.g. Kathmandu" required>
                                </div>

                                <div class="form-group">
                                    <label for="contact-number">Contact Number</label>
                                    <input type="tel" id="contact-number" name="contactNumber" class="input" placeholder="e.g. 01-1234567" required>
                                </div>

                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" name="email" class="input" placeholder="e.g. info@nepalairlines.com" required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-outline" id="cancel-airline-btn">Cancel</button>
                                <button type="submit" class="btn btn-primary" id="save-airline-btn">Save Airline</button>
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
            document.getElementById('airline-id').value = button.dataset.airlineId;
            document.getElementById('airline-name').value = button.dataset.name;
            document.getElementById('headquarters').value = button.dataset.headquarters;
            document.getElementById('contact-number').value = button.dataset.contactNumber;
            document.getElementById('email').value = button.dataset.email;
        }

        const savedTab = localStorage.getItem('activeTab');
        if (savedTab) {
            updateActiveMenuItem(savedTab);
        }
        searchTable('airlines-table', 'search-airlines');

        // Setup status filter
        setupTableFilter('airlines-table', 'airline-status-filter', 5);

        // Airline form modal
        const addAirlineBtn = document.getElementById('add-airline-btn');
        const closeAirlineModalBtn = document.getElementById('close-airline-modal');
        const cancelAirlineBtn = document.getElementById('cancel-airline-btn');
        const saveAirlineBtn = document.getElementById('save-airline-btn');
        const airlineModalTitle = document.getElementById('airline-modal-title');

        addAirlineBtn.addEventListener('click', () => {
            document.getElementById('airline-id').value = '';
            document.getElementById('airline-action').value = "add";
            airlineModalTitle.textContent = 'Add New Airline';
            saveAirlineBtn.textContent = 'Add Airline';

            openModal('airline-form-modal');
        });

        closeAirlineModalBtn.addEventListener('click', () => closeModal('airline-form-modal'));
        cancelAirlineBtn.addEventListener('click', () => closeModal('airline-form-modal'));

        saveAirlineBtn.addEventListener('click', () => {
                closeModal('airline-form-modal');
        });

        const deleteAirlinebtn = document.querySelectorAll('.delete-btn');
        deleteAirlinebtn.forEach(deleteBtn =>{
            deleteBtn.addEventListener('click', (event)=>{
                event.preventDefault();
                const form = event.currentTarget.closest('form');
                showConfirmation('Are you sure you want to delete this airline?', function() {
                    console.log("submitting form for delete")
                    form.submit();
                }, 'Delete');
            });
        })

        // Function to edit airline
        function editAirline(button) {
            airlineModalTitle.textContent = 'Edit Airline';
            saveAirlineBtn.textContent = 'Update Airline';
            document.getElementById('airline-action').value = "update";
            populateForm(button)
            openModal('airline-form-modal');
        }
        const editAirlinebtn = document.querySelectorAll('.edit-btn');
        editAirlinebtn.forEach(editBtn =>{
            editBtn.addEventListener('click', ()=>{
                editAirline(editBtn);
            });
        })
    });
</script>
</body>
</html>
