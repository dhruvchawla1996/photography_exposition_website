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
		<script>
		function1(){
			
		}
		</script>
	</head>
	
	<body>
	<%
	response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma","no-cache");//HTTP 1.0 backward compatibility
	%>
	<%! String f_name, l_name, profile_pic_location; %>
	<%
    session=request.getSession(false);
    if(session.getAttribute("user_id")==null)
    {
        response.sendRedirect("index.jsp");
    }
    try {
    	Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select f_name, l_name, pic_location from user_details where user_id='"+request.getParameter("user_id")+"'");
		if (rs.next()) {
			f_name = rs.getString(1);
			l_name = rs.getString(2);
			profile_pic_location = rs.getString(3);
			if(profile_pic_location == null) {
				profile_pic_location = "admin.jpg";
			}
		}
    }
    catch (Exception e) {
    	out.println("Error= "+e.getMessage());
    }


%>
	<header id="header" class="skel-layers-fixed">
		<div class="container">
			<h1 id="header1"><a href="#">Photographic Exposition</a></h1>
			<nav id="nav">
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="left-sidebar.html"></a>Blog</li>
					<li><a href="#events.html"></a>Events</li>
					<li><a href="userProfile.jsp?user_id=<%= session.getAttribute("user_id") %>">My Profile</a></li>
					<li><a href="index.jsp" class="button" id="b1">Sign Out</a></li>
				</ul>
			</nav>
		</div>
	</header>
	
	<section id="banner"></section>	
	<%
	if (!request.getParameter("user_id").equals(session.getAttribute("user_id").toString())) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
			Statement st1 = con.createStatement();
			Statement st2 = con.createStatement();
			ResultSet rs1 = st1.executeQuery("select * from friends where from_id='"+session.getAttribute("user_id").toString()+"' and to_id='"+request.getParameter("user_id")+"'");
			ResultSet rs2 = st2.executeQuery("select * from friend_requests where from_id='"+session.getAttribute("user_id").toString()+"' and to_id='"+request.getParameter("user_id")+"'");
			if (rs1.next()) {
				%> <button type="button" class="btn btn-info" style="position: relative; top: -50px; left: -100px; float: right;">Friends</button> <%
			}
			else if(rs2.next()) {
				%> <button type="button" class="btn btn-info" style="position: relative; top: -50px; left: -100px; float: right;">Request Sent</button> <%
			}
			else {
				%>
				<form action="add_friend.jsp" method="post">
				<input type="hidden" name="to_id" value="<%= request.getParameter("user_id") %>">
				<button type="submit" class="btn btn-info" style="position: relative; top: -50px; left: -100px; float: right;">Add Friend</button>
				</form>
				<% 
			}
		}
		catch (Exception e) {
			out.println("Error= "+e.getMessage());
		}
	} 
	%>
	
		<div id="header" class="skel-layers-absolute" style="position: absolute; top: 350px;">
			<div class="container">
				<nav id="nav">
					<ul>
						<li><a href="userProfile.jsp?user_id=<%= request.getParameter("user_id") %>"><%= f_name %>'s Dashboard</a></li>
						<li><a href="aboutMe.jsp?user_id=<%= request.getParameter("user_id") %>">About Me</a></li>
						<li><a href="gallery.jsp?user_id=<%= request.getParameter("user_id") %>" style="color: blue;">Gallery</a></li>
						<li><a href="friends.jsp?user_id=<%= request.getParameter("user_id") %>">Friends Feed</a></li>
						<li><a href="fav.jsp?user_id=<%= request.getParameter("user_id") %>">Favorites</a></li>
						<li><a href="journal.jsp?user_id=<%= request.getParameter("user_id") %>">Journal</a></li>
					</ul>
				</nav>
			</div>
		</div>
		
		<div class="container">
			<img id="profilePicture" alt="Profile Picture" src="img/profile_pictures/<%= profile_pic_location %>">
		</div>
		<%
				  String alb_id12 = request.getParameter("albumid12"); 
			      session.setAttribute("alb_id12",alb_id12);
		%>
		<div class="container" id="feed-card-container">
		  <div style="width: 100%; height: 100%;" class="feed-cards-l">
			<ul style="margin-top: 20px;"><%String test12 = request.getParameter("test"); %>
			<li style="display: inline"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#add_photos">Add Photos <%=alb_id12 %> <%=test12 %></button></li>
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
			<li style="display: inline"><a class="btn btn-default" style="text-decoration:none" href="gallery.jsp?user_id=<%= request.getParameter("user_id") %>">Go To Albums</a></li>
			</ul>
			<div class="row" style="padding: 20px;">
			<%				       
			try{
					        	  	 Class.forName("com.mysql.jdbc.Driver");
									 Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
									 Statement st1 = con.createStatement();
									 ResultSet rs1= st1.executeQuery("select * from user_photos where album_id='"+session.getAttribute("alb_id12")+"' and user_id='"+request.getParameter("user_id")+"'");
									 while(rs1.next())
									 {
							        %>   
								        
									    <div class="col-md-3" style="margin-bottom: 20px;">
									    	<div style="cursor: pointer">
									    	<img src="img/Albums/<%=rs1.getString(5)%>" height="150px;" width="160px" title="<%=rs1.getString(5)%>" data-toggle="modal" data-target="#display_photo_<%=rs1.getString(3)%>"/>
									    	<% if (request.getParameter("user_id").equals(session.getAttribute("user_id").toString()))	{
										    		%>
									    	<button style="width:160px;margin-top:10px" class="button" data-toggle="modal" data-target="#edit_photo_<%=rs1.getString(3)%>">Edit</button>
										    	<% } %>
										    	<div style="margin-top: 15px; z-index: 90000;" class="modal fade" id="edit_photo_<%=rs1.getString(3)%>" role="dialog">
												   <div class="modal-dialog">
												      <!-- Modal content-->
												      <div class="modal-content">
												      	<div class="modal-header">
													          <button type="button" class="close" data-dismiss="modal">&times;</button>
													          <h4 class="modal-title">
													          Edit Your Photo Details
													          </h4>
													        </div>
													        <form method="post" action="edit_photo_detail.jsp">
													        <div class="modal-body">
													        <input type="hidden" name="photo_id" value="<%=rs1.getString(3)%>">
													        <label>Photo Name:</label><input type="text" name="edit_photo_name" required>
													        <label>Photo Description:</label><input type="text" name="edit_photo_desc" maxlength="100" required>
														    </div>
													        <div class="modal-footer">
													        <input type="submit" value="Edit Photo details">
													          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
													        </div>
													    </form>    
												      </div>
												    </div>
											   </div>
										   </div>
									    </div> 
								    	<div style="margin-top: 15px; z-index: 90000;" class="modal fade" id="display_photo_<%=rs1.getString(3)%>" role="dialog">
										   <div class="modal-dialog">
										      <!-- Modal content-->
										      <div class="modal-content">
										      	
											        <div class="modal-header">
											          <button type="button" class="close" data-dismiss="modal">&times;</button>
											          <h4 class="modal-title">
											          Photo Name: 
											          <%
											          if(rs1.getString(4) == null)
											          {
											          %>
											          No Name
											          <%
											          }
											          else{
											          out.println(rs1.getString(4));
											          }
											          %>
											          </h4>
											        </div>
											        <div class="modal-body">
												          <img src="img/Albums/<%=rs1.getString(5 )%>" style="width: 100%; max-width: 1363px;">
											        	<br/><br/>Photo Description: 
											          <%
											          if(rs1.getString(6) == null)
											          {
											          %>
											          No Description
											          <%
											          }
											          else{
											          out.println(rs1.getString(6));
											          }
											          %>
											        </div>
											        <div class="modal-footer">
											          <% out.println(rs1.getString(7)); %> Likes <br>
											          <form method="post" action="like_photo.jsp?user_id=<%= request.getParameter("user_id") %>">
											          <button type="submit" style="float:left" class="btn btn-success">Like</button>
											          </form>
											          <button type="button" style="float:left" class="btn btn-danger">Comment</button>
											          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											        </div>
											
										      </div>
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