<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Photographic Exposition</title>
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
			</style>
			<script>
		function validate()
		{
			var e = document.getElementById("su_3").value;
			var p = document.getElementById("su_4").value;
			var rp = document.getElementById("su_5").value;
			var str = "\n";
			var res = true;
			if(e.length < 5)
			{
			  str += "Email more than 5 characters required.\n";
			  res = false;
			}
			if (!((e.indexOf(".") > 0) && (e.indexOf("@") > 0)) || (/[^a-zA-Z0-9.@_-]/.test(e)))
		    {
		      str += "Email address invalid.\n";
		      res = false;
		    }
		    
			if(p.length < 5)
			{
			  str += "Password more than 5 characters required.\n";
			  res = false;
			}
		    if(rp != p)
			{
			  str += "Password doesn't match \n";
			  res = false;
			}
			if(!/[a-z]/.test(p) || !/[0-9]/.test(p))
			{
			  str += "Password should have one of each a-z, 0-9.\n";
			  res = false;
		    }
			if(res == false)
			{
			alert(str);
			}
			return res;
		}
		</script>
		<script>
		$(function() {
			  $('#checkbox1').click(function(){
			    $("#checkbox1").attr('src',"images/checkbox1.jpg");
			  });
			});
		</script>
	</head>
	<body id="top">
	<% 
	session = request.getSession(false);
	if(session != null)
	{
		session.removeAttribute("user_id");
		session.removeAttribute("user");
		session.removeAttribute("email_id");
		session.invalidate();
	}
	%>
			<header id="header" class="skel-layers-fixed">
				<h1 id="header1"><a href="#">Photographic Exposition</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="blog.jsp"></a>Blog</li>
						<li><a href="about_us.jsp"></a>About Us</li>
						
						<li><a href="#openModal1">Contact Us</a></li>
							<div id="openModal1" class="modalDialog">
								<div>
									<a href="#close" title="Close" class="close">X</a>
										<h1 style="margin-top: 20px; font-weight: bold;">Write your message here</h1>
										  <form method="post" action="index.html">
											<p style="color: black"><input style="display:inline; margin-top: 60px;height: 30px;" type="text" name="username" id="b1" placeholder="Email address" required></p>
											<p style="color: black"><input style="height: 30px;" type="password" name="text" value="" id="b2" placeholder="Subject" required></p>
											<textarea style="height:100px; width: 450px;" required></textarea>
											<p style="margin-top: 20px;" class="submit"><input type="submit" name="contact" value="Submit"></p>
										  </form>
								</div>
							</div>	
						
						
						<li><button class="button" type="button" data-toggle="modal" data-target="#openModal2">Sign In</button></li>
							<div style="margin-top: 50px;" id="openModal2" class="modal fade" role="dialog" style="z-index: 100000;">
								<div class="modal-dialog">
						      <!-- Modal content-->
							      <div class="modal-content">
								        <div class="modal-header">
								          <button type="button" class="close" data-dismiss="modal">&times;</button>
								          <h4 class="modal-title">Sign In Here</h4>
								        </div>
								        <div class="modal-body">
									          <p>
									          		  <form method="post" action="sign_in.jsp">
														<p style="color: black"><input style="margin-top: 20px;" type="text" name="email" id="a1" value="" placeholder="Email address" required></p>
														<p style="color: black"><input type="password" name="pass" value="" id="a2" placeholder="Password" required></p>
														<p style="color: black"><img src="images\checkbox.jpg" id="checkbox1" height="20px" width="20px" onclick="changeImage()">&nbsp Remember me</p>
														<p class="submit"><input type="submit" name="signin" value="Sign in"> <a style="color: red;margin-top: -10px;"> Forgot your password? </a></p>
													  </form>
											  </p>
								        </div>
							      </div>
						      </div>
						    </div>
						
						<li><a href="#openModal3" class="button special" type="button" data-toggle="modal" data-target="#openModal3">Sign Up</a></li>
							<div style="margin-top: 30px;" id="openModal3" class="modal fade" role="dialog">
								<div class="modal-dialog">
						      <!-- Modal content-->
							      <div class="modal-content">
								        <div class="modal-header">
								          <button type="button" class="close" data-dismiss="modal">&times;</button>
								          <h4 class="modal-title">Sign Up Here</h4>
								        </div>
								        <div class="modal-body">
										  <form method="post" action="sign_up.jsp">
											<p style="color: black;"><input style="margin-top: 10px;height: 30px;" type="text" name="fname" id="su_1" placeholder="First Name" required></p>
											<p style="color: black;"><input style="height: 30px;" type="text" name="lname" id="su_2" placeholder="Last Name" required></p>
											<p style="color: black;"><input style="height: 30px;" type="email" name="su_email" id="su_3" placeholder="Email Address" required></p>
											<p style="color: black;"><input style="height: 30px;" type="password" name="su_password" id="su_4" placeholder="Password" required></p>
											<p style="color: black;"><input style="height: 30px;" type="password" name="su_rpassword" id="su_5" placeholder="Repeat Password" required></p>
											<p style="color: black;margin-top:-25px;">Gender:
																		<select name="gender" id="su_6">
																			<option value="Male" selected>Male
																			</option>
																			<option value="Female">Female
																			</option>
																		</select>
											</p>
											<p style="color: black;">Birth Date:
																		<select name="date" class="date" id="su_7" style="height: 30px; width: 60px; display: inline;">
																					<option value="01" selected>01
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
																					<option value="01" selected>January
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
												<input name="year" id="su_9" class="year" type="text" size="4" maxlength="4" style="height: 30px; width: 80px; display: inline;" required/> e.g 1976
											</p>
											<p style="color: black">Place of Stay: <input type="text" name="place" required></p>
											<p style="color: black">Relationship-Status: <select name="relationship" id="su_10">
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
										</p>
											<p style="color: black"><img src="images\checkbox1.jpg" id="checkbox2" height="20px" width="20px">&nbsp;I agree to the <a href="#">Terms and Condition</a><p>
											<p class="submit"><input type="submit" onclick= "return validate();" class="button special" name="signup" value="Sign up"></p>
										  </form>
								        </div>
							      </div>
						      </div>
						    </div>
					</ul>
				</nav>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<h2>This is Photographic Exposition Website</h2>
					<p>Here you can showcase your Photographic skills, share your ideas and many more. <br/><br/><a href="http://templated.co">Become a member now !</a></p>
					<ul class="actions">
						<li><a href="#openModal3" class="button big special">Sign Up</a></li>
						<li><a href="#elements" class="button big alt">Learn More</a></li>
					</ul>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style1">
				<header class="major">
					<h2>Category-Wise Winners</h2>
					<p>Winners list in various categories of Photography</p>
				</header>
				<div class="container">
					<div class="row">
						<div class="4u">
							<section class="special box">
								<i class="icon fa-area-chart major"></i>
								<h3>Category Name</h3>
								<p>Photo Name:</p>
								<p>Credits:</p>
								<ul class="actions">
									<li><a href="#" class="button alt">Visit Profile</a></li>
								</ul>
							</section>
						</div>
						<div class="4u">
							<section class="special box">
								<i class="icon fa-refresh major"></i>
								<h3>Category Name</h3>
								<p>Photo Name</p>
								<p>Credits:</p>
								<ul class="actions">
									<li><a href="#" class="button alt">Visit Profile</a></li>
								</ul>
							</section>
						</div>
						<div class="4u">
							<section class="special box">
								<i class="icon fa-cog major"></i>
								<h3>Category Name</h3>
								<p>Photo Name</p>
								<p>Credits:</p>
							    <ul class="actions">
									<li><a href="#" class="button alt">Visit Profile</a></li>
								</ul>
							</section>
						</div>
					</div>
				</div>
			</section>
			
		<!-- Two -->
			<section id="two" class="wrapper style2">
				<header class="major">
					<h2>Today's Winner</h2>
					<p>2 Winners for Today based on Maximum Likes</p>
				</header>
				<div class="container">
					<div class="row">
						<div class="6u">
							<section class="special">
								<a href="#" class="image fit"><img src="images/pic01.jpg" alt="" /></a>
								<h3>1st Winner</h3>
								<p>Photo Name</p>
								<p>Credits:</p>
								<ul class="actions">
									<li><a href="#" class="button alt">Visit Profile</a></li>
								</ul>
							</section>
						</div>
						<div class="6u">
							<section class="special">
								<a href="#" class="image fit"><img src="images/pic02.jpg" alt="" /></a>
								<h3>2nd Winner</h3>
								<p>Photo Name</p>
								<p>Credits:</p>
								<ul class="actions">
									<li><a href="#" class="button alt">Visit Profile</a></li>
								</ul>
							</section>
						</div>
					</div>
				</div>
			</section>

		<!-- Three -->
			<section id="three" class="wrapper style1">
				<div class="container">
					<div class="row">
						<div class="8u">
							<section>
								<h2>Most Liked Picture</h2>
								<a href="#" class="image fit"><img src="images/pic03.jpg" alt="" /></a>
								<p>Vis accumsan feugiat adipiscing nisl amet adipiscing accumsan blandit accumsan sapien blandit ac amet faucibus aliquet placerat commodo. Interdum ante aliquet commodo accumsan vis phasellus adipiscing. Ornare a in lacinia. Vestibulum accumsan ac metus massa tempor. Accumsan in lacinia ornare massa amet. Ac interdum ac non praesent. Cubilia lacinia interdum massa faucibus blandit nullam. Accumsan phasellus nunc integer. Accumsan euismod nunc adipiscing lacinia erat ut sit. Arcu amet. Id massa aliquet arcu accumsan lorem amet accumsan commodo odio cubilia ac eu interdum placerat placerat arcu commodo lobortis adipiscing semper ornare pellentesque.</p>
							</section>
						</div>
						<div class="4u">
							<section>
								<h3>Photo Name</h3>
								<p>Credits:</p>
								<ul class="actions">
									<li><a href="#" class="button alt">Visit Profile</a></li>
								</ul>
							</section>
							<hr />
							<section>
								<h3>News Feeds</h3>
								<ul class="alt">
									<li><a href="#">Erat blandit risus vis adipiscing</a></li>
									<li><a href="#">Tempus ultricies faucibus amet</a></li>
									<li><a href="#">Arcu commodo non adipiscing quis</a></li>
									<li><a href="#">More -></a></li>
								</ul>
							</section>
						</div>
					</div>
				</div>
			</section>			
			
		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<div class="row double">
						<div class="6u">
							<div class="row collapse-at-2">
								<div class="6u">
									<h3>Accumsan</h3>
									<ul class="alt">
										<li><a href="#">Nascetur nunc varius</a></li>
										<li><a href="#">Vis faucibus sed tempor</a></li>
										<li><a href="#">Massa amet lobortis vel</a></li>
										<li><a href="#">Nascetur nunc varius</a></li>
									</ul>
								</div>
								<div class="6u">
									<h3>Faucibus</h3>
									<ul class="alt">
										<li><a href="#">Nascetur nunc varius</a></li>
										<li><a href="#">Vis faucibus sed tempor</a></li>
										<li><a href="#">Massa amet lobortis vel</a></li>
										<li><a href="#">Nascetur nunc varius</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="6u">
							<h2>Share this page</h2>
							<p>Brief about our website</p>
							<ul class="icons">
								<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
								<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
								<li><a href="#" class="icon fa-pinterest"><span class="label">Pinterest</span></a></li>
							</ul>
						</div>
					</div>
					<ul class="copyright">
						<li>&copy; Untitled. All rights reserved.</li>
						<li>Design: <a href="http://templated.co">TEMPLATED</a></li>
						<li>Images: <a href="http://unsplash.com">Unsplash</a></li>
					</ul>
				</div>
			</footer>
	</body>
</html>