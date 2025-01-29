<%@page import="com.tech.blog.helper.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
<!--       css-->
<!--       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">-->
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
       <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
       <style>
       .banner_background{
        clip-path: polygon(50% 0%, 100% 0, 100% 70%, 83% 99%, 45% 90%, 0 100%, 0 83%, 0% 43%, 0 0);


    }
    .head{
        font-weight: 100;
    }
    .bold{
        font-weight: bold;
    }
    </style>
       
        
       
    </head>
    <body>
<!--        //navbar-->
        <%@include file="normal_navbar.jsp" %>
        
<!--        //banner-->
        <div class="container-fluid m-0 p-0 ">
            <div class="mt-0 p-5 rounded supportive_background supportive_color banner_background">
                <div class="container">
                <h3 class="display-3">Welcome to TechBlog</h3>
                <p class="head">Programming languages are described in terms of their syntax (form) and semantics (meaning), usually defined by a formal language. Languages usually provide features such as a type system, variables and mechanisms for error handling. </p>
                <p class="head">The term computer language is sometimes used interchangeably with programming language. However, the usage of both terms varies among authors, including the exact scope of each.</p>
                <button class="btn bg-light supportive_color btn-lg"><span class="fa fa-user-plus"></span> start! its free</button>
                <a href="login.jsp" class="btn bg-light supportive_color btn-lg"><span class="fa fa-user-circle fa-spin"></span> login</a>
                </div>
            </div>
        </div>
        <br>

<!--        //cards-->
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4 p-1 text-center head supportive_color">
                    <img src="profile_pics/code.jpg" style="width: 150px;height: 150px;border-radius:70%;" alt="alt"/><br><br>
                    <h4>Technology</h4>
                    <p >Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
                </div>
                <div class="col-md-4  p-1 text-center head supportive_color">
                   <img src="profile_pics/food.jpg" style="width: 150px;height: 150px;border-radius: 70%;" alt="alt"/><br><br>
                    <h4>Food</h4>
                   <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
                 
                </div>
                <div class="col-md-4  p-1 text-center head supportive_color">
                   <img src="profile_pics/bird.jpg" style="width: 150px;height: 150px;border-radius: 50%;" alt="alt"/><br><br>
                    <h4>Nature</h4>
                   <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
                
                </div>
            </div>
        </div>
        

<!--        javascript-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="javascript/myjs.js" type="text/javascript"></script>
    </body>
</html>
