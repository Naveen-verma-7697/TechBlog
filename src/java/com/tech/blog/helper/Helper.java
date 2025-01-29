/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;
import java.io.*;



/**
 *
 * @author KRITIKA
 */
public class Helper {
    
    public static boolean deleteFile(String path){
        boolean f=false;
        try{
            File file=new File(path);
            f=file.delete();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public static boolean saveFile(InputStream is, String path){
        boolean f=false;
        try{
            //array of bytes
            byte b[]=new byte[is.available()];
            
            is.read(b);
            //read data from (is) and keep it on b[] array
            
            FileOutputStream fos=new FileOutputStream(path);
            fos.write(b);
            //write in fos from b
            
            fos.flush();
            fos.close();
            f=true;
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
}
