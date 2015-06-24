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
		
		<div class="container" id="feed-card-container">
		  <div style="width: 100%; height: 100%;" class="feed-cards-l">
			<ul style="margin-top: 20px;">
			<li style="display: inline"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal1">Add Album</button></li>
					<div style="margin-top: 50px; z-index: 90000;" class="modal fade" id="Modal1" role="dialog">
					    <div class="modal-dialog">
					      <!-- Modal content-->
					      <div class="modal-content">
					      	<form action="add_album.jsp" method="post">
						        <div class="modal-header">
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						          <h4 class="modal-title">Add Album</h4>
						        </div>
						        <div class="modal-body">
							          <p><input type="text" name="alb_name" placeholder="Album Name" required></p>
							          <p><input type="text" name="alb_des" placeholder="Album Description" required></p>
						        </div>
						        <div class="modal-footer">
						          <input type="submit" value="Add Album"/>
						          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						        </div>
						    </form>    
					      </div>
					    </div>
					</div>
			<li style="display: inline"><button class="btn btn-default">Delete Album</button></li>
			</ul>
			<div class="row" style="padding: 20px;">
			<%
							       try{
					        	  	 Class.forName("com.mysql.jdbc.Driver");
									 Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
									 Statement st1 = con.createStatement();
									 ResultSet rs1= st1.executeQuery("select * from user_albums where user_id='"+request.getParameter("user_id")+"'");
									 while(rs1.next())
									 {
							        %>   
								    
									    <div class="col-md-3">
									    	<div style="cursor: pointer">
										    	<form id="myForm" action="photo.jsp?user_id=<%= request.getParameter("user_id") %>" method="post" onsubmit="">
										    	<img src="images/thumbnail-default.jpg" height="150px;" width="160px" title="<%=rs1.getString(3) %>"/>
										    	<input type="hidden" name="albumid12" value="<%=rs1.getInt(2)%>">
										    	<input type="hidden" name="test" value="<%=rs1.getString(3) %>">
										    	<p style="padding-top: 10px"><input type="submit" value="<%=rs1.getString(3) %>" style="width:160px;" ></p>
										    	</form>
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