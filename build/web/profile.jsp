<%@page import="com.tech.blog.entities.User" %>
<%@page import="com.tech.blog.entities.Message" %>
<%@page import="com.tech.blog.entities.Category" %>
<%@page import="com.tech.blog.dao.user_dao" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="java.lang.String" %>
<%@page import="java.util.ArrayList" %>
<%@page errorPage="error_page.jsp" %>
<%
   User u=(User)session.getAttribute("currentUser");
   if(u==null){
        response.sendRedirect("login.jsp");
    }
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>profile Page</title>
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
<!--        //nav start-->
        <nav class="navbar navbar-expand-lg navbar-dark primary_background">
  <div class="container-fluid">
      <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> TechBlog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-bell-o"></span> Review with Kratika</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
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
<!--        //nav khtm-->
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

<!--//modal starts-->
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


<!--//modal khtm-->
<main>
    <div class="container">
        <div class="mt-2 row">
                <div class="container text-center" id="loader">
                    <i class="fa fa-refresh fa-4x fa-spin"></i>
                    <h3 class="mt-2">Loading....</h3>
                </div>
                <div class="container-fluid" id="post-container">
                    
                </div>
           
        </div>
    </div>
</main>
<!--//post modal start-->



<!-- Modal -->
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
<!--//post modal end-->

<div class="offcanvas offcanvas-start supportive_color" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header">
      <h5 class="offcanvas-title" id="offcanvasExampleLabel"><span class="fa fa-check-square-o fa-2x"></span>Categories</h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
    <hr>
  <div class="offcanvas-body">
      <ul class="nav flex-column mb-0">
      
<!--    <div class="list-group supportive_color">-->
<li class="nav-item">
<a href="#" class="nav-link c-link supportive_background supportive_color" aria-current="page" onclick="getPosts(0,this)"><span class="fa fa-bars"></span>  All Categories
<!--    <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action supportive_background supportive_color" aria-current="true">All Categories-->
  </a>
</li>
    <%
                          PostDao ps2=new PostDao(ConnectionProvider.getConnection());
                          ArrayList<Category> list2=ps2.getAllCategories();
                          for(Category c1:list2){
                          
                       %>
                       <li class="nav-item">
                           <a href="#" class="nav-link c-link supportive_background supportive_color" aria-current="page" onclick="getPosts(<%= c1.getCid() %>,this)"><span class="<%= c1.getSymbol()%>"></span>  <%= c1.getName()%>
                              
                           </a>
                       </li>

                       <%
                          }
                       %>
    
    
<!-- </div>-->
                       
                         
     
    
                       </ul>
                       
                       
                           </div>
                               
                       
  </div>
</div>


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

<!--//loading post using ajax-->
<script>
    function getPosts(catid,temp){
        $("#loader").show();
        $("#post-container").hide();
        $(".c-link").removeClass('supportive_background');
        $.ajax({
            url:"load_posts.jsp",
            data:{cid:catid},
            success:function(data,textStatus,jqXHR){
                console.log(catid);
                $("#loader").hide();
                $("#post-container").show();
                $("#post-container").html(data);
                $(temp).addClass('supportive_background');
            }
        });
    }
    $(document).ready(function(e){
        let ref=$('.c-link')[0];
        getPosts(0,ref);
        
        
       
   });
</script>

    
    </body>
</html>
