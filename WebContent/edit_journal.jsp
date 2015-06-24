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
	String name = request.getParameter("t_name");
	String message = request.getParameter("message");
	String id = request.getParameter("t_id");
	String user_id = request.getParameter("user_id");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
		Statement st = con.createStatement();
		int x = st.executeUpdate("update user_journal set title_name='"+name+"', message='"+message+"' where title_id='"+id+"'");
		if (x > 0) {
			response.sendRedirect("journal.jsp?user_id="+user_id);
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