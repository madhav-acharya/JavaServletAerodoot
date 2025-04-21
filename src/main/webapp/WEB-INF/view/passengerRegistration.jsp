<%--
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/passengerRegistration.css">
</head>
<body>
<div class="container">
    <div class="form-header">
        <h1><i class="fas fa-user-plus"></i> Passenger Registration</h1>
        <p>Please fill in your details to complete registration</p>
    </div>

    <form action="register-passenger" method="post" enctype="multipart/form-data">
        <div class="form-section profile-section">
            <div class="profile-picture-container">
                <div class="profile-picture" id="profile-preview">
                    <i class="fas fa-user"></i>
                </div>
                <div class="upload-btn-wrapper">
                    <button class="upload-btn"><i class="fas fa-camera"></i> Select Photo</button>
                    <input type="file" name="profilePicture" id="profile-upload" accept="image/*" />
                </div>
            </div>
        </div>

        <div class="form-section">
            <div class="form-group">
                <label for="passportNumber">
                    <i class="fas fa-passport"></i> Passport Number
                </label>
                <input type="text" id="passportNumber" name="passportNumber" required>
            </div>
        </div>

        <div class="form-section">
            <div class="form-group">
                <label for="dateOfBirth">
                    <i class="fas fa-calendar-alt"></i> Date of Birth
                </label>
                <input type="date" id="dateOfBirth" name="dateOfBirth" required>
            </div>
        </div>

        <div class="form-section">
            <div class="form-group">
                <label class="label-with-icon">
                    <i class="fas fa-venus-mars"></i> Gender
                </label>
                <div class="radio-group">
                    <div class="radio-option">
                        <input type="radio" id="male" name="gender" value="MALE" required>
                        <label for="male"><i class="fas fa-male"></i> Male</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="female" name="gender" value="FEMALE">
                        <label for="female"><i class="fas fa-female"></i> Female</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="other" name="gender" value="OTHER">
                        <label for="other"><i class="fas fa-user"></i> Other</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-section">
            <div class="form-group">
                <label for="address">
                    <i class="fas fa-home"></i> Address
                </label>
                <textarea id="address" name="address" rows="3" required></textarea>
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

<script>
    document.getElementById('profile-upload').addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(event) {
                const preview = document.getElementById('profile-preview');
                preview.innerHTML = '';
                preview.style.backgroundImage = `url(${event.target.result})`;
            };
            reader.readAsDataURL(file);
        }
    });
</script>
</body>
</html>
