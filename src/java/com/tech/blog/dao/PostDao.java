/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import java.sql.*;
import java.io.*;
import java.util.List;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.util.List;
import java.util.ArrayList;

public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list=new ArrayList<>();
        try{
            String query="select * from categories";
//            PreparedStatement ps=this.con.prepareStatement(query);
//            ResultSet rs=ps.executeQuery();
              Statement st=this.con.createStatement();
              ResultSet rs=st.executeQuery(query);
            while(rs.next()){
                int cid=rs.getInt("cid");
                String name=rs.getString("name");
                String description=rs.getString("description");
                String symbol=rs.getString("symbol");
                Category c=new Category(cid,name,description,symbol);
                list.add(c);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
       
     return list;
        
    }
    
    public boolean savePost(Post p){
        boolean f=false;
        try{
            String query="insert into posts(ptitle,pcontent,pcode,ppic,pdate,catid,userid) values(?,?,?,?,?,?,?)";
            PreparedStatement ps=this.con.prepareStatement(query);
            ps.setString(1, p.getPtitle());
            ps.setString(2, p.getPcontent());
            ps.setString(3, p.getPcode());
            ps.setString(4, p.getPpic());
            ps.setTimestamp(5, p.getPdate());
            ps.setInt(6, p.getCatid());
            ps.setInt(7, p.getUserid());
            ps.executeUpdate();
            f=true;
            
            
        }
        catch(Exception e){
            e.printStackTrace();
           
        }
        return f;
    }
    
    public List<Post> getAllPosts(){
        List<Post> list=new ArrayList<>();
        try{
            PreparedStatement ps=this.con.prepareStatement("select * from posts order by pid desc");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                int pid=rs.getInt("pid");
                String ptitle=rs.getString("ptitle");
                String pcontent =rs.getString("pcontent");
                String pcode=rs.getString("pcode");
                String ppic =rs.getString("ppic");
                Timestamp pdate=rs.getTimestamp("pdate");
                int catid=rs.getInt("catid");
                int userid=rs.getInt("userid");
                Post p=new Post(pid,ptitle,pcontent,pcode,ppic,pdate,catid,userid);
                list.add(p);
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    public List<Post> getPostById(int catid){
       List<Post> list=new ArrayList<>();
       try{
            PreparedStatement ps=this.con.prepareStatement("select * from posts where catid=?");
            ps.setInt(1, catid);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                int pid=rs.getInt("pid");
                String ptitle=rs.getString("ptitle");
                String pcontent =rs.getString("pcontent");
                String pcode=rs.getString("pcode");
                String ppic =rs.getString("ppic");
                Timestamp pdate=rs.getTimestamp("pdate");
               
                int userid=rs.getInt("userid");
                Post p=new Post(pid,ptitle,pcontent,pcode,ppic,pdate,catid,userid);
                list.add(p);
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
        
        
    }

    
    public Post getPostByPid(int postid){
       Post p=null;
       try{
            PreparedStatement ps=this.con.prepareStatement("select * from posts where pid=?");
            ps.setInt(1, postid);
            ResultSet rs=ps.executeQuery();
                
            if(rs.next()){
                int pid=rs.getInt("pid");
                String ptitle=rs.getString("ptitle");
                String pcontent =rs.getString("pcontent");
                String pcode=rs.getString("pcode");
                String ppic =rs.getString("ppic");
                Timestamp pdate=rs.getTimestamp("pdate");
                int cid=rs.getInt("catid");
                int userid=rs.getInt("userid");
                p=new Post(pid,ptitle,pcontent,pcode,ppic,pdate,cid,userid); 
            }
                
               
                
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return p;
        
        
    }
}
