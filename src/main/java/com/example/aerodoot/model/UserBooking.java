package com.example.aerodoot.model;

public class UserBooking {
    private int bookingId;
    private int userId;

    public UserBooking() {
        // Default constructor
    }

    public UserBooking(int bookingId, int userId) {
        this.bookingId = bookingId;
        this.userId = userId;
    }

    // Getters and setters
    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
