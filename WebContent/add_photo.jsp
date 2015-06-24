<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.io.*,java.sql.*,java.io.File,java.io.IOException,java.util.List,javax.servlet.annotation.WebServlet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="org.apache.tomcat.util.http.fileupload.FileItem" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileItemFactory" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileUploadException" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.RequestContext" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext" %>
<%

		  if(!ServletFileUpload.isMultipartContent(request))
		  {
		   out.println("Nothing to upload");
		   return; 
		  }

		  FileItemFactory itemfactory = new DiskFileItemFactory(); 
		  ServletFileUpload upload = new ServletFileUpload(itemfactory);
		  
		  try{
		   List<FileItem>  items = upload.parseRequest(new ServletRequestContext(request));
			   for(FileItem item:items)
			   {
			     
			    String contentType = item.getContentType();
			    if(!contentType.equals("image/jpeg"))
			    {
			     out.println("only jpeg format image files supported");
			     continue;
			    }
			    File uploadDir = new File("/Users/dhruvchawla/Documents/workspace/JavaProject01/Project/WebContent/img/Albums");
			    File file = File.createTempFile("img",".jpeg",uploadDir);
			    item.write(file);
			    String str=file.toString();
			    int len = str.length();
			    int index=str.lastIndexOf('/');
			    String path =str.substring(index+1,len);
			    
	        	  	 Class.forName("com.mysql.jdbc.Driver");
					 Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/photo.expo","root","");
					 Statement st = con.createStatement();
					 int x = st.executeUpdate("INSERT INTO user_photos(user_id,album_id,photo_location) VALUES('"+session.getAttribute("user_id")+"','"+session.getAttribute("alb_id12")+"','"+path+"')");
					 if(x>0)
					 {
						 response.sendRedirect("gallery.jsp?user_id="+session.getAttribute("user_id"));
					 }	
					 else
					 {
						 out.println("Error");
					 } 
			    
			   }
		  }
		  catch(FileUploadException e)
		  {  
		   out.println("upload fail");
		  }
		  catch(Exception ex)
		  {
		   out.println("can't save" + ex);
		  }
		  %>		  
</body>
</html>