package com.example.aerodoot.service;

import com.example.aerodoot.dao.UserDAO;
import com.example.aerodoot.model.User;
import com.example.aerodoot.util.PasswordHashUtil;

import java.sql.SQLException;
import java.util.Arrays;

public class AuthService {

    public static int createUser(String fullname, String email, String phonenumber, String password, String confirmpassword) throws  ClassNotFoundException, SQLException {
        /// Notes on Error Codes:
        /// -1 : Missing or invalid input
        /// -2 : Email already exists
        /// -3 : Passwords do not match
        /// -5 : Invalid phone number format
        /// -6 : Invalid email format
        /// -7 : Weak password (must contain at least one letter and one number)
        /// -8 : Invalid name characters (firstname/lastname must be alphabets only)

        // Check for empty or null fields
        if (fullname == null || fullname.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                phonenumber == null || phonenumber.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                confirmpassword == null || confirmpassword.trim().isEmpty()) {
            return -1; // Missing required fields
        }

        // Split fullname into firstname and lastname
        String firstname = "";
        String lastname = "";

        String[] parts = fullname.trim().split("\\s+");
        if (parts.length >= 2) {
            firstname = parts[0];
            lastname = String.join(" ", Arrays.copyOfRange(parts, 1, parts.length));
        } else if (parts.length == 1) {
            return -9; // Only one name provided
        }

        // Validate names (only alphabets)
        if (!firstname.matches("^[A-Za-z]+$") || !lastname.matches("^[A-Za-z ]+$")) {
            return -8; // Invalid name format
        }

        // Validate phone number format
        if (!phonenumber.matches("^\\+?\\d{7,15}$")) {
            return -5; // Invalid phone number
        }

        // Validate email format
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            return -6; // Invalid email format
        }

        // Validate password (must include letter and number)
        if (!password.matches("^(?=.*[A-Za-z])(?=.*\\d).+$")) {
            return -7; // Weak password
        }

        // Check if email already exists call method from UserDAO
        if (UserDAO.getUserByEmail(email) != -1) {
            return -2; // Email already registered
        }

        // Confirm passwords match
        if (!password.equals(confirmpassword)) {
            return -3; // Passwords do not match
        }

        // Hash the password
        String hashedPassword = PasswordHashUtil.hashPassword(password);

        User user = new User();
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setEmail(email);
        user.setPhoneNumber(phonenumber);
        user.setPassword(hashedPassword);
        user.setUserType("PASSENGER");

        return UserDAO.createUser(user);
    }

    public static String getErrorMessage(int errorCode) {
        return switch (errorCode) {
            case -1 -> "Missing required fields or invalid input!";
            case -2 -> "Email already registered!";
            case -3 -> "Passwords do not match!";
            case -5 -> "Invalid phone number format!";
            case -6 -> "Invalid email format!";
            case -7 -> "Password must contain at least one letter and one number!";
            case -8 -> "Firstname or Lastname can only contain alphabets!";
            case -9 -> "Provide both Firstname and Lastname";
            default -> "An unknown error occurred.";
        };
    }

    //---login purpose method---
    public static User validateUser(String email, String password) throws SQLException {
        // Get the user by email (will need to modify UserDAO to get user by email only)
        User user = UserDAO.getUserByEmailOnly(email);


        // If user exists and password matches the stored hash
        if (user != null && PasswordHashUtil.verifyPassword(password, user.getPassword())) {
            System.out.println(user.getEmail());
            return user;
        }
        return null;
    }

    public static int updateUserData(String fullName,String email,String phoneNumber, int userId) throws SQLException {
        // Split fullname into firstname and lastname
        String firstname = "";
        String lastname = "";

        String[] parts = fullName.trim().split("\\s+");
        if (parts.length >= 2) {
            firstname = parts[0];
            lastname = String.join(" ", Arrays.copyOfRange(parts, 1, parts.length));
        } else if (parts.length == 1) {
            return -9; // Only one name provided
        }

        // Validate names (only alphabets)
        if (!firstname.matches("^[A-Za-z]+$") || !lastname.matches("^[A-Za-z ]+$")) {
            return -8; // Invalid name format
        }

        // Validate phone number format
        if (!phoneNumber.matches("^\\+?\\d{7,15}$")) {
            return -5; // Invalid phone number
        }

        // Validate email format
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            return -6; // Invalid email format
        }

        User initialUser = UserDAO.getUserByUserIdOnly(userId);
        String userType = initialUser.getUserType();
        System.out.println("User Type in UserSerive " + userType);

        // Check if email already exists call method from UserDAO
        if (!initialUser.getEmail().equals(email)) {
            if (UserDAO.getUserByEmail(email) != -1) {
                return -2; // Email already registered
            }
        }


        User user = new User();
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setUserType(userType);
        user.setUserId(userId);

        return UserDAO.updateUser(user);
    }
}
