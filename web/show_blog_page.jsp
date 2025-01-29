<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.user_dao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="error_page.jsp" %>
<%
     User u=(User)session.getAttribute("currentUser");
     if(u==null){
        response.sendRedirect("login.jsp");
    }
 %>
<% 
    
    int post_id=Integer.parseInt(request.getParameter("post_id"));
    PostDao p=new PostDao(ConnectionProvider.getConnection());
    Post post=p.getPostByPid(post_id);
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= post.getPtitle()%></title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
       <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
       <style>
       .banner_background{
        clip-path: polygon(50% 0%, 100% 0, 100% 70%, 83% 99%, 45% 90%, 0 100%, 0 83%, 0% 43%, 0 0);
        }
        .post-title{
            font-weight: 100;
            font-size: 30px;
        }
        .post-content{
            font-weight: 100;
            font-size: 20px;
        }
        .post-date{
            font-style:italic;
            font-weight: bold;
        }
        .post-user-info{
            font-size:20px;
            font-weight: 80;
        }
        
    </style>
    <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v20.0" nonce="Zm7X57Tr"></script>
    </head>
    <body>
<!--navbar start-->
        <nav class="navbar navbar-expand-lg navbar-dark primary_background">
  <div class="container-fluid">
      <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> TechBlog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="profile.jsp"><span class="fa fa-bell-o"></span> Review with Kratika</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <span class="fa fa-check-square-o"></span> Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Problem Statement</a></li>
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Solution..</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><span class="fa fa-phone"></span> Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-picture-o"></span> Post</a>
        </li>
       
        
      </ul>
        <ul class="navbar-nav me-right">
            <li class="nav-item">
                <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profileModal"> <img src="profile_pics/<%=u.getProfile()%>" style="max-width:20px;border-radius: 50%;"> <%= u.getName()%></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
            </li>
        </ul>
        
    </div>
  </div>
</nav>
<!--navbar khtm-->


<!--main content of body-->
<!--<div class="container">
    <div class="row my-4">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header supportive_background supportive_color">
                    <h4 class="post-title"><%= post.getPtitle()%></h4>
                </div>
                <div class="card-body">
                    <img src="post_pics/<%= post.getPpic()%>" class="card-img-top my-2" alt="..." >
                    
                    
                    
                      <div class="col-md-4">
                          <p class="post-date"><%= post.getPdate().toLocaleString()%></p>
                      </div>
                    </div>
                      
                    
                    
                    <p class="post-content"><%= post.getPcontent()%></p>
                    <br><br>
                    <div class="post-code">
                        <pre><%= post.getPcode()%></pre>
                    </div>
                    
                </div>
                 
            </div>
        </div>
    </div>
</div>-->
<!--main content khtm-->

<div class="container-fluid">
     <%
                         
                           user_dao user=new user_dao(ConnectionProvider.getConnection()) ;
                           int userid=post.getUserid();
                           User new_u=user.getUserByUserId(userid);
                              
                           
                           LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                       
                         
                         
      %> 
      <div class="row my-1">
          <div class="col-md-12">
              <h2 class="card-header post-title supportive_color supportive_background"><%= post.getPtitle()%></h2>

              <p class="post-content supportive_color p-2"><%= post.getPcontent()%></p>

              <div class="row post-date supportive_color p-2">

                  <p class="post-user-info"><a href="#" class="p-1 supportive_background supportive_color" style="text-decoration:none;border-radius:5px; "><%= new_u.getName()%></a> has posted this post at 
                      <span class="post-date"><%= post.getPdate().toLocaleString()%></span>
                      <span style="float:right;"><a href="#" onclick="doLike(<%= post.getPid()%>,<%= userid%>)" class="btn btn-sm supportive_background supportive_color p-2" style="margin-right:1px;margin-left:1px;"><i class="fa fa-thumbs-o-up hover"></i><span class="like-counter"><%= ld.countLikeOnPost(post.getPid())%></span></a></span>
                      <span style="float:right;margin-right:1px;margin-left:1px;"><a class="btn p-2 primary_background text-white" data-bs-toggle="collapse" href="#code_collapse" role="button" aria-expanded="false" aria-controls="collapseExample">Code</a> </span></p>
              </div>

              <div class="collapse p-2 " id="code_collapse">
                  <div class="card card-body primary_background text-white">
                      <%= post.getPcode()%>
                  </div>
              </div>


              <img src="post_pics/<%= post.getPpic()%>" class="card-img-top p-2" alt="..." > 
              

          </div>

      </div>
</div>

<!-- Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary_background text-white">
        <h5 class="modal-title" id="exampleModalLabel ">TechBlog</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="container text-center supportive_color">
              <img src="profile_pics/<%=u.getProfile()%>" style="max-width:150px;border-radius: 50%;" alt="alt"/><br>
              <h5 class="modal-title" id="exampleModalLabel"> <%=u.getName()%> </h5>
              
