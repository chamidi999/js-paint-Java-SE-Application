/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author user
 */
public class DBConnection {

    static Connection c;

    private static void setConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        c = DriverManager.getConnection("jdbc:mysql://localhost:3308/jspaints", "root", "");

    }

    public static void iud(String sql) throws Exception {
        if (c == null) {
            setConnection();
        }
        c.createStatement().executeUpdate(sql);
    }

    public static int iudReturnId(String sql) throws Exception {
        if (c == null) {
            setConnection();
        }
        int id = 0;
        Statement statement = c.createStatement();
        int lastInsertedID = statement.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
        ResultSet rs= statement.getGeneratedKeys();
            if (rs.next()) 
            {
              id = (int) rs.getLong(1);
            }   
        return id;
    }

    public static ResultSet search(String sql) throws Exception {
        if (c == null) {
            setConnection();
        }
        return c.createStatement().executeQuery(sql);
    }

    public static ResultSet searchWithBackword(String sql) throws Exception {
        if (c == null) {
            setConnection();
        }
        Statement statement = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        return statement.executeQuery(sql);
    }

    public static Connection getDB() throws Exception {
        if (c == null) {
            setConnection();
        }
        return c;
    }
}

