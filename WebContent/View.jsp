<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Classifieds</title>
</head>
<%@ page import="java.sql.*" %>
<body>

<% String status=(String)session.getAttribute("islogin");
if(status!=null)
{%>
<%@ include file="Home1.html" %>
	<% }
else{%>
	<%@ include file="Home2.html" %>
<% }
    String choice=(String)request.getParameter("choice");
    out.println(choice);
    if(choice.equals(null))
    {
    	response.sendError(403, "Do not try to do it again!");
    }
    try{
    switch(choice){
    case "All" :
    
      
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","bhanu");
	  PreparedStatement ps=con.prepareStatement("Select postid,name,type,contact,address from posts ");
	  ResultSet rs = ps.executeQuery();
	  while(rs.next())
	  {%>
		  Name: <%=rs.getString("name") %>
		  Type: <%=rs.getString("type") %>
		  Contact: <%=rs.getString("contact") %>
		  Address: <%=rs.getString("address") %>
		  <form action="./View_Post.jsp" method="post">
		  <input type="hidden" name="postid" value=<%=rs.getInt("postid") %>>
		  <input type="submit" value="View Post">
		  </form>
		<%   out.println("");
	  }
	  con.close();
	  break;
	  case "My" :
	      
		  int userid = (Integer)session.getAttribute("userid");
	      Class.forName("com.mysql.jdbc.Driver");
	  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","bhanu");
	  PreparedStatement pss=conn.prepareStatement("Select postid,name,type,contact,address from posts where userid="+userid);
	  ResultSet rss = pss.executeQuery();
	  while(rss.next())
	  {%>
		 Name: <%=rss.getString("name")%>
		  Type: <%=rss.getString("type")%>
		 Contact: <%=rss.getString("contact")%>
		 Address: <%=rss.getString("address")%>
		  <form action="./View_Post.jsp" method="post">
		  <input type="hidden" name="postid" value=<%=rss.getInt("postid") %>>
		  <input type="submit" value="View Post">
		  </form>
		 <% out.println("");
	  }
	  conn.close();
	  break;
	  }
	  }catch(Exception e)
	  {
	  System.out.println(e);
	  }
   %>
   <%@ include file="Footer.html" %>
    
</body>
</html>