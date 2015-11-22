<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Bvvo - Front Page</title>
</head>
<body>
<center><h1>Welcome to BVVO!</h1></center>
<security:authorize access="isAnonymous()">
<h2 align="right"><a href= "/Bvvo/spring_security_login" >Login</a></h2>
</security:authorize>

<security:authorize access="isAuthenticated()">
<h2 align="left"><a href= "/Bvvo/users/edit.html" >edit</a></h2>
<h2 align="right"><a href="<c:url value='/j_spring_security_logout' />">Logout</a></h2>
</security:authorize>
<ul>
  <!-- <li><a href="/Bvvo/home.html">Home</a></li>
  <li><a href="/Bvvo/users/upload.html">File</a></li>
  <li><a href="/Bvvo/users/ViewUsers.html">User Management</a></li>  -->
  <li><a href="/Bvvo/users/UserSignUp.html?type=user">Sign up as User</a></li>
  <li><a href="/Bvvo/users/UserSignUp.html?type=lawyer">Sign up as Lawyer</a></li>
  <li><a href="/Bvvo/users/UserSignUp.html?type=admin">Sign up as Administrator</a></li>
</ul>
<center><h2><a href= "/Bvvo/users/search.html" >Search for a lawyer.</a></h2></center>
<center>
<form action = "">
<table>
<tr>
</tr>
</table>
</form>
</center>
</body>
</html>
