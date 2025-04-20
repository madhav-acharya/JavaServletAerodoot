package com.example.aerodoot.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Payment {
    private int paymentId;
    private String paymentMethod;  // ENUM: CREDIT_CARD, DEBIT_CARD, PAYPAL, BANK_TRANSFER
    private String paymentStatus;  // ENUM: PENDING, COMPLETED, FAILED, REFUNDED
    private Timestamp paymentDate;
    private BigDecimal paidAmount;
    private int bookingId;

    public Payment() {
        // Default constructor
    }

    public Payment(int paymentId, String paymentMethod, String paymentStatus,
                   Timestamp paymentDate, BigDecimal paidAmount, int bookingId) {
        this.paymentId = paymentId;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.paymentDate = paymentDate;
        this.paidAmount = paidAmount;
        this.bookingId = bookingId;
    }

    // Getters and setters
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Timestamp getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Timestamp paymentDate) {
        this.paymentDate = paymentDate;
    }

    public BigDecimal getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(BigDecimal paidAmount) {
        this.paidAmount = paidAmount;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }
}
