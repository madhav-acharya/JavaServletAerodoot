<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 26/04/2025
  Time: 6:53 PM
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
          <button class="tab-button active">Settings</button>
        </div>
      </div>

      <div class="settings-section">
        <h2 class="settings-section-title">General Settings</h2>

        <div class="card settings-card">
          <div class="card-content">
            <div class="settings-option">
              <div>
                <h3 class="settings-option-label">Dark Mode</h3>
                <p class="settings-option-description">Enable dark mode for the dashboard</p>
              </div>
              <label class="toggle-switch">
                <input type="checkbox" id="dark-mode-toggle">
                <span class="toggle-slider"></span>
              </label>
            </div>

            <div class="settings-option">
              <div>
                <h3 class="settings-option-label">Compact View</h3>
                <p class="settings-option-description">Use compact spacing for tables and cards</p>
              </div>
              <label class="toggle-switch">
                <input type="checkbox" id="compact-view-toggle">
                <span class="toggle-slider"></span>
              </label>
            </div>

            <div class="settings-option">
              <div>
                <h3 class="settings-option-label">Auto Refresh</h3>
                <p class="settings-option-description">Automatically refresh data every 5 minutes</p>
              </div>
              <label class="toggle-switch">
                <input type="checkbox" id="auto-refresh-toggle" checked>
                <span class="toggle-slider"></span>
              </label>
            </div>
          </div>
        </div>
      </div>

      <div class="settings-section">
        <h2 class="settings-section-title">Notification Settings</h2>

        <div class="card settings-card">
          <div class="card-content">
            <div class="settings-option">
              <div>
                <h3 class="settings-option-label">Email Notifications</h3>
                <p class="settings-option-description">Receive email notifications for important events</p>
              </div>
              <label class="toggle-switch">
                <input type="checkbox" id="email-notifications-toggle" checked>
                <span class="toggle-slider"></span>
              </label>
            </div>

            <div class="settings-option">
              <div>
                <h3 class="settings-option-label">Desktop Notifications</h3>
                <p class="settings-option-description">Show desktop notifications for alerts</p>
              </div>
              <label class="toggle-switch">
                <input type="checkbox" id="desktop-notifications-toggle">
                <span class="toggle-slider"></span>
              </label>
            </div>

            <div class="settings-option">
              <div>
                <h3 class="settings-option-label">Flight Delay Alerts</h3>
                <p class="settings-option-description">Get notified when flights are delayed</p>
              </div>
              <label class="toggle-switch">
                <input type="checkbox" id="flight-delay-alerts-toggle" checked>
                <span class="toggle-slider"></span>
              </label>
            </div>
          </div>
        </div>
      </div>

      <div class="settings-section">
        <h2 class="settings-section-title">Data Export Settings</h2>

        <div class="card settings-card">
          <div class="card-content">
            <div class="settings-option">
              <div>
                <h3 class="settings-option-label">Default Export Format</h3>
                <p class="settings-option-description">Choose the default format for data exports</p>
              </div>
              <select class="select" id="export-format-select" style="width: auto;">
                <option value="csv">CSV</option>
                <option value="excel">Excel</option>
                <option value="pdf">PDF</option>
                <option value="json">JSON</option>
              </select>
            </div>

            <div class="settings-option">
              <div>
                <h3 class="settings-option-label">Include Headers</h3>
                <p class="settings-option-description">Include column headers in exported data</p>
              </div>
              <label class="toggle-switch">
                <input type="checkbox" id="include-headers-toggle" checked>
                <span class="toggle-slider"></span>
              </label>
            </div>

            <div class="settings-option">
              <div>
                <h3 class="settings-option-label">Scheduled Reports</h3>
                <p class="settings-option-description">Automatically generate and send reports</p>
              </div>
              <label class="toggle-switch">
                <input type="checkbox" id="scheduled-reports-toggle">
                <span class="toggle-slider"></span>
              </label>
            </div>
          </div>
        </div>
      </div>

      <div class="settings-section">
        <h2 class="settings-section-title">Account Settings</h2>

        <div class="card settings-card">
          <div class="card-content">
            <div class="form-group">
              <label for="user-name">Name</label>
              <input type="text" id="user-name" class="input" value="${sessionScope.user.firstName} ${sessionScope.user.lastName}">
            </div>

            <div class="form-group">
              <label for="user-email">Email</label>
              <input type="email" id="user-email" class="input" value="${sessionScope.user.email}">
            </div>

            <div class="form-group">
              <button class="btn btn-primary" id="save-account-settings-btn">Save Changes</button>
            </div>
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
    // Dark mode toggle
    const darkModeToggle = document.getElementById('dark-mode-toggle');

    // Check if dark mode is enabled in system
    if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
      darkModeToggle.checked = true;
    }

    darkModeToggle.addEventListener('change', function() {
      if (this.checked) {
        document.documentElement.classList.add('dark-mode');
        alert('Dark mode enabled');
      } else {
        document.documentElement.classList.remove('dark-mode');
        alert('Dark mode disabled');
      }
    });

    // Compact view toggle
    const compactViewToggle = document.getElementById('compact-view-toggle');

    compactViewToggle.addEventListener('change', function() {
      if (this.checked) {
        document.documentElement.classList.add('compact-view');
        alert('Compact view enabled');
      } else {
        document.documentElement.classList.remove('compact-view');
        alert('Compact view disabled');
      }
    });

    // Auto refresh toggle
    const autoRefreshToggle = document.getElementById('auto-refresh-toggle');
    let autoRefreshInterval;

    function startAutoRefresh() {
      autoRefreshInterval = setInterval(() => {
        console.log('Auto refreshing data...');
        // In a real application, this would refresh the data
      }, 5 * 60 * 1000); // 5 minutes
    }

    function stopAutoRefresh() {
      clearInterval(autoRefreshInterval);
    }

    autoRefreshToggle.addEventListener('change', function() {
      if (this.checked) {
        startAutoRefresh();
        alert('Auto refresh enabled');
      } else {
        stopAutoRefresh();
        alert('Auto refresh disabled');
      }
    });

    // Initialize auto refresh if enabled
    if (autoRefreshToggle.checked) {
      startAutoRefresh();
    }

    // Save account settings
    document.getElementById('save-account-settings-btn').addEventListener('click', function() {
      const userName = document.getElementById('user-name').value;
      const userEmail = document.getElementById('user-email').value;
      const userPassword = document.getElementById('user-password').value;

      // In a real application, this would save the settings to the server
      alert(`Account settings saved:\nName: ${userName}\nEmail: ${userEmail}\nPassword: ${userPassword}`);
    });
  });
</script>
</body>
</html>

