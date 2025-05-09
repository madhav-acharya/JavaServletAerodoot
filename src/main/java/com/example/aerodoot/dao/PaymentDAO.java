package com.example.aerodoot.dao;

import com.example.aerodoot.model.Booking;
import com.example.aerodoot.model.Payment;
import com.example.aerodoot.util.DbConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PaymentDAO {
    public static int makePayment(Payment payment) throws SQLException {
        String sql = "INSERT INTO Payment (paymentMethod, paymentStatus, paidAmount, bookingId) VALUES (?,?,?,?)";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, payment.getPaymentMethod());
            ps.setString(2, payment.getPaymentStatus());
            ps.setBigDecimal(3, payment.getPaidAmount());
            ps.setInt(4, payment.getBookingId());

            int rowsExecuted = ps.executeUpdate();
            if (rowsExecuted > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1); // Return generated paymentId
                }
            }
        } catch (SQLException e) {
            System.err.println("Error creating booking: " + e.getMessage());
        }
        return -1;
    }
}
