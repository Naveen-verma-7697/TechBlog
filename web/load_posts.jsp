<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<div class="row">
<%
   User u=(User)session.getAttribute("currentUser");
   int userid=u.getId();
   
   Thread.sleep(1000);
   PostDao d=new PostDao(ConnectionProvider.getConnection());
   int cid=Integer.parseInt(request.getParameter("cid"));
   List<Post> posts =null;
   if(cid==0){
     posts=d.getAllPosts();
    
    }
    else{
    posts=d.getPostById(cid);
    
   }
   if(posts.size()==0){
   %>
   <h3 class="supportive_color text-center display-3">No posts of this Category..</h3>
    
   <%
    return;
    }
   
   for(Post p:posts){
            
 
%>

<div class="col mt2">
    <div class="card mt2" >
        <div class="card-body" >
            <img src="post_pics/<%= p.getPpic()%>" class="card-img-top" alt="..." >
            <b class=" card-title"><%= p.getPtitle()%></b>
            <p class="card-text"><%= p.getPcontent()%></p>

        </div>
            <div class="card-footer text-center primary_background"   >
                <%
                       LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                %>
               <a href="#" onclick="doLike(<%= p.getPid()%>,<%= userid%>)" class="btn btn-sm supportive_background supportive_color hover"><i class="fa fa-thumbs-o-up hover"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span></a>
               <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-sm supportive_background supportive_color">Read More</a>
               <a href="#" class="btn btn-sm supportive_background supportive_color"><i class="fa fa-commenting-o"></i><span>10</span></a>
            </div>
        
            
        
    </div>
     <br>
</div>
<%
    }

%>
</div>
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
