/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author navee
 */
public class Like {
    private int pid;
    private int uid;
    
    public Like(int pid,int uid){
        this.pid = pid;
        this.uid = uid;
    }
    public Like(int pid){
        this.pid = pid;
    }
    
    public int getpid(int pid){
        return pid;
    }
    public void setpid(int pid){
        this.pid = pid;
    }
    public int getuid(int uid){
        return uid;
    }
    public void setuid(int uid){
        this.uid = uid;
    }
}
