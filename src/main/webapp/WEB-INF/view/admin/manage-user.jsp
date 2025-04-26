<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 27/04/2025
  Time: 12:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
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
                    <button class="tab-button active">Users</button>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">User Management</h3>
                    <p class="card-description">View and manage all system users</p>
                </div>
                <div class="card-content">
                    <div class="filters">
                        <div class="filter-group">
                            <label for="search-users">Search Users</label>
                            <input type="text" id="search-users" class="input" placeholder="Search by ID, name, email...">
                        </div>
                        <div class="filter-group">
                            <label for="user-type-filter">User Type</label>
                            <select id="user-type-filter" class="select">
                                <option value="all">All Types</option>
                                <option value="PASSENGER">Passenger</option>
                                <option value="AGENT">Agent</option>
                                <option value="ADMIN">Admin</option>
                            </select>
                        </div>
                        <div class="filter-group">
                            <label>Registration Date</label>
                            <div class="date-range-picker">
                                <input type="date" id="user-start-date" class="input date-input" value="2023-04-28">
                                <span>to</span>
                                <input type="date" id="user-end-date" class="input date-input" value="2023-05-15">
                            </div>
                        </div>
                    </div>

                    <div class="table-container">
                        <table class="data-table" id="users-table">
                            <thead>
                            <tr>
                                <th>User ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Phone Number</th>
                                <th>User Type</th>
                                <th>Created At</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>John</td>
                                <td>Doe</td>
                                <td>john.doe@example.com</td>
                                <td>+1234567890</td>
                                <td>PASSENGER</td>
                                <td>2024-04-01 10:00:00</td>
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
                                <td>Jane</td>
                                <td>Smith</td>
                                <td>jane.smith@example.com</td>
                                <td>+0987654321</td>
                                <td>AGENT</td>
                                <td>2024-04-02 11:30:00</td>
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
                        <button class="pagination-btn" id="users-first-page-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                <polyline points="11 17 6 12 11 7"></polyline>
                                <polyline points="18 17 13 12 18 7"></polyline>
                            </svg>
                        </button>
                        <button class="pagination-btn" id="users-prev-page-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                <polyline points="15 18 9 12 15 6"></polyline>
                            </svg>
                        </button>
                        <div class="pagination-info">
                            <input type="text" class="input pagination-input" id="users-current-page" value="1">
                            <span>of <span id="users-total-pages">1</span></span>
                        </div>
                        <button class="pagination-btn" id="users-next-page-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </button>
                        <button class="pagination-btn" id="users-last-page-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                <polyline points="13 17 18 12 13 7"></polyline>
                                <polyline points="6 17 11 12 6 7"></polyline>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>

            <!-- User Edit Modal -->
            <div class="modal" id="user-edit-modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">Edit User</h3>
                        <button class="modal-close" id="close-user-edit-modal">×</button>
                    </div>
                    <div class="modal-body">
                        <form id="user-edit-form">
                            <input type="hidden" id="user-id">
                            <div class="form-group">
                                <label for="first-name">First Name</label>
                                <input type="text" id="first-name" class="input" required>
                            </div>
                            <div class="form-group">
                                <label for="last-name">Last Name</label>
                                <input type="text" id="last-name" class="input" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" class="input" required>
                            </div>
                            <div class="form-group">
                                <label for="phone-number">Phone Number</label>
                                <input type="tel" id="phone-number" class="input">
                            </div>
                            <div class="form-group">
                                <label for="user-type">User Type</label>
                                <select id="user-type" class="select" required>
                                    <option value="PASSENGER">Passenger</option>
                                    <option value="AGENT">Agent</option>
                                    <option value="ADMIN">Admin</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="reset-password">Reset Password</label>
                                <div class="toggle-field">
                                    <input type="checkbox" id="reset-password" class="toggle">
                                    <label for="reset-password" class="toggle-label"></label>
                                    <span class="toggle-text">Send password reset email</span>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-outline" id="cancel-user-edit-btn">Cancel</button>
                        <button class="btn btn-primary" id="save-user-btn">Save Changes</button>
                    </div>
                </div>
            </div>

            <!-- Add User Modal -->
            <div class="modal" id="add-user-modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">Add New User</h3>
                        <button class="modal-close" id="close-add-user-modal">×</button>
                    </div>
                    <div class="modal-body">
                        <form id="add-user-form">
                            <div class="form-group">
                                <label for="new-first-name">First Name</label>
                                <input type="text" id="new-first-name" class="input" required>
                            </div>
                            <div class="form-group">
                                <label for="new-last-name">Last Name</label>
                                <input type="text" id="new-last-name" class="input" required>
                            </div>
                            <div class="form-group">
                                <label for="new-email">Email</label>
                                <input type="email" id="new-email" class="input" required>
                            </div>
                            <div class="form-group">
                                <label for="new-password">Password</label>
                                <input type="password" id="new-password" class="input" required>
                            </div>
                            <div class="form-group">
                                <label for="new-phone-number">Phone Number</label>
                                <input type="tel" id="new-phone-number" class="input">
                            </div>
                            <div class="form-group">
                                <label for="new-user-type">User Type</label>
                                <select id="new-user-type" class="select" required>
                                    <option value="PASSENGER">Passenger</option>
                                    <option value="AGENT">Agent</option>
                                    <option value="ADMIN">Admin</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-outline" id="cancel-add-user-btn">Cancel</button>
                        <button class="btn btn-primary" id="create-user-btn">Create User</button>
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

        // Sample user data for demonstration
        const usersData = [
            {
                id: '1',
                firstName: 'John',
                lastName: 'Doe',
                email: 'john.doe@example.com',
                phoneNumber: '+1234567890',
                userType: 'PASSENGER',
                createdAt: '2024-04-01 10:00:00'
            },
            {
                id: '2',
                firstName: 'Jane',
                lastName: 'Smith',
                email: 'jane.smith@example.com',
                phoneNumber: '+0987654321',
                userType: 'AGENT',
                createdAt: '2024-04-02 11:30:00'
            },
            {
                id: '3',
                firstName: 'Admin',
                lastName: 'User',
                email: 'admin@example.com',
                phoneNumber: '+1122334455',
                userType: 'ADMIN',
                createdAt: '2024-04-03 09:15:00'
            }
        ];

        // Populate users table
        populateUsersTable();

        // Add "Add User" button to the card header
        const cardHeader = document.querySelector('.card-header');
        const addUserBtn = document.createElement('button');
        addUserBtn.className = 'btn btn-primary';
        addUserBtn.id = 'add-user-btn';
        addUserBtn.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg> Add User';
        cardHeader.appendChild(addUserBtn);

        // Setup search functionality
        searchTable('users-table', 'search-users');

        // Setup user type filter
        setupTableFilter('users-table', 'user-type-filter', 5);

        // Setup date range filter
        setupDateRangeFilter('users-table', 'user-start-date', 'user-end-date', 6);

        // User edit modal event listeners
        const closeUserEditModalBtn = document.getElementById('close-user-edit-modal');
        const cancelUserEditBtn = document.getElementById('cancel-user-edit-btn');
        const saveUserBtn = document.getElementById('save-user-btn');
        const userEditForm = document.getElementById('user-edit-form');

        closeUserEditModalBtn.addEventListener('click', () => closeModal('user-edit-modal'));
        cancelUserEditBtn.addEventListener('click', () => closeModal('user-edit-modal'));

        saveUserBtn.addEventListener('click', () => {
            if (userEditForm.checkValidity()) {
                const userId = document.getElementById('user-id').value;
                const firstName = document.getElementById('first-name').value;
                const lastName = document.getElementById('last-name').value;
                const email = document.getElementById('email').value;
                const phoneNumber = document.getElementById('phone-number').value;
                const userType = document.getElementById('user-type').value;
                const resetPassword = document.getElementById('reset-password').checked;

                // Update user data
                const index = usersData.findIndex(u => u.id === userId);
                if (index !== -1) {
                    usersData[index].firstName = firstName;
                    usersData[index].lastName = lastName;
                    usersData[index].email = email;
                    usersData[index].phoneNumber = phoneNumber;
                    usersData[index].userType = userType;
                }

                // Refresh users table
                populateUsersTable();
                closeModal('user-edit-modal');

                // Show success message
                if (resetPassword) {
                    alert('User updated successfully and password reset email sent!');
                } else {
                    alert('User updated successfully!');
                }
            } else {
                // Trigger form validation
                userEditForm.reportValidity();
            }
        });

        // Add User modal event listeners
        const addUserButtonMain = document.getElementById('add-user-btn');
        const closeAddUserModalBtn = document.getElementById('close-add-user-modal');
        const cancelAddUserBtn = document.getElementById('cancel-add-user-btn');
        const createUserBtn = document.getElementById('create-user-btn');
        const addUserForm = document.getElementById('add-user-form');

        addUserButtonMain.addEventListener('click', () => openModal('add-user-modal'));
        closeAddUserModalBtn.addEventListener('click', () => closeModal('add-user-modal'));
        cancelAddUserBtn.addEventListener('click', () => closeModal('add-user-modal'));

        createUserBtn.addEventListener('click', () => {
            if (addUserForm.checkValidity()) {
                const newUser = {
                    id: (usersData.length + 1).toString(),
                    firstName: document.getElementById('new-first-name').value,
                    lastName: document.getElementById('new-last-name').value,
                    email: document.getElementById('new-email').value,
                    phoneNumber: document.getElementById('new-phone-number').value,
                    userType: document.getElementById('new-user-type').value,
                    createdAt: new Date().toISOString().replace('T', ' ').substring(0, 19)
                };

                // Add new user to data
                usersData.push(newUser);

                // Refresh users table
                populateUsersTable();
                closeModal('add-user-modal');

                // Reset form
                addUserForm.reset();

                // Show success message
                alert('User created successfully!');
            } else {
                // Trigger form validation
                addUserForm.reportValidity();
            }
        });

        // Function to populate users table
        function populateUsersTable() {
            const tableBody = document.querySelector('#users-table tbody');
            tableBody.innerHTML = '';

            usersData.forEach(user => {
                const row = document.createElement('tr');
                row.innerHTML = `
          <td>${user.id}</td>
          <td>${user.firstName}</td>
          <td>${user.lastName}</td>
          <td>${user.email}</td>
          <td>${user.phoneNumber || '-'}</td>
          <td>${user.userType}</td>
          <td>${user.createdAt}</td>
          <td>
            <div class="actions">
              <button class="action-btn edit-btn" title="Edit" data-id="${user.id}">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                  <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                  <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                </svg>
              </button>
              <button class="action-btn delete-btn" title="Delete" data-id="${user.id}">
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
            document.querySelectorAll('#users-table .edit-btn').forEach(btn => {
                btn.addEventListener('click', () => editUser(btn.getAttribute('data-id')));
            });

            document.querySelectorAll('#users-table .delete-btn').forEach(btn => {
                btn.addEventListener('click', () => deleteUser(btn.getAttribute('data-id')));
            });
        }

        // Function to edit user
        function editUser(id) {
            const user = usersData.find(u => u.id === id);
            if (user) {
                document.getElementById('user-id').value = user.id;
                document.getElementById('first-name').value = user.firstName;
                document.getElementById('last-name').value = user.lastName;
                document.getElementById('email').value = user.email;
                document.getElementById('phone-number').value = user.phoneNumber || '';
                document.getElementById('user-type').value = user.userType;
                document.getElementById('reset-password').checked = false;

                openModal('user-edit-modal');
            }
        }

        // Function to delete user
        function deleteUser(id) {
            showConfirmation('Are you sure you want to delete this user?', () => {
                const index = usersData.findIndex(u => u.id === id);
                if (index !== -1) {
                    usersData.splice(index, 1);
                    populateUsersTable();
                    alert('User deleted successfully!');
                }
            });
        }

        // Utility function to show confirmation dialog
        function showConfirmation(message, onConfirm) {
            if (confirm(message)) {
                onConfirm();
            }
        }

        // Utility function to open modal
        function openModal(modalId) {
            document.getElementById(modalId).classList.add('show');
        }

        // Utility function to close modal
        function closeModal(modalId) {
            document.getElementById(modalId).classList.remove('show');
        }

        // Utility function to search table
        function searchTable(tableId, searchInputId) {
            const searchInput = document.getElementById(searchInputId);
            searchInput.addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase();
                const table = document.getElementById(tableId);
                const rows = table.getElementsByTagName('tr');

                for (let i = 1; i < rows.length; i++) {
                    const row = rows[i];
                    const cells = row.getElementsByTagName('td');
                    let foundMatch = false;

                    for (let j = 0; j < cells.length; j++) {
                        const cellText = cells[j].textContent.toLowerCase();
                        if (cellText.includes(searchTerm)) {
                            foundMatch = true;
                            break;
                        }
                    }

                    row.style.display = foundMatch ? '' : 'none';
                }
            });
        }

        // Utility function to filter table by column value
        function setupTableFilter(tableId, filterId, columnIndex) {
            const filterSelect = document.getElementById(filterId);
            filterSelect.addEventListener('change', function() {
                const filterValue = this.value.toLowerCase();
                const table = document.getElementById(tableId);
                const rows = table.getElementsByTagName('tr');

                for (let i = 1; i < rows.length; i++) {
                    const row = rows[i];
                    const cell = row.getElementsByTagName('td')[columnIndex];
                    const cellValue = cell.textContent.toLowerCase();

                    if (filterValue === 'all' || cellValue === filterValue) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                }
            });
        }

        // Utility function to filter table by date range
        function setupDateRangeFilter(tableId, startDateId, endDateId, columnIndex) {
            const startDateInput = document.getElementById(startDateId);
            const endDateInput = document.getElementById(endDateId);

            function applyDateFilter() {
                const startDate = new Date(startDateInput.value);
                const endDate = new Date(endDateInput.value);
                endDate.setHours(23, 59, 59); // Set to end of day

                const table = document.getElementById(tableId);
                const rows = table.getElementsByTagName('tr');

                for (let i = 1; i < rows.length; i++) {
                    const row = rows[i];
                    const cell = row.getElementsByTagName('td')[columnIndex];
                    const cellDate = new Date(cell.textContent);

                    if (cellDate >= startDate && cellDate <= endDate) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                }
            }

            startDateInput.addEventListener('change', applyDateFilter);
            endDateInput.addEventListener('change', applyDateFilter);
        }
    });
</script>

</body>
</html>
