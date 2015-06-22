<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
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
			width: 480px;
			height: 200px;
			float: left;
			margin-right: 50px;
			margin-bottom: 50px;
			display: block;
			background-color: white;
		}
		.feed-cards-r {
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
<%! String f_name, l_name; %>
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
		ResultSet rs = st.executeQuery("select f_name, l_name from user_details where user_id='"+request.getParameter("user_id")+"'");
		if (rs.next()) {
			f_name = rs.getString(1);
			l_name = rs.getString(2);
		}
		rs.close();
		con.close();
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
					<li><a href="index.jsp">Home</a></li>
					<li><a href="blog.jsp"></a>Blog</li>
					<li><a href="about_us.jsp"></a>About Us</li>
					<li><a href="#openModal1">Contact Us</a></li>
					<li><a href="index.jsp" class="button" id="b1">Sign Out</a></li>
				</ul>
			</nav>
		</div>
	</header>
	
	<section id="banner"></section>	
	
		<div id="header" class="skel-layers-absolute" style="position: absolute; top: 350px;;">
			<div class="container">
				<nav id="nav">
					<ul>
						<li><a href="userProfile.jsp?user_id=<%= request.getParameter("user_id") %>"><%= f_name %>'s Dashboard</a></li>
						<li><a href="aboutMe.jsp?user_id=<%= request.getParameter("user_id") %>">About Me</a></li>
						<li><a href="gallery.jsp?user_id=<%= request.getParameter("user_id") %>">Gallery</a></li>
						<li><a href="friends.jsp?user_id=<%= request.getParameter("user_id") %>" style="color: blue;">Friends Feed</a></li>
						<li><a href="fav.jsp?user_id=<%= request.getParameter("user_id") %>">Favorites</a></li>
						<li><a href="journal.jsp?user_id=<%= request.getParameter("user_id") %>">Journal</a></li>
					</ul>
				</nav>
			</div>
		</div>
		
		<div class="container">
			<img id="profilePicture" alt="Profile Picture" src="img/admin.jpg">
		</div>
		
		<div class="container">
			<div class="feed-cards-l">
				<h2>Friends</h2>
				<%
				try	{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select to_id from friends where from_id="+request.getParameter("user_id")+"");
					while (rs.next()) {
						int friend_id = rs.getInt(1);
						Statement st2 = con.createStatement();
						ResultSet rs2 = st2.executeQuery("select f_name, l_name from user_details where user_id="+friend_id+"");
						if (rs2.next()) {
							String friend_f_name = rs2.getString(1);
							String friend_l_name = rs2.getString(2);
							%>
							<a href="userProfile.jsp?user_id=<%= friend_id %>"><%= friend_f_name %> <%= friend_l_name %></a><br>
							<%
						}
					}
				}
				catch (Exception e) {
					out.println("Error= "+e.getMessage());
				}
				%>
			</div>
			<div class="feed-cards-r">
				<h3>Incoming Friend Requests</h3>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>