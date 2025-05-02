package com.example.aerodoot.dao;

import com.example.aerodoot.model.User;
import com.example.aerodoot.util.DbConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {


    public static int createUser(User user) throws ClassNotFoundException, SQLException {
        String query = "INSERT INTO User (firstName, lastName, email, phoneNumber, userType, password) VALUES (?, ?, ?, ?, ?, ?)";

        try(Connection conn = DbConnectionUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getUserType());
            ps.setString(6, user.getPassword());

            int rowsExecuted = ps.executeUpdate();
            System.out.println(rowsExecuted);
            if (rowsExecuted > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if(rs.next()) {
                    return rs.getInt(1);
                }
            }
            return  -1;
        }
    }

    public static int getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM User WHERE email = ?";

        try(Connection conn = DbConnectionUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("userId");
            }
        }  catch (SQLException e) {
            System.err.println(e.getMessage());
        }

        return -1;
    }

    public static boolean changeUserType(int userId, String newUserType) {
        String sql = "UPDATE User SET userType = ? WHERE userId = ?";
        try(Connection conn = DbConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newUserType);
            ps.setInt(2, userId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("Error Updating User type "+e.getMessage());
            return false;
        }
    }

    public static User getUserByEmailOnly(String email) throws SQLException {
        String sql = "SELECT * FROM User WHERE email = ?";
        try(Connection conn = DbConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setUserType(rs.getString("userType"));
                return user;
            }
        }
        catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public static User getUserByUserIdOnly(int userId) throws SQLException {
        String sql = "SELECT * FROM User WHERE userId = ?";

        try(Connection conn = DbConnectionUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setPassword(rs.getString("password"));
                user.setUserType(rs.getString("userType"));
                return user;
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public static List<User> getAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM User";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setPassword(rs.getString("password"));
                user.setUserType(rs.getString("userType"));
                user.setCreatedAt(rs.getTimestamp("createdAt"));
                users.add(user);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching all users: " + e.getMessage());
        }
        return users;
    }

    public static User getUserById(int userId) throws SQLException {
        User user = null;
        String sql = "SELECT * FROM User WHERE userId = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setUserId(rs.getInt("userId"));
                    user.setFirstName(rs.getString("firstName"));
                    user.setLastName(rs.getString("lastName"));
                    user.setEmail(rs.getString("email"));
                    user.setPhoneNumber(rs.getString("phoneNumber"));
                    user.setUserType(rs.getString("userType"));
                    user.setCreatedAt(rs.getTimestamp("createdAt"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching user by ID: " + e.getMessage());
        }
        return user;
    }

    public static int updateUser(User user) throws SQLException {
        String sql = "UPDATE User SET firstName = ?, lastName = ?, email = ?, phoneNumber = ?, userType = ? WHERE userId = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setString(1, user.getFirstName());
                ps.setString(2, user.getLastName());
                ps.setString(3, user.getEmail());
                ps.setString(4, user.getPhoneNumber());
                ps.setString(5, user.getUserType());
                ps.setInt(6, user.getUserId());

//            int rowsAffected = ps.executeUpdate();
//            return rowsAffected > 0;
              ResultSet rs = ps.executeQuery();
              if (rs.next()) {
                  return rs.getInt("userId");
              }
        } catch (SQLException e) {
            System.err.println("Error updating user: " + e.getMessage());
        }
        return -1;
    }

    public static boolean deleteUser(int userId) {
        String sql = "DELETE FROM User WHERE userId = ?";

        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            int rowsAffected = ps.executeUpdate();
            System.out.println("user deleted");
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("Error deleting user: " + e.getMessage());
            return false;
        }
    }


}

