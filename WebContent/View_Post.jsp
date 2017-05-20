<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Post</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.awt.image.*" %>
<%@ page import="javax.imageio.*" %>
<% String status=(String)session.getAttribute("islogin");  
if(status!=null)
{%>
<%@ include file="Home1.html" %>
	<% }
else{%>
	<%@ include file="Home2.html" %>
<% }
String postid=request.getParameter("postid");
  %>
  
  <% try{
     //File img=new File("/home/bhanu/"+postid+".jpg");
     //out.append("" + img.canRead());
     //FileDescriptor fd=new FileInputStream(img).getFD();
     
     /*out.append(fd.toString());
     out.append("-"+new FileInputStream(img).available()+"-22");
     FileInputStream inn=new FileInputStream(img);
     File inside=new File("./"+postid+".jpg");
     out.append(" per=== " +inside.canWrite() );
     FileOutputStream outt=new FileOutputStream(inside);
     int c=0;
     while(c!=-1)
     {
    	 c=inn.read();
    	 outt.write(c);
     }
    out.println(new FileInputStream(inside).available());
  BufferedImage innn= ImageIO.read(img);
  ImageIO.write(innn,"image/jpg",response.getOutputStream());*/
  
     
  %>
  
  <img alt="null" src="E:/images/"<%out.append(postid);%>.jpg"><br>
  <% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","bhanu");
    PreparedStatement ps=con.prepareStatement("Select * from posts where postid="+postid);
    ResultSet rs = ps.executeQuery();
    while(rs.next())
    {%>
    	<%=rs.getString("name")%><br>
    	<%=rs.getString("type")%><br>
    	<%=rs.getString("contact")%><br>
    	<%=rs.getString("address")%><br>
    <%}
    con.close();
   
   
    }catch(Exception e)
    {
    	System.out.println(e);
    	out.append("  "+e.toString());
    }%>
    <%@ include file="Footer.html" %>
    
</body>
</html>  