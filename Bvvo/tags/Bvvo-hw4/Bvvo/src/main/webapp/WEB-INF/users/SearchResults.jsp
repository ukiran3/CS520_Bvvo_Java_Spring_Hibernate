<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
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
<center>
<table align="center" border="1" cellpadding="2" cellspacing="2" width="60%">
<tr>
<th>Full Name</th>
<th>City</th>
<th>State</th>
<th>Zip</th>
</tr>
<c:forEach items = "${usersFromSearch}" var = "user">
<tr>

  <td valign="top" width="50%"><a href="LawyerProf.html?lawyerId=${user.id}">${user.lName}, ${user.fName}</a></td>
  <td valign="top" width="50%">${user.city}</td>
  <td valign="top" width="50%">${user.state}</td>
  <td valign="top" width="50%">${user.zip}</td>
  
</tr>
  
  </c:forEach>
</table>
</center>
</body>
</html>