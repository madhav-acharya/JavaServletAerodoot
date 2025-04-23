<%@ page import="com.example.aerodoot.model.Company" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 20/04/2025
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/agentRegistration.css">
</head>
<body>
<div class="container">
    <div class="form-header">
        <h1><i class="fas fa-id-card"></i> Agent Registration</h1>
        <p>Please fill in your details to complete registration</p>
    </div>
    <% if (request.getAttribute("error") != null) { %>
    <div style="background-color: #ffe6e6; color: #cc0000; border: 1px solid #cc0000; padding: 12px 16px; border-radius: 8px; margin-bottom: 1rem; font-size: 15px; display: flex; align-items: center; gap: 10px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">
        <i class="fas fa-exclamation-circle" style="font-size: 18px; color: #cc0000;"></i>
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <form action="register-agent" method="post" enctype="multipart/form-data" id="agentForm">
        <div class="form-section profile-section">
            <div class="profile-picture-container">
                <div class="profile-picture" id="profile-preview">
                    <i id="profile-icon" class="fas fa-user-tie" style="font-size: 50px; color: #999;"></i>
                    <img id="profile-previews" alt="Profile" style="display: none; width: 100%; height: 100%; object-fit: cover;" />
                </div>
                <div class="upload-btn-wrapper">
                    <button class="upload-btn"><i class="fas fa-camera"></i> Select Photo</button>
                    <input type="file" name="profilePicture" id="profile-upload" accept="image/*" />
                </div>
            </div>
        </div>

        <div class="form-section">
            <div class="form-group">
                <label for="position">
                    <i class="fas fa-briefcase"></i> Position
                </label>
                <input type="text" id="position" name="position" placeholder="e.g. Travel Consultant, Sales Manager" required>
            </div>
        </div>

        <div class="form-section">
            <div class="form-group">
                <label for="licenseNumber">
                    <i class="fas fa-certificate"></i> License Number
                </label>
                <input type="text" id="licenseNumber" name="licenseNumber" placeholder="Enter your professional license number" required>
            </div>
        </div>

        <div class="form-section">
            <div class="form-group">
                <label for="companyId">
                    <i class="fas fa-building"></i> Company
                </label>
                <div class="select-wrapper">
                    <select id="companyId" name="companyId" required>
                        <option value="" disabled selected>Select your company</option>
                        <c:if test="${not empty companies}">
                            <c:forEach var="company" items="${companies}">
                                <option name="companyId" value="${company.companyId}">${company.companyName}</option>
                            </c:forEach>
                        </c:if>
                        <option value="new">+ Register a new company</option>
                    </select>
                    <i class="fas fa-chevron-down"></i>
                </div>
            </div>
        </div>

        <div class="form-section button-section">
            <button type="submit" class="submit-btn">
                <i class="fas fa-check-circle"></i> Register
            </button>
            <button type="reset" class="reset-btn">
                <i class="fas fa-undo"></i> Reset
            </button>
        </div>
    </form>
</div>

<!-- Modal for company registration -->
<div  id="companyModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2><i class="fas fa-building"></i> Register New Company</h2>
            <span class="close">&times;</span>
        </div>
        <form action="${pageContext.request.contextPath}/register-company" method="POST" id="companyForm">
            <div class="form-group">
                <label for="companyName">
                    <i class="fas fa-signature"></i> Company Name
                </label>
                <input type="text" id="companyName" name="companyName" required>
            </div>

            <div class="form-group">
                <label for="companyEmail">
                    <i class="fas fa-envelope"></i> Company Email
                </label>
                <input type="email" id="companyEmail" name="companyEmail" required>
            </div>

            <div class="form-group">
                <label for="companyAddress">
                    <i class="fas fa-map-marker-alt"></i> Company Address
                </label>
                <textarea id="companyAddress" name="companyAddress" rows="3" required></textarea>
            </div>

            <div class="form-group">
                <label for="contactNumber">
                    <i class="fas fa-phone"></i> Contact Number
                </label>
                <input type="tel" id="contactNumber" name="contactNumber" required>
            </div>

            <div class="form-group">
                <label for="website">
                    <i class="fas fa-globe"></i> Website
                </label>
                <input type="url" id="website" name="website" placeholder="https://www.example.com">
            </div>

            <div class="form-group">
                <label for="registrationNumber">
                    <i class="fas fa-fingerprint"></i> Registration Number
                </label>
                <input type="text" id="registrationNumber" name="registrationNumber" required>
            </div>

            <div class="modal-footer">
                <button type="button" class="cancel-btn">Cancel</button>
                <button type="submit" class="add-company-btn">Register Company</button>
            </div>
        </form>
    </div>
</div>
<script>

    document.getElementById('profile-upload').addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file && file.type.startsWith('image/')) {
            const reader = new FileReader();
            reader.onload = function(event) {
                const img = document.getElementById('profile-previews');
                const icon = document.getElementById('profile-icon');

                img.src = event.target.result;
                img.style.display = 'block';
                icon.style.display = 'none'; // hide icon when image is shown
            };
            reader.readAsDataURL(file);
        } else {
            alert("Please upload a valid image file.");
        }
    });


    // Company modal handling
    const modal = document.getElementById('companyModal');
    const companySelect = document.getElementById('companyId');
    const closeBtn = document.querySelector('.close');
    const cancelBtn = document.querySelector('.cancel-btn');

    companySelect.addEventListener('change', function() {
        if (this.value === 'new') {
            modal.style.display = 'block';
        }
    });

    closeBtn.addEventListener('click', function() {
        modal.style.display = 'none';
        // Reset company select to first option
        companySelect.selectedIndex = 0;
    });

    cancelBtn.addEventListener('click', function() {
        modal.style.display = 'none';
        // Reset company select to first option
        companySelect.selectedIndex = 0;
    });

    window.addEventListener('click', function(event) {
        if (event.target === modal) {
            modal.style.display = 'none';
            // Reset company select to first option
            companySelect.selectedIndex = 0;
        }
    });
</script>
</body>
</html>
