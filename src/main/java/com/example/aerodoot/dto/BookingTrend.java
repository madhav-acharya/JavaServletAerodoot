package com.example.aerodoot.dto;

public class BookingTrend {
    private String date;
    private int count;

    public BookingTrend(String date, int count) {
        this.date = date;
        this.count = count;
    }

    public String getDate() {
        return date;
    }

    public int getCount() {
        return count;
    }
}
