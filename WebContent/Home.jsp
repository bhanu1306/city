<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home.jsp</title>
</head>
<body>
<% String status=(String)session.getAttribute("islogin");
   if(status!=null)
   {%>
   <%@ include file="Home1.html" %>
   <%@ include file="Middle1.html" %>
   <% }
   else{ 
    %>
    <%@ include file="Home2.html" %>
    <%@ include file="Middle2.html" %> 
    <% }
      %>
      <%@ include file="Footer.html" %>
      
</body>
</html> 