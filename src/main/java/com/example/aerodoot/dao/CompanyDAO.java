package com.example.aerodoot.dao;

import com.example.aerodoot.model.Company;
import com.example.aerodoot.util.DbConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CompanyDAO {
    public static int createCompany(Company company) {
        String sql = "INSERT INTO Company (companyName, companyEmail, companyAddress, contactNumber, website, registrationNumber) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DbConnectionUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, company.getCompanyName());
            ps.setString(2, company.getCompanyEmail());
            ps.setString(3, company.getCompanyAddress());
            ps.setString(4, company.getContactNumber());
            ps.setString(5, company.getWebsite());
            ps.setString(6, company.getRegistrationNumber());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }

    public static List<Company> getAllCompanies() {
        List<Company> companies = new ArrayList<>();
        String sql = "SELECT * FROM Company";

        try (Connection con = DbConnectionUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Company company = new Company(
                        rs.getInt("companyId"),
                        rs.getString("companyName"),
                        rs.getString("companyEmail"),
                        rs.getString("companyAddress"),
                        rs.getString("contactNumber"),
                        rs.getString("website"),
                        rs.getString("registrationNumber")
                );
                companies.add(company);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching companies: " + e.getMessage());
        }

        return companies;
    }
}
