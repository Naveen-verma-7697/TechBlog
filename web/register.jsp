<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        
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
        <main class="supportive_color banner_background primary_background" style="padding-bottom:90px">
            <div class="container fs-6">
                <div class="col-md-6 offset-3">
                    <div class="card">
                        <div class="card-header text-center supportive_background">
                        <span class="fa fa-user-circle fa-2x"></span>
                         <br>
                         <p>Register Page</p>
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="post">
                                    <div class="mb-0">
                                        <label for="user_name" class="form-label">User Name</label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp"placeholder="Enter name">
                                    </div>   
                                    
                                    
                                    <div class="mb-0">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                      
                                    </div>
                                    
                                    <div class="mb-0">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter password">
                                    </div>
                                    
                                     <div class="mb-0">
                                        <label for="gender" class="form-label">Select Gender</label>
                                        <br>
                                        <input type="radio" id="gender" name="gender" value="male">Male
                                        <input type="radio" id="gender" name="gender" value="female">Female
                                    </div>
                                    
                                    
                                    <div class="mb-0">
                                        <textarea rows="2" class="form-control" id="about" name="about" placeholder="Enter Something about you.."></textarea>
                                    </div>
                                    
                                    
                                    <div class="mb-0 form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                    </div>
                                
                                <div class="container text-center" id="loader" style="display:none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"  ></span>
                                    <h4>please wait...</h4>
                                </div>
                                    
                                    <button id="submit-btn" type="submit" class="btn primary_background text-white" >Submit</button>
                              
                               
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
        </main>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="javascript/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function(){
                console.log("loaded..");
                $('#reg-form').on('submit',function(event){
                    event.preventDefault();
                    let form=new FormData(this);
                    
                    $('#loader').show();
                    $('#submit-btn').hide();       
                //send ajax data
                $.ajax({
                    url:"RegisterServlet",
                    type:'POST',
                    data: form,
                    success: function (data,textStatus,jqXHR){
                       console.log(data);
                       $('#loader').hide();
                       $('#submit-btn').show();
                       
                       if(data.trim()==='done'){
                         swal("Registered Successfully..we redirecting to login page")
                            .then((value) => {
                            window.location="login.jsp"; });
                        }   
                       
                       else{
                           swal(data);
                       }
                     
                       
                    },
                    error: function (jqXHR,textStatus,errorThrown){
                       $('#loader').hide();
                       $('#submit-btn').show();
                       swal("something went wrong..try again ");
                    },
                    processData:false,
                    contentType:false
                    
                    
                });
                });
            });
        </script>
    </body>
</html>
