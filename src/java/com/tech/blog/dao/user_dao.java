package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;


public class user_dao {
    
    public Connection con;

    public user_dao(Connection con) {
        this.con = con;
    }
    
    //method to insert data to database
    public boolean Save_User(User user){
        boolean f=false;
       try{
           String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
           PreparedStatement prmt=this.con.prepareStatement(query);
           prmt.setString(1,user.getName());
           prmt.setString(2,user.getEmail());
           prmt.setString(3,user.getPassword());
           prmt.setString(4,user.getGender());
           prmt.setString(5,user.getAbout());
           
           prmt.executeUpdate();
           f=true;
       }
       catch(Exception e){
           e.printStackTrace();
       }
        
        return f;
       }
   
    public User getUserByEmailAndPassword(String email,String password){
        User user=null;
        try{
            String query="select * from user where email=? and password=?";
            PreparedStatement psmt=con.prepareStatement(query);
            psmt.setString(1, email);
            psmt.setString(2, password);
            
            ResultSet set=psmt.executeQuery();
            if(set.next()){
                user=new User();
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setAbout(set.getString("about"));
                user.setGender(set.getString("gender"));
                user.setDatetime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean updateUser(User user){
        boolean f=false;
        try{
            String query="update user set name=?, email=?, password=?, gender=?, about=?, profile=? where id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPassword());
            ps.setString(4,user.getGender());
            ps.setString(5,user.getAbout());
            ps.setString(6,user.getProfile());
            ps.setInt(7,user.getId());
            ps.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByUserId(int userid){
        User user=null;
        try{
            String query="select * from user where id=?";
            PreparedStatement st=this.con.prepareStatement(query);
            st.setInt(1, userid);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                int id=rs.getInt("id");
                String name=rs.getString("name");
                String email=rs.getString("email");
                String password=rs.getString("password");
                String gender=rs.getString("gender");
                String about=rs.getString("about");
                Timestamp rdate=rs.getTimestamp("rdate");
                String profile=rs.getString("profile");
                user=new User(id,name,email,password,gender,about,rdate,profile);
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
}
