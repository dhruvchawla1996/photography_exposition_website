<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*, java.sql.*"%>
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
String title = request.getParameter("journal_title");
String message = request.getParameter("journal_message");
try
{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
	 Statement st = con.createStatement();
	 int x = st.executeUpdate("insert into user_journal(user_id,title_name,message) values('"+session.getAttribute("user_id")+"','"+title+"','"+message+"')");
	 if(x>0)
	 {
		 response.sendRedirect("journal.jsp?user_id="+session.getAttribute("user_id"));
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