<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aerodoot - Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div class="container">
    <div class="left-panel">
        <div class="overlay-content">
            <h1>Welcome to Aerodoot</h1>
            <p>Access your account to book flights, manage reservations, and view your travel history with our secure airline booking platform.</p>
        </div>
    </div>
    <div class="right-panel">
        <div class="form-container">
            <div class="logo">
                <h1>Aerodoot <span class="tagline">| Your Sky Partner</span></h1>
            </div>

            <h2>Welcome back</h2>
            <p class="subtitle">Please enter your details to sign in</p>

            <% if (request.getAttribute("error") != null) { %>
            <div style="background-color: #ffe6e6; color: #cc0000; border: 1px solid #cc0000; padding: 12px 16px; border-radius: 8px; margin-bottom: 1rem; font-size: 15px; display: flex; align-items: center; gap: 10px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">
                <i class="fas fa-exclamation-circle" style="font-size: 18px; color: #cc0000;"></i>
                <%= request.getAttribute("error") %>
            </div>
            <% } %>


            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="form-group">
                    <label for="email" class="label">Email</label>
                    <div class="input-container">
                        <i class="fas fa-envelope"></i>
                        <input type="email" id="email" name="email" placeholder="Enter your email"
                               value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="label">Password</label>
                    <div class="input-container">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="password" placeholder="••••••••" required>
                        <i class="fas fa-eye toggle-password"></i>
                    </div>
                </div>

                <div class="form-options">
                    <div class="remember-me">
                        <input type="checkbox" id="remember" name="remember">
                        <label for="remember" >Remember me</label>
                    </div>
                    <a href="#" class="forgot-password">Forgot password?</a>
                </div>

                <button type="submit" class="login-btn">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>
            </form>

            <p class="register-link">Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a></p>
        </div>
    </div>
    <script>
        localStorage.setItem("activeTab", "overview");
        localStorage.setItem("popup", "closed");

        const togglePassword = document.querySelector('.toggle-password');
        const passwordInput = document.getElementById('password');

        togglePassword.addEventListener('click', function () {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });
    </script>
</div>
</body>
</html>