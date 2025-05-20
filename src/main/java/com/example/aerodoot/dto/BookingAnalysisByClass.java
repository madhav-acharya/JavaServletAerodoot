package com.example.aerodoot.dto;

public class BookingAnalysisByClass {
    private String classType;
    private int bookingCount;
    private int month;

    public BookingAnalysisByClass(String classType, int bookingCount, int month) {
        this.classType = classType;
        this.bookingCount = bookingCount;
        this.month = month;
    }

    public String getClassType() {
        return classType;
    }

    public int getBookingCount() {
        return bookingCount;
    }
    public int getMonth() {
        return month;
    }
}
