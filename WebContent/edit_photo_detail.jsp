<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String photo_name = request.getParameter("edit_photo_name");
    String photo_desc = request.getParameter("edit_photo_desc");
    int photo_id = Integer.parseInt(request.getParameter("photo_id"));
    try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
		Statement st = con.createStatement();
		int x = st.executeUpdate("update user_photos set photo_name='"+photo_name+"', photo_desc='"+photo_desc+"' where photo_id='"+photo_id+"'");
		if (x > 0) {
			response.sendRedirect("gallery.jsp?user_id="+session.getAttribute("user_id"));
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