<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Photographic Exposition</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<script src="js/modal.js"></script>
		<script src="js/myscript.js"></script>    
			<link rel="stylesheet" href="css/bootstrap.min.css">
			<link rel="stylesheet" href="css/bootstrap-theme.min.css">
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-xlarge.css" />
			<link rel="stylesheet" href="css/mycss.css" />
		<style>
		
		body{width:100%;margin:auto;min-width:600px;max-width:2000px}
		
		#profilePicture {
			height: 200px;
			width: 200px;
			padding: 10px;
			background-color: white;
			opacity: 1;
			position: relative;
			top: -200px;
			left: 50px;
			border: 2px solid #000000;
			border-radius: 50px;
			float: left;
		}
		#banner {
			height: 300px;
		}
		.feed-cards-l {
			border : 1px solid #000000;
			border-radius: 15px;
			width: 480px;
			height: 200px;
			float: left;
			margin-right: 50px;
			margin-bottom: 50px;
			display: block;
			background-color: white;
		}
		.feed-cards-r {
			border : 1px solid #000000;
			border-radius: 15px;
			width: 480px;
			height: 200px;
			float: right;
			margin-right: 60px;
			margin-bottom: 50px;
			display: block;
			background-color: white;
		}

		</style>
	</head>
	
	<body>
	<%
    session=request.getSession(false);
    if(session.getAttribute("user_id")==null)
    {
        response.sendRedirect("index.jsp");
    }

%>
	<header id="header" class="skel-layers-fixed">
		<div class="container">
			<h1 id="header1"><a href="#">Photographic Exposition</a></h1>
			<nav id="nav">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="blog.jsp"></a>Blog</li>
					<li><a href="about_us.jsp"></a>About Us</li>
					<li><a href="#openModal1">Contact Us</a></li>
					<div id="openModal1" class="modalDialog">
								<div>
									<a href="#close" title="Close" class="close">X</a>
										<h1 style="margin-top: 20px; font-weight: bold;">Write your message here</h1>
										  <form method="post" action="index.html">
											<p style="color: black"><input style="margin-top: 60px;height: 30px;" type="text" name="username" id="b1" placeholder="Email address" required></p>
											<p style="color: black"><input style="height: 30px;" type="password" name="text" value="" id="b2" placeholder="Subject" required></p>
											<textarea style="height:100px; width: 450px;" required></textarea>
											<p style="margin-top: 20px;" class="submit"><input type="submit" name="contact" value="Submit"></p>
										  </form>
								</div>
							</div>
					<li><a href="index.jsp" class="button" id="b1">Sign Out</a></li>
				</ul>
			</nav>
		</div>
	</header>
	
	<section id="banner"></section>	
	
		<div id="header" class="skel-layers-absolute" style="position: absolute; top: 350px;">
			<div class="container">
				<nav id="nav">
					<ul>
						<li><a href="userProfile.jsp?<%= session.getAttribute("user_id") %>_<%= session.getAttribute("user") %>"><%= session.getAttribute("user") %>'s Dashboard</a></li>
						<li><a href="aboutMe.jsp?<%= session.getAttribute("user_id") %>_<%= session.getAttribute("user") %>">About Me</a></li>
						<li><a href="gallery.jsp?<%= session.getAttribute("user_id") %>_<%= session.getAttribute("user") %>" style="color: blue;">Gallery</a></li>
						<li><a href="friends.jsp?<%= session.getAttribute("user_id") %>_<%= session.getAttribute("user") %>">Friends Feed</a></li>
						<li><a href="fav.jsp?<%= session.getAttribute("user_id") %>_<%= session.getAttribute("user") %>">Favorites</a></li>
						<li><a href="journal.jsp?<%= session.getAttribute("user_id") %><%= session.getAttribute("user") %>">Journal</a></li>
					</ul>
				</nav>
			</div>
		</div>
		
		<div class="container">
			<img id="profilePicture" alt="Profile Picture" src="img/admin.jpg">
		</div>
		<%
		          session.removeAttribute("alb_id12");
				  String alb_id12 = request.getParameter("albumid12"); 
			      session.setAttribute("alb_id12",alb_id12);
		%>
		<div class="container" id="feed-card-container">
		  <div style="width: 100%; height: 100%;" class="feed-cards-l">
			<ul style="margin-top: 20px;"><%String test12 = request.getParameter("test"); %>
			<li style="display: inline"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#add_photos">Add Photos<%=test12 %><%=alb_id12 %></button></li>
			<div style="margin-top: 50px; z-index: 90000;" class="modal fade" id="add_photos" role="dialog">
			   <div class="modal-dialog">
			      <!-- Modal content-->
			      <div class="modal-content">
			      	<form action="add_photo.jsp" onSubmit="" method="post" encType="multipart/form-data">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Add Photo</h4>
				        </div>
				        <div class="modal-body">
					          <p>Add Photo: <input style="display: inline" type="file" name="file" value="select images..."></p>
				        </div>
				        <div class="modal-footer">
				          <input type="submit" value="Add Photo"/>
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				    </form>    
			      </div>
			    </div>
			</div>
			<li style="display: inline"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal1">Delete Album</button></li>
					
			<li style="display: inline"><a class="btn btn-default" style="text-decoration:none" href="gallery.jsp?<%= session.getAttribute("user_id") %>_<%= session.getAttribute("user") %>">Go To Albums</a></li>
			</ul>
			<div class="row" style="padding: 20px;">
			<%				       
			try{
					        	  	 Class.forName("com.mysql.jdbc.Driver");
									 Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
									 Statement st1 = con.createStatement();
									 ResultSet rs1= st1.executeQuery("select * from user_photos where album_id='"+session.getAttribute("alb_id12")+"' and user_id='"+session.getAttribute("user_id")+"'");
									 while(rs1.next())
									 {
							        %>   
								    
									    <div class="col-md-3">
									    	<div style="cursor: pointer">
									    	<img src="img/Albums/<%=rs1.getString(5 )%>" height="150px;" width="160px" title="<%=rs1.getString(5) %>"/>
									    	</div>
									    </div> 
								    
								    	
									<%
									}
									 
							       } 
								 catch(Exception e)
									{
										 out.println("Error = "+ e.getMessage());
									}
			%>
			
			</div>
		  </div>	
		</div>
		
	<jsp:include page="footer.jsp"></jsp:include>	
    </body>
</html>