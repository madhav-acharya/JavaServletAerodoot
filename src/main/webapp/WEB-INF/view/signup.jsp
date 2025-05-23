<%--
  Created by IntelliJ IDEA.
  User: munal
  Date: 4/18/2025
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Aerodoot - Create Account</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/signup.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<jsp:include page="../../includes/toast.jsp" />
<div class="container">
  <div class="left-panel">
    <div class="overlay-content">
      <h1>Create Your Account</h1>
      <p>Join our airline booking platform for easy and convenient management of your flight bookings and travel plans in one secure place.</p>
    </div>
  </div>
  <div class="right-panel">
    <div class="form-container">
      <div class="logo">
        <h1>Aerodoot <span class="tagline">| Your Sky Partner</span></h1>
      </div>

      <h2>Create Account</h2>
      <p class="subtitle">Please fill in your information to register</p>

      <% if (request.getAttribute("errorMessage") != null) { %>
      <div class="error-message">
        <i class="fas fa-exclamation-circle"></i>
        <%= request.getAttribute("errorMessage") %>
      </div>
      <% } %>

      <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="form-row">
          <div class="form-group">
            <label for="fullname">Full Name</label>
            <div class="input-container">
              <i class="fas fa-user"></i>
              <input type="text" id="fullname" name="fullname"
                     value="<%= request.getAttribute("fullname") != null ? request.getAttribute("fullname") : "" %>"
                     placeholder="Enter your full name" required>
            </div>
          </div>

          <div class="form-group">
            <label for="phone">Phone Number</label>
            <div class="input-container">
              <i class="fas fa-phone"></i>
              <input type="tel" id="phone" name="phonenumber"
                     value="<%= request.getAttribute("phonenumber") != null ? request.getAttribute("phonenumber") : "" %>"
                     placeholder="Enter phone number" required>
            </div>
          </div>
        </div>

        <div class="form-group">
          <label for="email">Email Address</label>
          <div class="input-container">
            <i class="fas fa-envelope"></i>
            <input type="email" id="email" name="email"
                   value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                   placeholder="Enter your email" required>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label for="password">Password</label>
            <div class="input-container">
              <i class="fas fa-lock"></i>
              <input type="password" id="password" name="password" placeholder="Enter Strong Password" required>
              <i class="fas fa-eye toggle-password"></i>
            </div>
          </div>

          <div class="form-group">
            <label for="confirm-password">Confirm Password</label>
            <div class="input-container">
              <i class="fas fa-lock"></i>
              <input type="password" id="confirm-password" name="confirmpassword" placeholder="Re-enter Password" required>
              <i class="fas fa-eye toggle-password"></i>
            </div>
          </div>
        </div>

        <button type="submit" class="register-btn">
          <i class="fas fa-user-plus"></i> Create Account
        </button>
      </form>

      <p class="login-link">Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a></p>
    </div>
  </div>
</div>
<script>
  const togglePassword = document.querySelector('.toggle-password');
  const passwordInput = document.getElementById('password');

  togglePassword.addEventListener('click', function () {
    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordInput.setAttribute('type', type);
    this.classList.toggle('fa-eye-slash');
  });
</script>
</body>
</html>
