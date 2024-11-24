package org.example.hisnet2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
    private static Connection conn = null;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (conn == null || conn.isClosed()) {
            Class.forName("org.mariadb.jdbc.Driver");
            String dbUser = "OSS24_22100062";
            String dbPassword = "aiFebu6u";
            conn = DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/OSS24_22100062", dbUser, dbPassword);
        }
        return conn;
    }

    public static void close() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace(); // 예외 처리
            }
        }
    }

}
