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
String em =  request.getParameter("email");
String p = request.getParameter("pass");


 try
 {
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
	 Statement st = con.createStatement();
	 ResultSet rs= st.executeQuery("select * from user_details where email_id='"+em+"' and password=md5('"+p+"')");
	 if(rs.next())
	 {
		 int user_id = rs.getInt(1);
		 session.setAttribute("user",rs.getString(2));
		 session.setAttribute("user_id",user_id);
		 session.setAttribute("email_id",em);
		 response.sendRedirect("userProfile.jsp?user_id="+user_id);
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