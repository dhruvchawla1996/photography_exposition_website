<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Photographic Exposition</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="description" content="" />
		<meta name="keywords" content="" />
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
		.active-hover {
			background-color: lightgrey;
		}
		.active-click {
			background-color: #123;
			color: white;
		}

		</style>
		<script>
		<%!String f_name, l_name, email_id, gender, day, month, year, place_of_stay, relationship, occupation, skills, college, major, period, employment, nickname, fav_quotes, tagline, introduction, pic_location; java.util.Date b_date; %>
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select f_name,l_name,email_id,gender,b_date,tagline,introduction,place_of_stay, relationship_status, occupation, skills, college, major, period, employment, nickname, fav_quotes, pic_location from user_details where user_id='"+request.getParameter("user_id")+"'");
				if (rs.next()) {
					f_name = rs.getString(1);
					l_name = rs.getString(2);
					email_id = rs.getString(3);
					gender = rs.getString(4);
					b_date = rs.getDate(5);
					tagline = rs.getString(6);
					introduction = rs.getString(7);
					place_of_stay = rs.getString(8);
					relationship = rs.getString(9);
					occupation = rs.getString(10);
					skills = rs.getString(11);
					college = rs.getString(12);
					major = rs.getString(13);
					period = rs.getString(14);
					employment = rs.getString(15);
					nickname = rs.getString(16);
					fav_quotes = rs.getString(17);
					pic_location = rs.getString(18);
					Calendar cal = Calendar.getInstance();
					cal.setTime(b_date);
					month = Integer.toString(cal.get(Calendar.MONTH)+1);
					day = Integer.toString(cal.get(Calendar.DATE));
					year = Integer.toString(cal.get(Calendar.YEAR));
					
				}
				else {
					out.println("Error: User not found in database");
				}
			}
			catch (Exception e) {
				out.println(e.getMessage());
			}
		%>
		function displayGender(gender) {
			$('#su_6').val(gender);
		}
		function displayDayMonth(day, month) {
			$('#su_7').val(day);
			if (month < 10)
				$('#su_8').val('0'+month);
			else
				$('#su_8').val(month);
		}
		function displayRelationship(status) {
			$('#su_10').val(status);	
		}
		function hideEditButtons(session_id, request_id) {
			if (!(session_id == request_id)) {
				$('#aa6, #button_overview, #button_work, #button_education, #button_story, #button_details').hide();
			}
		}
		$(document).ready(function(){
			$('#aa1').addClass("active-click");
			$('#work, #education, #story, #details, #profile_pic').hide();
			$('#edit_overview, #edit_work, #edit_education, #edit_story, #edit_details').hide();
			
			$('#aa1').click(function() {
				$('#aa1').addClass("active-click");
				$('#aa2').removeClass("active-click");
				$('#aa3').removeClass("active-click");
				$('#aa4').removeClass("active-click");
				$('#aa5').removeClass("active-click");
				$('#aa6').removeClass("active-click");
				$('#overview').show();
				$('#work, #education, #story, #details, #profile_pic').hide();
				$("#edit_overview, #edit_work, #edit_education, #edit_story, #edit_details").hide();
			});
			$('#aa2').click(function() {
				$('#aa1').removeClass("active-click");
				$('#aa2').addClass("active-click");
				$('#aa3').removeClass("active-click");
				$('#aa4').removeClass("active-click");
				$('#aa5').removeClass("active-click");
				$('#aa6').removeClass("active-click");
				$('#work').show();
				$('#overview, #education, #story, #details, #profile_pic').hide();
				$("#edit_overview, #edit_work, #edit_education, #edit_story, #edit_details").hide();
			});
			$('#aa3').click(function() {
				$('#aa1').removeClass("active-click");
				$('#aa2').removeClass("active-click");
				$('#aa3').addClass("active-click");
				$('#aa4').removeClass("active-click");
				$('#aa5').removeClass("active-click");
				$('#aa6').removeClass("active-click");
				$('#education').show();
				$('#overview, #work, #story, #details, #profile_pic').hide();
				$("#edit_overview, #edit_work, #edit_education, #edit_story, #edit_details").hide();
			});
			$('#aa4').click(function() {
				$('#aa1').removeClass("active-click");
				$('#aa2').removeClass("active-click");
				$('#aa3').removeClass("active-click");
				$('#aa4').addClass("active-click");
				$('#aa5').removeClass("active-click");
				$('#aa6').removeClass("active-click");
				$('#story').show();
				$('#overview, #work, #education, #details, #profile_pic').hide();
				$("#edit_overview, #edit_work, #edit_education, #edit_story, #edit_details").hide();
			});
			$('#aa5').click(function() {
				$('#aa1').removeClass("active-click");
				$('#aa2').removeClass("active-click");
				$('#aa3').removeClass("active-click");
				$('#aa4').removeClass("active-click");
				$('#aa5').addClass("active-click");
				$('#aa6').removeClass("active-click");
				$('#details').show();
				$('#overview, #work, #education, #story, #profile_pic').hide();
				$("#edit_overview, #edit_work, #edit_education, #edit_story, #edit_details").hide();
			});
			$('#aa6').click(function() {
				$('#aa1').removeClass("active-click");
				$('#aa2').removeClass("active-click");
				$('#aa3').removeClass("active-click");
				$('#aa4').removeClass("active-click");
				$('#aa5').removeClass("active-click");
				$('#aa6').addClass("active-click");
				$('#profile_pic').show();
				$('#overview, #work, #education, #story, #details').hide();
				$("#edit_overview, #edit_work, #edit_education, #edit_story, #edit_details").hide();
			});
			$('#aa1').hover(function(){
				$(this).addClass("active-hover");
				$('#aa2').removeClass("active-hover");
				$('#aa3').removeClass("active-hover");
				$('#aa4').removeClass("active-hover");
				$('#aa5').removeClass("active-hover");
				$('#aa6').removeClass("active-hover");
			});
			$('#aa2').hover(function(){
				$(this).addClass("active-hover");
				$('#aa1').removeClass("active-hover");
				$('#aa3').removeClass("active-hover");
				$('#aa4').removeClass("active-hover");
				$('#aa5').removeClass("active-hover");
				$('#aa6').removeClass("active-hover");
			});
			$('#aa3').hover(function(){
				$(this).addClass("active-hover");
				$('#aa1').removeClass("active-hover");
				$('#aa2').removeClass("active-hover");
				$('#aa4').removeClass("active-hover");
				$('#aa5').removeClass("active-hover");
				$('#aa6').removeClass("active-hover");
			});
			$('#aa4').hover(function(){
				$(this).addClass("active-hover");
				$('#aa1').removeClass("active-hover");
				$('#aa2').removeClass("active-hover");
				$('#aa3').removeClass("active-hover");
				$('#aa5').removeClass("active-hover");
				$('#aa6').removeClass("active-hover");
			});
			$('#aa5').hover(function(){
				$(this).addClass("active-hover");
				$('#aa1').removeClass("active-hover");
				$('#aa2').removeClass("active-hover");
				$('#aa3').removeClass("active-hover");
				$('#aa4').removeClass("active-hover");
				$('#aa6').removeClass("active-hover");
			});
			$('#aa6').hover(function(){
				$(this).addClass("active-hover");
				$('#aa1').removeClass("active-hover");
				$('#aa2').removeClass("active-hover");
				$('#aa3').removeClass("active-hover");
				$('#aa4').removeClass("active-hover");
				$('#aa5').removeClass("active-hover");
			});
			$('#button_overview').click(function(){
				$('#overview, #work, #education, #story, #details, #profile_pic').hide('slow');
				$('#edit_work, #edit_education, #edit_story, #edit_details').hide('slow');
				$('#edit_overview').show('slow');
			});
			$('#button_work').click(function(){
				$('#overview, #work, #education, #story, #details, #profile_pic').hide('slow');
				$('#edit_overview, #edit_education, #edit_story, #edit_details').hide('slow');
				$('#edit_work').show('slow');
			});
			$('#button_education').click(function(){
				$('#overview, #work, #education, #story, #details, #profile_pic').hide('slow');
				$('#edit_overview, #edit_work, #edit_story, #edit_details').hide('slow');
				$('#edit_education').show('slow');
			});
			$('#button_story').click(function(){
				$('#overview, #work, #education, #story, #details, #profile_pic').hide('slow');
				$('#edit_overview, #edit_work, #edit_education, #edit_details').hide('slow');
				$('#edit_story').show('slow');
			});
			$('#button_details').click(function(){
				$('#overview, #work, #education, #story, #details, #profile_pic').hide('slow');
				$('#edit_overview, #edit_work, #edit_education, #edit_story').hide('slow');
				$('#edit_details').show('slow');
			});
		});
		
		</script>
	</head>
	<body onload="displayGender('<%= gender%>'); displayDayMonth('<%= day %>', '<%= month %>'); displayRelationship('<%= relationship %>'); hideEditButtons('<%= session.getAttribute("user_id") %>', '<%= request.getParameter("user_id") %>')">
	
	<header id="header" class="skel-layers-fixed">
		<div class="container">
			<h1 id="header1"><a href="#">Photographic Exposition</a></h1>
			<nav id="nav">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="left-sidebar.html"></a>Blog</li>
					<li><a href="right-sidebar.html"></a>About Us</li>
					<li><a href="no-sidebar.html">Contact Us</a></li>
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
						<li><a href="userProfile.jsp?user_id=<%= request.getParameter("user_id") %>"><%= f_name %>'s Dashboard</a></li>
						<li><a href="aboutMe.jsp?user_id=<%= request.getParameter("user_id") %>" style="color: blue;">About Me</a></li>
						<li><a href="gallery.jsp?user_id=<%= request.getParameter("user_id") %>">Gallery</a></li>
						<li><a href="index.jsp?user_id=<%= request.getParameter("user_id") %>">Friends Feed</a></li>
						<li><a href="fav.jsp?user_id=<%= request.getParameter("user_id") %>">Favorites</a></li>
						<li><a href="journal.jsp?user_id=<%= request.getParameter("user_id") %>">Journal</a></li>
					</ul>
				</nav>
			</div>
		</div>
		
		<div class="container">
			<img id="profilePicture" alt="Profile Picture" src="img/profile_pictures/<%= pic_location %>">
		</div>
		
		<div class="container">
			<div style="float: left; width: 30%; height: 100%">
				<ul class="list-group">
				  <li id="aa1" class="list-group-item">Overview </li>
				  <li id="aa2" class="list-group-item">Work</li>
				  <li id="aa3" class="list-group-item">Education</li>
				  <li id="aa4" class="list-group-item">Story</li>
				  <li id="aa5" class="list-group-item">Details About You</li>
				  <li id="aa6" class="list-group-item">Profile Picture</li>
				</ul>
			</div>
			
			<div style="float: left; padding-left: 50px; width: 70%; height: 100%">
				<div  class="list-group-item">
					<div id="overview" style="margin-left: 30px"><button id="button_overview" class="btn btn-default" style="float: right;">Edit</button>
					  <h2>Overview</h2>
						<table>
							<tr>
								<th> Name</th>
								<td><%= f_name+' '+l_name %></td>
							</tr>
							<tr>
								<th> Email</th>
								<td><%= email_id %></td>
							</tr>
							<tr>
								<th> Gender</th>
								<td><%= gender %></td>
							</tr>
							<tr>
								<th> Birth-Date</th>
								<td><%= b_date %></td>
							</tr>
							<tr>
								<th> Place of Stay</th>
								<td><%= place_of_stay %></td>
							</tr>
							<tr>
								<th> Relationship-Status: </th>
								<td><%= relationship %></td>
							</tr>
						</table>
					</div>
					<div id="work" style="margin-left: 30px"><button id="button_work" class="btn btn-default" style="float: right;">Edit</button>
						<h2>Work</h2>
							<table>
								<tr>
									<th>Occupation</th>
									<td><%= occupation %></td>
								</tr>
								<tr>
									<th>Skills</th>
									<td><%= skills %></td>
								</tr>
								<tr>
									<th>Employment</th>
									<td><%= employment %></td>
								</tr>
							</table>
					</div>
					<div id="education" style="margin-left: 30px"><button id="button_education" class="btn btn-default" style="float: right;">Edit</button>
						<h2>Education</h2>
							<table>
								<tr>
									<td><b>College</b></td>
									<td><b>Major</b></td>
									<td><b>Start-End</b></td>
								</tr>
								<tr>
									<td><%= college %></td>
									<td><%= major %></td>
									<td><%= period %></td>
								</tr>
							</table>
					</div>
					<div id="story" style="margin-left: 30px"><button id="button_story" class="btn btn-default" style="float: right;">Edit</button>
						<h2>Story</h2>
							<table>
								<tr>
									<th>Tagline</th>
									<td><%= tagline %></td>
								</tr>
								<tr>
									<th>Introduction</th>
									<td><%= introduction %></td>
								</tr>
							</table>
					</div>
					<div id="details" style="margin-left: 30px"><button id="button_details" class="btn btn-default" style="float: right;">Edit</button>
						<h2>Details about you</h2>
						<table>
							<tr>
								<th>Nickname</th>
								<td><%= nickname %></td>
							</tr>
							<tr>
								<th>Favorite Quotes</th>
								<td><%= fav_quotes %></td>
							</tr>
						</table>
					</div>
					<div id="profile_pic" style="margin-left: 30px">
						<h2>Profile Picture</h2>
						<form action="add_profile_pic.jsp" encType="multipart/form-data" method="post">
						<table>
							<tr>
								<div class="container"></div>
							</tr>
							<tr>
							<ul>
								<li style="display: inline"><input id="s1" name="file" type="file" value="Choose File"></li><br>
								<li style="display: inline"><input id="s1" type="submit" value="Submit"></li>
							</ul>
							</tr>
						</table>
						</form>
					</div>
					
					<div id="edit_overview">
					<h2>Overview Edit Section</h2>
						<div style="margin-left: 30px">
						<form method="post" action="edit_overview.jsp">
							<table>
								<tr>
									<th> First Name</th>
									<td><input type="text" name="fname" value=<%= f_name %>></td>
								</tr>
								<tr>
									<th> Last Name</th>
									<td><input type="text" name="lname" value=<%= l_name %>></td>
								</tr>
								<tr>
									<th> Email</th>
									<td><input type="email" name="email" value=<%= email_id %>></td>
								</tr>
								<tr>
									<th> Gender</th>
									<td><select name="gender" id="su_6">
										<option value="Male">Male
										</option>
										<option value="Female">Female
										</option>
										</select>
									</td>
								</tr>
								<tr>
									<th> Birth-Date</th>
								<td><select name="date" class="date" id="su_7" style="height: 30px; width: 60px; display: inline;">
									<option value="01">01
									</option>
									<option value="02">02
									</option>
									<option value="03">03
									</option>
									<option value="04">04
									</option>
									<option value="05">05
									</option>
									<option value="06">06
									</option>
									<option value="07">07
									</option>
									<option value="08">08
									</option>
									<option value="09">09
									</option>
									<option value="10">10
									</option>
									<option value="11">11
									</option>
									<option value="12">12
									</option>
									<option value="13">13
									</option>
									<option value="14">14
									</option>
									<option value="15">15
									</option>
									<option value="16">16
									</option>
									<option value="17">17
									</option>
									<option value="18">18
									</option>
									<option value="19">19
									</option>
									<option value="20">20
									</option>
									<option value="21">21
									</option>
									<option value="22">22
									</option>
									<option value="23">23
									</option>
									<option value="24">24
									</option>
									<option value="25">25
									</option>
									<option value="26">26
									</option>
									<option value="27">27
									</option>
									<option value="28">28
									</option>
									<option value="29">29
									</option>
									<option value="30">30
									</option>
									<option value="31">31
									</option>
						</select>
							<select name="month" id="su_8" style="height: 30px; width: 120px;display: inline;">
										<option value="01">January
										</option>
										<option value="02">February
										</option>
										<option value="03">March
										</option>
										<option value="04">April
										</option>
										<option value="05">May
										</option>
										<option value="06">June
										</option>
										<option value="07">July
										</option>
										<option value="08">August
										</option>
										<option value="09">September
										</option>
										<option value="10">October
										</option>
										<option value="11">November
										</option>
										<option value="12">December
										</option>
							</select>
							<input name="year" id="su_9" class="year" type="text" value=<%= year %> size="4" maxlength="4" style="height: 30px; width: 80px; display: inline;" required/> e.g 1976
							</td>
								</tr>
								<tr>
									<th> Place of Stay</th>
									<td><input type="text" name="place_of_stay" value=<%= place_of_stay %>></td>
								</tr>
								<tr>
									<th> Relationship-Status: </th>
									<td><select name="relationship" id="su_10">
										<option value="Single" selected>Single
										</option>
										<option value="Committed">Committed
										</option>
										<option value="Engaged">Engaged
										</option>
										<option value="In a Relationship">In a Relationship
										</option>
										<option value="Married">Married
										</option>
										<option value="Divorced">Divorced
										</option>
										<option value="Widowed">Widowed
										</option>
										</select>
									</td>
								</tr>
								<tr><td><input id="s1" type="submit" value="Submit"><td></tr>
								</table>
							</form>	
						</div>
				</div>
				<div id="edit_work">
					<h2>Work Edit Section</h2>
						<div style="margin-left: 30px">
						<form method="post" action="edit_work.jsp">
							<table>
								<tr>
									<th>Occupation</th>
									<td><input type="text" name="occupation" value=<%= occupation %>></td>
								</tr>
								<tr>
									<th>Skills</th>
									<td><input type="text" name="skills" value=<%= skills %>></td>
								</tr>
								<tr>
									<th>Employment</th>
									<td><input type="text" name="employment" value=<%= employment %>></td>
								</tr>
								<tr><td><input id="s2" type="submit" value="Submit"><td></tr>
							</table>
						</form>
						</div>
				</div>
				<div id="edit_education">
					<h2>Education Edit Section</h2>
						<div style="margin-left: 30px">
						<form method="post" action="edit_education.jsp">
							<table>
								<tr>
									<th>College</th>
									<td><input type="text" name="college" value=<%= college %>></td>
								</tr>
								<tr>
									<th>Major</th>
									<td><input type="text" name="major" value=<%= major %>></td>
								</tr>
								<tr>
									<th>Period</th>
									<td><input type="text" name="period" value=<%= period %>></td>
								</tr>
								<tr><td><input id="s3" type="submit" value="Submit"><td></tr>
							</table>
						</form>
						</div>
				</div>
				<div id="edit_story">
					<h2>Story Edit Section</h2>
						<div style="margin-left: 30px">
						<form method="post" action="edit_story.jsp">
							<table>
								<tr>
									<th>Tagline</th>
									<td><input type="text" name="tagline" value=<%= tagline %>></td>
								</tr>
								<tr>
									<th>Introduction</th>
									<td><input type="text" name="introduction" value=<%= introduction %>></td>
								</tr>
								<tr><td><input id="s4" type="submit" value="Submit"><td></tr>
							</table>
						</form>
						</div>
				</div>
				<div id="edit_details">
					<h2>Details about you Edit Section</h2>
						<div style="margin-left: 30px">
						<form method="post" action="edit_details.jsp">
							<table>
								<tr>
									<th>Nickname</th>
									<td><input type="text" name="nickname" value=<%= nickname %>></td>
								</tr>
								<tr>
									<th>Favourite Quotes</th>
									<td><input type="text" name="fav_quotes" value=<%= fav_quotes %>></td>
								</tr>
								<tr><td><input id="s5" type="submit" value="Submit"><td></tr>
							</table>
						</form>
						</div>
				</div>
			</div>
			</div>
		</div>
		<div style="height: 200px"></div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>