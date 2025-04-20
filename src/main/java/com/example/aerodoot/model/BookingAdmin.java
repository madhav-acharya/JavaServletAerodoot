package com.example.aerodoot.model;

public class BookingAdmin {
    private int adminId;
    private int bookingId;

    public BookingAdmin() {
        // Default constructor
    }

    public BookingAdmin(int adminId, int bookingId) {
        this.adminId = adminId;
        this.bookingId = bookingId;
    }

    // Getters and setters
    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }
}
