package com.tech.blog.helper;
import java.sql.*;

public class ConnectionProvider {
    public static Connection conn;
    public static Connection getConnection(){
        try{
        if(conn==null){
            //create driver
            Class.forName("com.mysql.jdbc.Driver");

            //CREATE CONNECTION
            conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/TechBlog","root","");
        }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return conn;
    }
}
