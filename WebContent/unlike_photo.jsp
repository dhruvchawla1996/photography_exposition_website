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
	session=request.getSession(false);
	if(session.getAttribute("user_id")==null)
	{
	    response.sendRedirect("index.jsp");
	}
%>
<%
	int user_id = Integer.parseInt(request.getParameter("user_id"));
	int photo_id = Integer.parseInt(request.getParameter("photo_id"));
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
		Statement st1 = con.createStatement();
		int x = st1.executeUpdate("delete from likes where photo_id="+photo_id+" and user_id="+session.getAttribute("user_id"));
		if (x>0) {
			response.sendRedirect("gallery.jsp?user_id="+user_id);
		}
		else {
			out.println("Error");
		}
	}
	catch (Exception e) {
		out.println("Error= "+e.getMessage());
	}
%>
</body>
</html>