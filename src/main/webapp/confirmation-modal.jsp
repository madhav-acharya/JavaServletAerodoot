<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 26/04/2025
  Time: 6:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Confirmation Modal -->
<div class="modal" id="confirmation-modal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Confirm Action</h3>
            <button class="modal-close" id="close-confirmation-modal">×</button>
        </div>
        <div class="modal-body">
            <p id="confirmation-message">Are you sure you want to delete this item?</p>
        </div>
        <div class="modal-footer">
            <button class="btn btn-outline" id="cancel-confirmation-btn">Cancel</button>
            <button class="btn btn-danger" id="confirm-action-btn">Delete</button>
        </div>
    </div>
</div>