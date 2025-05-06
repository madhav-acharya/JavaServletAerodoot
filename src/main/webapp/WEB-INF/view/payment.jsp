<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Modal Overlay -->
<div id="paymentModal" class="modal-overlay">
    <div class="modal">
        <!-- Modal Header -->
        <div class="modal-header-payment">
            <h2 class="modal-title">Complete Your Booking</h2>
            <p class="modal-subtitle">Select a payment method to complete your booking for flight AD1234.</p>
            <button class="close-btn" id="closeModal"><i class="fas fa-times"></i></button>
        </div>

        <!-- Modal Body -->
        <div class="modal-body-payment">
            <!-- Flight Details -->
            <div class="section">
                <h3 class="section-title">Flight Details</h3>
                <div class="flight-detail-payment">
                    <p class="flight-route">JFK → LAX</p>
                </div>
                <div class="total-amount-payment">
                    <span>Total Amount:</span>
                    <span id="totalFareDisplay">$299</span>
                </div>
            </div>

            <!-- Class Selection -->
            <div class="section">
                <h3 class="section-title">Select Class</h3>
                <div class="radio-group" id="classOptions">
                    <label class="radio-option selected" data-value="economy">
                        <input type="radio" name="class" value="economy" checked>
                        <div class="payment-label">
                            <div class="payment-name">Economy Class</div>
                            <div class="class-price">NRs. 299 per passenger</div>
                        </div>
                    </label>

                    <label class="radio-option" data-value="business">
                        <input type="radio" name="class" value="business">
                        <div class="payment-label">
                            <div class="payment-name">Business Class</div>
                            <div class="class-price">NRs. 599 per passenger</div>
                        </div>
                    </label>
                </div>
            </div>

            <!-- Payment Method -->
            <div class="section">
                <h3 class="section-title">Select Payment Method</h3>
                <div class="radio-group" id="paymentOptions">
                    <label class="radio-option selected" data-value="eSewa">
                        <input type="radio" name="payment" value="eSewa" checked>
                        <div class="payment-icon esewa-icon">
                            <i class="fas fa-wallet"></i>
                        </div>
                        <div class="payment-label">
                            <div class="payment-name">eSewa</div>
                            <div class="payment-description">Pay with eSewa digital wallet</div>
                        </div>
                    </label>

                    <label class="radio-option" data-value="Khalti">
                        <input type="radio" name="payment" value="Khalti">
                        <div class="payment-icon khalti-icon">
                            <i class="fas fa-wallet"></i>
                        </div>
                        <div class="payment-label">
                            <div class="payment-name">Khalti</div>
                            <div class="payment-description">Pay with Khalti digital wallet</div>
                        </div>
                    </label>
                </div>
            </div>

            <!-- Payment Amount -->
            <div class="section">
                <h3 class="section-title">Enter Payment Amount (in NRs)</h3>
                <div class="form-group">
                    <input type="text" id="paymentAmount" class="form-input" placeholder="299">
                    <div id="errorMessage" class="error-message">
                        <i class="fas fa-exclamation-circle"></i>
                        <span>Amount must be exactly $299</span>
                    </div>
                    <p class="form-hint">Amount must match the flight price exactly.</p>
                </div>
            </div>
        </div>

        <!-- Modal Footer -->
        <div class="modal-footer-payment">
            <button id="cancelBtn" class="btn-payment btn-cancel">Cancel</button>
            <button id="payNowBtn" class="btn-payment btn-pay" disabled>Pay Now</button>
        </div>
    </div>
</div>