<!--              //profile details start-->
              <div id="profile-details">
              <table class="table">
                  
                  <tbody>
                      <tr>
                          <th scope="row">Id:</th>
                          <td><%=u.getId()%></td>
                         
                      </tr>
                      <tr>
                          <th scope="row">Email:</th>
                          <td><%=u.getEmail()%></td>
                          
                      </tr>
                      <tr>
                          <th scope="row">Gender:</th>
                          <td><%=u.getGender()%></td>
                      </tr>
                      <tr>
                          <th scope="row">Status:</th>
                          <td><%=u.getAbout()%></td>
                      </tr>
                      <tr>
                          <th scope="row">Registered on:</th>
                          <td><%=u.getDatetime()%></td>
                      </tr>
                  </tbody>
              </table>
            </div>
<!--                      //profile details end-->

<!--                      //profile edit start-->
                        <div id="profile-edit" style="display:none;">
                            <h3 class="mt-2">Please Edit Carefully</h3>
                            <form action="EditServlet" method="post" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>Id:</td>
                                        <td><%=u.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Name:</td>
                                        <td><input type="text" class="form-control" name="user_name" value="<%=u.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td><input type="email" class="form-control" name="user_email" value="<%=u.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password:</td>
                                        <td><input type="password" class="form-control" name="user_password" value="<%=u.getPassword()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Gender:</td>
                                        <td><%=u.getGender().toUpperCase()%></td>
                                    </tr>
                                    <tr>
                                        <td>About:</td>
                                        <td><textarea class="form-control" name="user_about" rows="3" ><%=u.getAbout()%></textarea></td>
                                    </tr>
                                    <tr>
                                        <td>Profile pic:</td>
                                        <td><input type="file" class="form-control" name="image"></td>
                                    </tr>
                                </table>
                                    <div class="container">
                                        <button type="submit" class="btn bg-light supportive_color btn-lg" >Save</button>
                                    </div>
                                
                            </form>
                            
                        </div>
<!--                            //profile edit end-->



          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" id="profile-edit-btn" class="btn primary_background text-white">Edit</button>
      </div>
    </div>
  </div>
</div>
<!--modal khtm-->

<!--post Modal start-->
<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary_background text-white">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form action="Addpostservlet" method="post" id="add-post-form">
              
              <div class="form-group">
                  <select class="form-control" name="cid">
                      <option selected disabled class="form-control">---Select Category---</option>
                      <%
                          PostDao ps=new PostDao(ConnectionProvider.getConnection());
                          ArrayList<Category> list=ps.getAllCategories();
                          for(Category c:list){
                          
                       %>
                       <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                       <%
                          }
                       %>
                      
                      
                  </select>
              </div>
              <br>
              <div class="form-group">
                  <input type="text" name="post_title" placeholder="Enter post Title" class="form-control">
              </div>
              <br>
              <div class="form-group">
                  <textarea  name="post_content" placeholder="Enter your Content" class="form-control" style="height:100px"></textarea>
              </div>
              <br>
              <div class="form-group">
                  <textarea  name="post_code" placeholder="Enter your Code (If any)" class="form-control" style="height:100px"></textarea>
              </div>
              <br>
              <div class="form-group">
                  <label>Select the picture: </label>
                  <input type="file" name="post_pic"  class="form-control">
                
              </div>
               <br>
              <div class="container text-center" >
                  <button type="reset" class="btn btn-secondary" >Reset</button>
                  <button type="submit" class="btn primary_background text-white">POST</button>
              </div>
              
          </form>
      </div>
      
    </div>
  </div>
</div>
<!--post modal end-->


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="javascript/myjs.js" type="text/javascript"></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function(){
                let editStatus=false;
                $('#profile-edit-btn').click(function(){
                    if(editStatus===false){
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus=true;
                        $(this).text("Back");
                    }
                    else{
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus=false;
                        $(this).text("Edit");
                    }
                    
                    
                });
            });
        </script>
<!--        //now add post js-->
<script>
            $(document).ready(function(){
               $("#add-post-form").on("submit",function(event){
                   //this code is gets called when form is submitted
                   event.preventDefault();
                   console.log("you have submitted");
                   
                   let form=new FormData(this);
                   
                   //now requesting to server
                   $.ajax({
                       url:"Addpostservlet",
                       type:"POST",
                       data:form,
                       success:function(data,textStatus,jqXHR){
                           //SUCCESS
                           
                           if(data.trim()==="done"){
                               swal("Good job!", "Post Saved Successfully!", "success");
                                
                           }
                   
                       },
                       error:function(textStatus,jqXHR,errorThrown){
                           //error
                          
                          swal("Error!", "Something went wrong!", "error");
                       },
                       processData:false,
                       contentType:false
                   });
               });
            });
</script>

<script>
    function doLike(pid,uid){
    console.log(pid,uid);
    const d={
        uid:uid,
        pid:pid,
        operation:'like'
    };
    $.ajax({
        url:"LikeServlet",
        data:d,
        success:function(data,textStatus,jqXHR){
            console.log(data);
            if(data.trim()==='true'){
                let c = $('.like-counter').html();
                c++;
                $('.like-counter').html(c);
                
            }
            
        },
        error:function(jqXHR,textStatus,errorThrown){
            console.log;
        }
    });
}

</script>

    </body>
</html>
