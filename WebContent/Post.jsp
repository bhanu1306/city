<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Post Classifieds</title>
</head>
<body>
<% String status=(String)session.getAttribute("islogin");
   if(!status.equals("true"))
   {%>
   <%@ include file="Home2.html" %>
   <p><font size=+5> You need to login first to post classifieds!</font></p>
   <% }
   else
   {%>
   <%@ include file="Home1.html" %>
   <form action="./Post_Result.jsp" method="post" enctype="multipart/form-data">
   Name:<input type="text" name="name"> <br>
   Bank:<input type="radio" name="type" value="Bank">
   School:<input type="radio" name="type" value="School">
   Hospital:<input type="radio" name="type" value="Hospital">
   Hotel:<input type="radio" name="type" value="Hotel">
   Restaurant:<input type="radio" name="type" value="Restaurant"><br>
   Contact:<input type="text" name="contact"><br>
   Address:<input type="text" name="address"><br>
   Choose Image:<input type="file" name="image"><br>
   <input type="submit" name="Post">
   </form>
 
  <% }%>
  <%@ include file="Footer.html" %>
</body>
</html>