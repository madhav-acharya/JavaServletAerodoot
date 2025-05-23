package com.example.aerodoot.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DbConnectionUtil {
    private static String url;
    private static String user;
    private static String password;

    static {
        try(InputStream in = DbConnectionUtil.class.getClassLoader().getResourceAsStream("db.properties")) {
            Properties prop = new Properties();
            prop.load(in);
            Class.forName(prop.getProperty("db.driver"));
            url = prop.getProperty("db.url");
            user = prop.getProperty("db.user");
            password = prop.getProperty("db.password");
        }
        catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }
}
