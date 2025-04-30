<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 26/04/2025
  Time: 6:47 PM
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
                        <div class="filter-group">
                            <label for="airline-status-filter">Status</label>
                            <select id="airline-status-filter" class="select">
                                <option value="all">All Statuses</option>
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                        </div>
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
                            <tr>
                                <td>1</td>
                                <td>Air Nepal</td>
                                <td>Kathmandu, Nepal</td>
                                <td>+977 1 4444444</td>
                                <td>contact@airnepal.com</td>
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
                                <td>Sikha Airlines</td>
                                <td>Pokhara, Nepal</td>
                                <td>+977 61 555555</td>
                                <td>info@sikhaairlines.com</td>
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
                        <button class="pagination-btn" id="airlines-first-page-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                <polyline points="11 17 6 12 11 7"></polyline>
                                <polyline points="18 17 13 12 18 7"></polyline>
                            </svg>
                        </button>
                        <button class="pagination-btn" id="airlines-prev-page-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                <polyline points="15 18 9 12 15 6"></polyline>
                            </svg>
                        </button>
                        <div class="pagination-info">
                            <input type="text" class="input pagination-input" id="airlines-current-page" value="1">
                            <span>of <span id="airlines-total-pages">1</span></span>
                        </div>
                        <button class="pagination-btn" id="airlines-next-page-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </button>
                        <button class="pagination-btn" id="airlines-last-page-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                <polyline points="13 17 18 12 13 7"></polyline>
                                <polyline points="6 17 11 12 6 7"></polyline>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Airline Form Modal -->
            <div class="modal" id="airline-form-modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="airline-modal-title">Add New Airline</h3>
                        <button class="modal-close" id="close-airline-modal">×</button>
                    </div>
                    <div class="modal-body">
                        <form id="airline-form">
                            <input type="hidden" id="airline-id">
                            <div class="form-grid">
                                <div class="form-group">
                                    <label for="airline-code">Airline Code</label>
                                    <input type="text" id="airline-code" class="input" placeholder="e.g. AA" required>
                                </div>
                                <div class="form-group">
                                    <label for="airline-name">Name</label>
                                    <input type="text" id="airline-name" class="input" placeholder="e.g. American Airlines" required>
                                </div>
                                <div class="form-group">
                                    <label for="country">Country</label>
                                    <input type="text" id="country" class="input" placeholder="e.g. United States" required>
                                </div>
                                <div class="form-group">
                                    <label for="founded">Founded</label>
                                    <input type="number" id="founded" class="input" placeholder="e.g. 1934" required>
                                </div>
                                <div class="form-group">
                                    <label for="fleet-size">Fleet Size</label>
                                    <input type="number" id="fleet-size" class="input" placeholder="e.g. 950" required>
                                </div>
                                <div class="form-group">
                                    <label for="airline-status">Status</label>
                                    <select id="airline-status" class="select" required>
                                        <option value="active">Active</option>
                                        <option value="inactive">Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-outline" id="cancel-airline-btn">Cancel</button>
                        <button class="btn btn-primary" id="save-airline-btn">Add Airline</button>
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
        searchTable('airlines-table', 'search-airlines');

        // Setup status filter
        setupTableFilter('airlines-table', 'airline-status-filter', 5);

        // Airline form modal
        const addAirlineBtn = document.getElementById('add-airline-btn');
        const closeAirlineModalBtn = document.getElementById('close-airline-modal');
        const cancelAirlineBtn = document.getElementById('cancel-airline-btn');
        const saveAirlineBtn = document.getElementById('save-airline-btn');
        const airlineForm = document.getElementById('airline-form');
        const airlineModalTitle = document.getElementById('airline-modal-title');

        addAirlineBtn.addEventListener('click', () => {
            airlineModalTitle.textContent = 'Add New Airline';
            saveAirlineBtn.textContent = 'Add Airline';

            openModal('airline-form-modal');
        });

        closeAirlineModalBtn.addEventListener('click', () => closeModal('airline-form-modal'));
        cancelAirlineBtn.addEventListener('click', () => closeModal('airline-form-modal'));

        saveAirlineBtn.addEventListener('click', () => {
                closeModal('airline-form-modal');
        });
        // Function to edit airline
        function editAirline() {
            airlineModalTitle.textContent = 'Edit Airline';
            saveAirlineBtn.textContent = 'Update Airline';
            openModal('airline-form-modal');
        }
        const editAirlinebtn = document.querySelectorAll('.edit-btn');
        editAirlinebtn.forEach(editBtn =>{
            editBtn.addEventListener('click', ()=>{
                editAirline();
            });
        })
    });
</script>
</body>
</html>
