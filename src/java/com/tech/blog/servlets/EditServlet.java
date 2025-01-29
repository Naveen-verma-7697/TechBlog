/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;
import java.io.*;

import com.tech.blog.dao.user_dao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author KRITIKA
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String user_name=request.getParameter("user_name");
            String user_email=request.getParameter("user_email");
            String user_password=request.getParameter("user_password");
            String user_about=request.getParameter("user_about");
            Part photo=request.getPart("image");
            String user_photo=photo.getSubmittedFileName();
            
            //get the current user from session
            HttpSession s=request.getSession();
            User u=(User)s.getAttribute("currentUser");
            u.setName(user_name);
            u.setEmail(user_email);
            u.setPassword(user_password);
            u.setAbout(user_about);
            String oldpic=u.getProfile();
            u.setProfile(user_photo);
            
            //update details in database go to dao and create a function
            user_dao user=new user_dao(ConnectionProvider.getConnection());
            boolean ans=user.updateUser(u);
            if(ans==true){
                String path=request.getRealPath("/")+"profile_pics"+File.separator+u.getProfile();
                
                //delete profile pic
                String oldpath=request.getRealPath("/")+"profile_pics"+File.separator+oldpic;
                
                if(!oldpic.equals("default.jpg")){
                    Helper.deleteFile(oldpath);
                }
                    
                    if(Helper.saveFile(photo.getInputStream(), path)){
                       
                       Message msg=new Message("Profile photo updated...","Success","alert-success");
                       s.setAttribute("msg", msg);
                        
                    }
                    else{
                        Message msg=new Message("Something went wrong...","error","alert-danger");
                        s.setAttribute("msg", msg);
                    }
                        
                
                
           }
            else{
               Message msg=new Message("Something went wrong...","error","alert-danger");
               s.setAttribute("msg", msg);
            }
            response.sendRedirect("profile.jsp");
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
