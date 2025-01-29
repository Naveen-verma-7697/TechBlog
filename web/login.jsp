<%@page import="com.tech.blog.entities.User" %>
<%@page import="com.tech.blog.dao.user_dao" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.entities.Message" %>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login Page</title>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
       <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
      <style>
       .banner_background{
        clip-path: polygon(50% 0%, 100% 0, 100% 70%, 83% 99%, 45% 90%, 0 100%, 0 83%, 0% 43%, 0 0);


    }
    </style>
    </head>
    
    <body>
        <%@include file="normal_navbar.jsp" %>
        
        <main class="d-flex align-items-center  primary_background banner_background" style="height:80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-4">
                        <div class="card ">
                            <div class="card-header supportive_background text-center supportive_color">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p>Login Page</p>
                            </div>
                            
                            <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert <%=m.getCssClass()%>" role="alert">
                                <%=m.getContent()%>
                            </div>
                            <%
                                    session.removeAttribute("msg");
                                }
                            %>
                            
                            <div class="card-body supportive_color">
                                <form action="LoginServlet" method="POST">
                                    <div class="mb-1">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        
                                    </div>
                                    <div class="mb-1">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    
                                    <br>
                                    <div class="container text-center">
                                    <button type="submit" class="btn primary_background text-white" >Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="javascript/myjs.js" type="text/javascript"></script>
    </body>
</html>
