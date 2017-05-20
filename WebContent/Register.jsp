<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<body>
<%@ include file="Home2.html" %>
<form action="./register" method="post">
<input type="text" name="email"><br>
<input type="text" name="password"><br>
<input type="text" name="phone"><br>
<input type="text" name="address"><br>
<input type="submit" value="Register">
</form>
<%@ include file="Footer.html"%>
</body>
</html>