<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Post Result</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% String status=(String)session.getAttribute("islogin");
   if(!status.equals("true"))
   {%>
   <%@ include file="Home2.html" %>
   <p><font size=+6> Don't you dare try to do it again!</font></p>
	  
   <%}
   else
   {
    try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root" ,"bhanu");
	PreparedStatement ps=con.prepareStatement("insert into posts(userid,name,type,contact,address) values(?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
	Part image=request.getPart("image");
	String name=(String)request.getParameter("name");
	String type=(String)request.getParameter("type");
	String contact=(String)request.getParameter("contact");
	String address=(String)request.getParameter("address");
	String userid=String.valueOf(session.getAttribute("userid"));
	ps.setInt(1, Integer.parseInt(userid));
	ps.setString(2, name);
	ps.setString(3, type);
	ps.setString(4, contact);
	ps.setString(5, address);
	int flag=0;
	int i=ps.executeUpdate();
	out.println("exec");
	ResultSet rs1=ps.getGeneratedKeys();
	rs1.first();
    String postid=String.valueOf(rs1.getInt(1));
	ps.close();
	out.println("image");
	if(i!=0)
	{
		
		out.println("Part got");
		FileOutputStream fout=new FileOutputStream(new File("E:/images/"+postid+".jpg"));
		out.println("out");
		InputStream fin =image.getInputStream();
		out.println("in");
		int c=0;
		while(c!=-1)
		{
			c=fin.read();
			fout.write(c);
		}
		out.println("file write");
		fin.close();
		fout.close();
		flag=1;
	}
	
	%>
	<%@ include file="Home1.html" %>
	<%
	if(flag==0)
	{%>
	
	<p><font size=+5> Sorry! Internal error had occured!</font></p>
	<% }
	else{
		%>
		<p><font size=+5>You have successfully posted!</font></p>
   <%} %>
   <%@ include file="Footer.html" %>
	
<% }catch(Exception e)
    {%>
	<p>Exception occured!</p>
	<% System.out.println(e);
	 out.println(e);
	}
	}%>
	<%@ include file="Footer.html" %>
    
</body>
</html>