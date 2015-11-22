<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Add User</title>
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
<h2>
<!-- <a href="<c:url value='/users/UserRegistration.html' />">User Registration Form</a> &gt;
Create New User  -->
</h2>

<form:form modelAttribute="userForSearch" method = "post">
<table align="center" border="1" cellpadding="2" cellspacing="2" width="60%">
<tbody>
<tr>
    <td valign="top" width="50%">Name: <br /></td>
    <td valign="top"><form:input path="email" style="width: 100%;" ></form:input></td>
</tr>
<tr>
    <td valign="top" width="50%">City, State, and/or Zip Code: <br /></td>
    <td valign="top"><form:input path="city" style="width: 100%;" ></form:input></td>
</tr>
<tr>
    <td valign="top" width="50%">Area of Expertise: <br /></td>
    <td><form:select style="width: 100%;" path = 'areaOfExpertise'>
    <form:option value = "0">(NONE)</form:option>
    <form:option value = "Criminal Law">Criminal Law</form:option>
    <form:option value = "Business Law">Business Law</form:option>
    <form:option value = "Family Law">Family Law</form:option>
    <form:option value = "Immigration Law">Immigration Law</form:option>
    </form:select></td>
</tr>
</tbody>
</table>
<input type = "submit" name = "submit" value = "submit" />
</form:form>
</body>
</html>
