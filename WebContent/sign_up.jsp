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
String f =  request.getParameter("fname");
String l = request.getParameter("lname");
String em =  request.getParameter("su_email");
String p = request.getParameter("su_password");
String g =  request.getParameter("gender");
String d = request.getParameter("date");
String m =  request.getParameter("month");
String y = request.getParameter("year");
String place = request.getParameter("place");
String relationship = request.getParameter("relationship");

 try
 {
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
	 Statement st = con.createStatement();
	 int x = st.executeUpdate("insert into user_details(f_name,l_name,email_id,password,gender,b_date,place_of_stay,relationship_status) values('"+f+"','"+l+"','"+em+"',md5('"+p+"'),'"+g+"','"+y+"-"+m+"-"+d+"','"+place+"','"+relationship+"')");
	 ResultSet rs= st.executeQuery("select user_id from user_details where email_id='"+em+"'");
	 rs.next();
	 int user_id = rs.getInt(1);
	 if(x>0)
	 {
		 session.setAttribute("user",f);
		 session.setAttribute("email_id",em);
		 session.setAttribute("user_id",user_id);
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