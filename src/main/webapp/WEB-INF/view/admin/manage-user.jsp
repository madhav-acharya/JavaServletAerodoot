<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 27/04/2025
  Time: 12:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
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
<%--                        <div class="filter-group">--%>
<%--                            <label for="user-type-filter">User Type</label>--%>
<%--                            <select id="user-type-filter" class="select">--%>
<%--                                <option value="all">All Types</option>--%>
<%--                                <option value="PASSENGER">Passenger</option>--%>
<%--                                <option value="AGENT">Agent</option>--%>
<%--                                <option value="ADMIN">Admin</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                        <div class="filter-group">--%>
<%--                            <label>Registration Date</label>--%>
<%--                            <div class="date-range-picker">--%>
<%--                                <input type="date" id="user-start-date" class="input date-input" value="2023-04-28">--%>
<%--                                <span>to</span>--%>
<%--                                <input type="date" id="user-end-date" class="input date-input" value="2023-05-15">--%>
<%--                            </div>--%>
<%--                        </div>--%>
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
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.userId}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.email}</td>
                                    <td>${user.phoneNumber}</td>
                                    <td>${user.userType}</td>
                                    <td>${user.createdAt}</td>
                                    <td>
                                        <div class="actions">
                                                <input type="hidden"  name="userId" value="${user.userId}">
                                                <input type="hidden"  name="action" value="edit">
                                            <button class="action-btn edit-btn" title="Edit"
                                                    data-user-id="${user.userId}"
                                                    data-first-name="${user.firstName}"
                                                    data-last-name="${user.lastName}"
                                                    data-email="${user.email}"
                                                    data-phone-number="${user.phoneNumber}"
                                                    data-user-type="${user.userType}"
                                                    data-created-at="${user.createdAt}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                                </svg>
                                            </button>
                                            <form method="post" action="${pageContext.request.contextPath}/admin/manage-user">
                                            <button class="action-btn delete-btn" title="Delete" data-user-id="${user.userId}" data-user-action="delete">
                                                <input type="hidden"  name="userId" value="${user.userId}">
                                                <input type="hidden"  name="action" value="delete">
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

            <!-- User Edit Modal -->
            <div class="modal" id="user-edit-modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">Edit Users</h3>
                        <button class="modal-close" id="close-user-edit-modal">×</button>
                    </div>
                    <div class="modal-body">
                        <form id="user-edit-form" method="post" action="${pageContext.request.contextPath}/admin/manage-user">
                            <input type="hidden" id="user-action" name="action" value="update">
                            <input type="hidden"  id="user-id" name="userId" >
                            <div class="form-group">
                                <label for="first-name">First Name</label>
                                <input type="text" id="first-name" name="firstName" class="input" required >
                            </div>

                            <div class="form-group">
                                <label for="last-name">Last Name</label>
                                <input type="text" id="last-name" name="lastName" class="input" required>
                            </div>

                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" class="input" required >
                            </div>

                            <div class="form-group">
                                <label for="phone-number">Phone Number</label>
                                <input type="tel" id="phone-number" name="phoneNumber" class="input" >
                            </div>

                            <div class="form-group">
                                <label for="user-type">User Types</label>
                                <select id="user-type" name="userType" class="select" required>
                                    <option value="PASSENGER" >Passenger</option>
                                    <option value="AGENT" >Agent</option>
                                    <option value="ADMIN" >Admin</option>
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-outline" id="cancel-user-edit-btn">Cancel</button>
                                <button type="submit" class="btn btn-primary" id="save-user-btn">Save Changes</button>
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

            document.getElementById('user-id').value = button.dataset.userId;
            document.getElementById('first-name').value = button.dataset.firstName;
            document.getElementById('last-name').value = button.dataset.lastName;
            document.getElementById('email').value = button.dataset.email;
            document.getElementById('phone-number').value = button.dataset.phoneNumber;
            document.getElementById('user-type').value = button.dataset.userType;
        }

        const savedTab = localStorage.getItem('activeTab');
        if (savedTab) {
            updateActiveMenuItem(savedTab);
        }
        searchTable('users-table', 'search-users');

        // User edit modal event listeners
        const closeUserEditModalBtn = document.getElementById('close-user-edit-modal');
        const cancelUserEditBtn = document.getElementById('cancel-user-edit-btn');
        const saveUserBtn = document.getElementById('save-user-btn');

        closeUserEditModalBtn.addEventListener('click', () => closeModal('user-edit-modal'));
        cancelUserEditBtn.addEventListener('click', () => closeModal('user-edit-modal'));
        saveUserBtn.addEventListener('click', () => {
            closeModal('user-edit-modal');
        });

        const deleteUserbtn = document.querySelectorAll('.delete-btn');
        deleteUserbtn.forEach(deleteBtn =>{
            deleteBtn.addEventListener('click', (event)=>{
                event.preventDefault();
                const form = event.currentTarget.closest('form');
                showConfirmation('Are you sure you want to delete this user?', function() {
                    console.log("submitting form for delete")
                    form.submit();
                }, 'Delete');
            });
        })


        const editUserbtn = document.querySelectorAll('.edit-btn');
        editUserbtn.forEach(editBtn =>{
            editBtn.addEventListener('click', ()=>{
                populateForm(editBtn)
                openModal('user-edit-modal');
            });
        })
    });

</script>

</body>
</html>
