<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Login</title>
</head>
<body>
<h2><a href="/Bvvo/home.html">Home</a></h2>
<center>
<form action="j_security_check" method = "post">
<table>
  <tr>
    <td>Username</td>
    <td><input type="text" name="j_username" /> </td>
  </tr>
  <tr>
    <td>Password:</td>
    <td><input type="password" name="j_password" /> </td>
  </tr>
  <tr>
    <td colspan="2"><input type="submit" name = "login" value="Login" /></td>
  </tr>
</table>
</form>
</center>
</body>
</html>
