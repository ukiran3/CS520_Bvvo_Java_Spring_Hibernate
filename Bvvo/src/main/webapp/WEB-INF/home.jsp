<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Bvvo - Front Page</title>
</head>
<body>
<h2 align="left"><a href= "/Bvvo/users/Signup.html" >Sign up</a></h2>
<security:authorize access="isAnonymous()">
<h2 align="right"><a href= "/Bvvo/spring_security_login" >Login</a></h2>
</security:authorize>

<security:authorize access="isAuthenticated()">
<h2 align="left"><a href= "/Bvvo/users/edit.html" >Edit profile!</a></h2>
<h2 align="right"><a href="<c:url value='/j_spring_security_logout' />">Logout</a></h2>
</security:authorize>

<center><h1>Welcome to BVVO!</h1></center>
<br/><br/>
<center>
<form action="/Bvvo/users/ReviewFts.html" method = "post">

<span><h3>Full text Search for review:</h3></span>

<table border="1" cellpadding="2" cellspacing="2" width="60%">
<tbody>
<tr>
    <td valign="top" style="font-size:20px; font-weight:bold" width="50%">Keyword*: <br /></td>
    <td valign="top"><input style="width: 98%;" name="text"/></td>
</tr>
</tbody>
</table>
</form>

<br/><br/>
<h2>Click here to <a href= "/Bvvo/users/search.html" >Search for a lawyer</a>.</h2>
</center>
</body>
</html>
