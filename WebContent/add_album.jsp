<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
String albname =  request.getParameter("alb_name");
String albdesc = request.getParameter("alb_des");
try
{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
	 Statement st = con.createStatement();
	 int x = st.executeUpdate("INSERT INTO user_albums(user_id,album_name,album_desc) VALUES('"+session.getAttribute("user_id")+"','"+albname+"','"+albdesc+"')");
	 if(x>0)
	 {
		 response.sendRedirect("gallery.jsp?user_id="+session.getAttribute("user_id"));
	 }
	 else
	 {
		 out.println("Error");
	 }
}	 
catch(Exception e)
{
	 out.println("Error = "+ e.getMessage());
}
%>
</body>
</html>