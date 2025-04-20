package com.example.aerodoot.dao;

import com.example.aerodoot.model.Agent;
import com.example.aerodoot.util.DbConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AgentDAO {
    public static int createAgent(Agent agent) {
        String sql = "INSERT INTO Agent (position, licenseNumber, profilePicture, companyId, userId) VALUES(?,?,?,?,?)";
        try(Connection con = DbConnectionUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)
        )
        {
            ps.setString(1, agent.getPosition());
            ps.setString(2, agent.getLicenseNumber());
            ps.setBytes(3, agent.getProfilePicture());
            ps.setInt(4, agent.getCompanyId());
            ps.setInt(5, agent.getUserId());

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
        }
        catch (SQLException e)
        {
            System.err.println("Error creating agent: " + e.getMessage());
        }
        return -1;
    }
}
