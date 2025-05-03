<%@ page import="com.example.aerodoot.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                            <form id="edit-form" method="post" action="${pageContext.request.contextPath}/admin/manage-user">
                                                <input type="hidden"  name="userId" value="${user.userId}">
                                                <input type="hidden"  name="action" value="edit">
                                            <button class="action-btn edit-btn" title="Edit" data-user-id="${user.userId}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                                </svg>
                                            </button>
                                            </form>
                                            <form method="post" action="${pageContext.request.contextPath}/admin/manage-user">
                                            <button class="action-btn delete-btn" title="Delete" data-user-id="${user.userId}">
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
                        <h3 class="modal-title">Edit Users</h3>
                        <button class="modal-close" id="close-user-edit-modal">×</button>
                    </div>
                    <div class="modal-body">
                    <c:if test="${not empty editUser}">
                        <form id="user-edit-form" method="post" action="${pageContext.request.contextPath}/admin/manage-user">
                            <input type="hidden" id="user-action" name="action" value="update">
                            <input type="hidden"  name="userId" value="${editUser.userId}">
                            <div class="form-group">
                                <label for="first-name">First Name</label>
                                <input type="text" id="first-name" name="firstName" class="input" required value="${editUser.firstName}">
                            </div>

                            <div class="form-group">
                                <label for="last-name">Last Name</label>
                                <input type="text" id="last-name" name="lastName" class="input" required value="${editUser.lastName}">
                            </div>

                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" class="input" required value="${editUser.email}">
                            </div>

                            <div class="form-group">
                                <label for="phone-number">Phone Number</label>
                                <input type="tel" id="phone-number" name="phoneNumber" class="input" value="${editUser.phoneNumber}">
                            </div>

                            <div class="form-group">
                                <label for="user-type">User Types</label>
                                <select id="user-type" name="userType" class="select" required>
                                    <option value="PASSENGER" ${editUser.userType == 'PASSENGER' ? 'selected' : ''}>Passenger</option>
                                    <option value="AGENT" ${editUser.userType == 'AGENT' ? 'selected' : ''}>Agent</option>
                                    <option value="ADMIN" ${editUser.userType == 'ADMIN' ? 'selected' : ''}>Admin</option>
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-outline" id="cancel-user-edit-btn">Cancel</button>
                                <button type="submit" class="btn btn-primary" id="save-user-btn">Save Changes</button>
                            </div>
                        </form>
                    </c:if>
                    </div>

                </div>
            </div>
        </div>
    </main>
</div>
<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
<script>

    document.addEventListener('DOMContentLoaded', function() {
        if (localStorage.getItem("popup") == "opened")
            {
                openModal('user-edit-modal');
            }
        const savedTab = localStorage.getItem('activeTab');
        if (savedTab) {
            updateActiveMenuItem(savedTab);
        }
        searchTable('users-table', 'search-users');

        // Setup user type filter
        setupTableFilter('users-table', 'user-type-filter', 5);

        // Setup date range filter
        setupDateRangeFilter('users-table', 'user-start-date', 'user-end-date', 6);

        // User edit modal event listeners
        const closeUserEditModalBtn = document.getElementById('close-user-edit-modal');
        const cancelUserEditBtn = document.getElementById('cancel-user-edit-btn');
        const saveUserBtn = document.getElementById('save-user-btn');
        const editUserForm = document.getElementById('user-edit-form')
        const editForms = document.querySelectorAll('#edit-form')

        // editForms.forEach(editForm =>{
        //     editForm.addEventListener('submit', async (e)=>{
        //         console.log("default prevented of edit")
        //         e.preventDefault();
        //         const form = e.target;
        //         const formData = new FormData(form);
        //         console.log("form", form)
        //         console.log("formdata", formData)
        //         console.log("form action", form.action)
        //
        //         try {
        //             const response = await fetch(form.action, {
        //                 method: 'POST',
        //                 body: formData
        //             });
        //
        //             const text = await response.text();
        //             console.log("text", text)
        //             // document.getElementById('response').innerHTML = text;
        //         } catch (error) {
        //             console.error('Error:', error);
        //         }
        //     })
        // })



        // editUserForm.addEventListener('submit', async (e)=>{
        //     console.log("default prevented")
        //     e.preventDefault();
        // })

        closeUserEditModalBtn.addEventListener('click', () => closeModal('user-edit-modal'));
        cancelUserEditBtn.addEventListener('click', () => closeModal('user-edit-modal'));

        const editUserbtn = document.querySelectorAll('.edit-btn');
        editUserbtn.forEach(editBtn =>{
            editBtn.addEventListener('click', ()=>{
                localStorage.setItem("popup", "opened")
            });
        })

        saveUserBtn.addEventListener('click', () => {
                closeModal('user-edit-modal');
        });
    });
</script>

</body>
</html>
