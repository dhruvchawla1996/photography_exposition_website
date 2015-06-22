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
						<li><a href="userProfile.jsp?<%= session.getAttribute("user_id") %>.<%= session.getAttribute("user") %>" style="color: blue;"><%= session.getAttribute("user") %>'s Dashboard</a></li>
						<li><a href="aboutMe.jsp?<%= session.getAttribute("user_id") %>.<%= session.getAttribute("user") %>">About Me</a></li>
						<li><a href="gallery.jsp?<%= session.getAttribute("user_id") %>.<%= session.getAttribute("user") %>">Gallery</a></li>
						<li><a href="friends.jsp?<%= session.getAttribute("user_id") %>.<%= session.getAttribute("user") %>">Friends Feed</a></li>
						<li><a href="fav.jsp?<%= session.getAttribute("user_id") %>.<%= session.getAttribute("user") %>">Favorites</a></li>
						<li><a href="journal.jsp?<%= session.getAttribute("user_id") %>.<%= session.getAttribute("user") %>">Journal</a></li>
					</ul>
				</nav>
			</div>
		</div>
		
		<div class="container">
			<img id="profilePicture" alt="Profile Picture" src="img/admin.jpg">
		</div>
		
		<div class="container" style="border: solid 1px;padding: 10px; margin-top: -50px;">
		<button style="margin-left: -150px; margin-top: 30px;margin-bottom: 30px;" type="button" data-toggle="modal" data-target="#add_journal_section" class="btn btn success">Add Journal</button>
		<div style="margin-top: 50px; z-index: 90000;" class="modal fade" id="add_journal_section" role="dialog">
					    <div class="modal-dialog">
					      <!-- Modal content-->
					      <div class="modal-content">
					      	<form action="add_journal.jsp" method="post">
						        <div class="modal-header">
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						          <h4 class="modal-title">Add Journal</h4>
						        </div>
						        <div class="modal-body">
							          <p><input type="text" name="journal_title" maxlength="80" placeholder="Journal Title (max. characters - 80)" required></p>
							          <p><textarea style="height: 200px; width: 100%" name="journal_message" placeholder="Write here....  (max. characters - 700)"></textarea></p>
						        </div>
						        <div class="modal-footer">
						          <input type="submit" id="submit_journal" class="button" value="Add">
						          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						        </div>
						    </form>    
					      </div>
					    </div>
		</div>
		<button type="button" data-toggle="modal" data-target="#del_journal_section" class="btn btn success">Delete Journal</button>
		<div style="margin-top: 50px; z-index: 90000;" class="modal fade" id="del_journal_section" role="dialog">
					    <div class="modal-dialog">
					      <!-- Modal content-->
					      <div class="modal-content">
					      	<form action="del_journal.jsp" method="post">
						        <div class="modal-header">
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						          <h4 class="modal-title">Which Journal you want to delete?</h4>
						        </div>
						        <div class="modal-body">
							          <p style="color: black">Journal Name:
							          <select name="del">
							          <%
							       try{
					        	  	 Class.forName("com.mysql.jdbc.Driver");
									 Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
									 Statement st1 = con.createStatement();
									 Statement st2 = con.createStatement();
									 ResultSet rs1= st1.executeQuery("select * from user_journal where user_id='"+session.getAttribute("user_id")+"'");
									 ResultSet rs2= st2.executeQuery("select * from user_journal where user_id='"+session.getAttribute("user_id")+"'");
									 while(rs1.next())
									 {
							          %> 
								          
											<option value="<%= rs1.getString(3) %>" selected><%= rs1.getString(3) %>
										  </option>
									<%
									} 
									%>	</select>	
										</p>
						        </div>
						        <div class="modal-footer">
						          <input type="submit" id="submit_journal" class="button" value="Delete">
						          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						        </div>
						    </form>    
					      </div>
					    </div>
		</div>
		<div>
		<%
		
			while(rs2.next())
			 {
				 %>
				<div style="margin-left: 30px; padding: 50px; color: black; text-align:center;">
					
					    <div class="modal-content" style="padding: 40px;display: block;">
						        <div>
						          <h4 class="modal-title" style="margin-top: 5px;"><%= rs2.getString(3) %></h4>
						        </div>
						        <div>
							          <p style="color: black;"><%=rs2.getString(4)%></p>
						        </div>
							<div>		
								<button class="btn btn default" type="button" data-toggle="modal" data-target="#myjournal" style="margin: -20px -50px; position:relative; top:50%; text-transform: uppercase;">Edit <%= rs2.getString(3)%></button>
					    	</div>
					    </div>
				</div>
				
					    	
					<div style="margin-top: 50px; z-index: 90000;" class="modal fade" id="myjournal" role="dialog">
						    <div class="modal-dialog">
						      <!-- Modal content-->
						      <div class="modal-content">
							        <div class="modal-header">
							          <button type="button" class="close" data-dismiss="modal">&times;</button>
							          <h4 class="modal-title"><%= rs2.getString(3) %></h4>
							        </div>
							        <div class="modal-body">
								          <textarea style="color: black;"><%=rs2.getString(4)%></textarea>
							        </div>
							        <div class="modal-footer">
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
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>