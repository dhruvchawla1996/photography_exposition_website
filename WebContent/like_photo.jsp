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
	int user_id = Integer.parseInt(request.getParameter("user_id"));
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("select likes from user_photos where user_id="+user_id);
		int likes = rs1.getInt(1) + 1;
		int x = st2.executeUpdate("update user_photos set likes="+likes+" where user_id="+user_id);
		if (x>0) {
			response.sendRedirect("gallery.jsp?user_id="+user_id);
		}
	}
	catch (Exception e) {
		out.println("Error= "+e.getMessage());
	}
%>
</body>
</html>