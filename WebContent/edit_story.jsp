<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String tagline = request.getParameter("tagline");
	String introduction = request.getParameter("introduction");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
		Statement st = con.createStatement();
		int x = st.executeUpdate("update user_details set tagline='"+tagline+"', introduction='"+introduction+"' where email_id='"+session.getAttribute("email_id")+"'");
		if (x > 0) {
			response.sendRedirect("aboutMe.jsp?user_id="+session.getAttribute("user_id"));
		}
		else {
			out.println("Error");
		}
	}
	catch (Exception e) {
		out.println("Error = "+e.getMessage());
	}
%>
</body>
</html>