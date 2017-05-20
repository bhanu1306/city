<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Post</title>
</head>
<body>
<% if(session.getAttribute("islogin")==null)
	response.sendError(403,"Do not try to do it again!"); 
	%>
	<%@ include file="Home1.html" %>
	<% 
	String postid =(String)request.getParameter("postid");
	Connection con=null;
			try{
	 Class.forName("com.mysql.jdbc.Driver");
	  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","bhanu");
	  PreparedStatement ps=con.prepareStatement("Delete from posts where postid="+postid);
			int i= ps.executeUpdate();
			if(i!=0)
			{
				out.println("Your post has been successfully deleted!");
			}
			else 
			{
				out.println("Sorry! Internal error has occured");
			}
			}catch(Exception e)
			{
				out.println("Exception! "+e.toString());
			}
			con.close();
	%>
	<%@ include file="Footer.html" %>
</body>
</html>