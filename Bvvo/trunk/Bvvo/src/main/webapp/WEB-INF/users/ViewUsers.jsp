<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>View all Users</title>
</head>
<body>
<h2><a href="/Bvvo/home.html">Home</a></h2>
<c:choose>
<c:when test="${empty userName}">
<h2 align="right"><a href= "/Bvvo/users/login.html" >Login</a></h2>
</c:when>
<c:otherwise>
<h2 align="right"><a href= "/Bvvo/users/logout.html" >Logout</a></h2>
</c:otherwise>
</c:choose>
<h2>Hello ${userName}</h2>
<center>
<table border="1">
<tr><th>Username</th>
<th>Password</th>
<th>First Name</th>
<th>Last Name</th>
<th>City</th>
<th>State</th>
<th>Zip</th></tr>
<c:forEach items = "${users}" var = "user">
  <tr><td>${user.email}</td>
  <td>${user.password}</td>
  <td>${user.fName}</td>
  <td>${user.lName}</td>
  <td>${user.city}</td>
  <td>${user.state}</td>
  <td>${user.zip}</td></tr>
  </c:forEach>
</table>
</center>
</body>
</html>
