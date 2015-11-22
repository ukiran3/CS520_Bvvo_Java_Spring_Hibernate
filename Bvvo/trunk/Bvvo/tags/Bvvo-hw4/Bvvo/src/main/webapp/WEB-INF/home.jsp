<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Bvvo - Front Page</title>
</head>
<body>
<center><h1>Welcome to BVVO!</h1></center>
<c:choose>
<c:when test="${empty userName}">
<h2 align="right"><a href= "/Bvvo/users/login.html" >Login</a></h2>
</c:when>
<c:otherwise>
<h2 align="right"><a href= "/Bvvo/users/logout.html" >Logout</a></h2>
</c:otherwise>
</c:choose>
<ul>
  <li><a href="/Bvvo/home.html">Home</a></li>
  <li><a href="/Bvvo/users/ViewUsers.html">User Management</a></li>
  <li><a href="/Bvvo/users/UserSignUp.html?type=user">User Registration</a></li>
  <li><a href="/Bvvo/users/UserSignUp.html?type=lawyer">Lawyer Registration</a></li>
</ul>
<center><h2><a href= "/Bvvo/users/search.html" >Search for a lawyer.</a></h2></center>
<center>
<form action = "">
<table>
<tr>
<td>Search</td>
</tr>
</table>
</form>
</center>
</body>
</html>
