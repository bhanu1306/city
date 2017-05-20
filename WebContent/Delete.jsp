<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete</title>
</head>
<body>
<% if(session.getAttribute("islogin")==null)
	response.sendError(403,"Do not try to do it again!"); 
	%>
	<%@ include file="Home1.html"%>	
	<% 
	try{
		int userid = (Integer)session.getAttribute("userid");
		Class.forName("com.mysql.jdbc.Driver");
		out.append("Got ID\n");
		out.println("Userid = "+userid+"   ");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","bhanu");
	  out.append("Conn");
	  PreparedStatement ps=con.prepareStatement("Select postid,name,type,contact,address from posts where userid="+userid);
	  out.append("state");
	  ResultSet rs = ps.executeQuery();
	  if(rs==null)
		  out.append("  ResultSet Empty");
	  out.append("exec");
	  while(rs.next())
	  {%>
		  Name: <%=rs.getString("name") %>
		  Type: <%=rs.getString("type") %>
		  Contact: <%=rs.getString("contact") %>
		  Address: <%=rs.getString("address") %>
		  <form action="./Delete_Post.jsp" method="post">
		  <input type="hidden" name="postid" value=<%=rs.getInt("postid") %>>
		  <input type="submit" value="Delete Post">
		  </form>
		<%   out.println("");
	  } 
	  }catch(Exception e)
	  {
		  out.println("Exception!"+e.toString());
	  }%>
	  <%@ include file="Footer.html" %>
</body>
</html>