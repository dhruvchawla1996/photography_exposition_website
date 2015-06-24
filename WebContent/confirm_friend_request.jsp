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
		int from_id = Integer.parseInt(request.getParameter("from_id"));
		int to_id = Integer.parseInt(session.getAttribute("user_id").toString());
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
			Statement st = con.createStatement();
			int x = st.executeUpdate("insert into friends(from_id, to_id) values("+from_id+", "+to_id+")");
			x = st.executeUpdate("insert into friends(from_id, to_id) values("+to_id+", "+from_id+")");
			x = st.executeUpdate("delete from friend_requests where from_id="+from_id+" and to_id="+to_id);
			if (x>0) {
				response.sendRedirect("friends.jsp?user_id="+session.getAttribute("user_id"));
			}
		}
		catch (Exception e) {
			out.println("Error= "+e.getMessage());
		}
	%>
</body>
</html>