<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign-Up</title>
</head>
<body>
<h2><a href="/Bvvo/home.html">Home</a></h2>
<!-- <c:choose>
<c:when test="${empty userName}">
<h2 align="right"><a href= "/Bvvo/users/login.html" >Login</a></h2>
</c:when>
<c:otherwise>
<h2 align="right"><a href= "/Bvvo/users/logout.html" >Logout</a></h2>
</c:otherwise>
</c:choose> -->
<center>
<span style="color: red;"><h1>Sign up as ${userType}</h1></span>
<form:form modelAttribute="user" method="post" enctype="multipart/form-data">
<table align="center" border="1" cellpadding="2" cellspacing="2" width="60%">
  <tbody>
    <tr>
      <td valign="top" width="50%">Username*: <br /></td>
      <td valign="top"><form:input style="width: 98%;" path = "username" /><span style="color: red;"><form:errors path = "username" /></span><br></td>
    </tr>
    <tr>
      <td valign="top">Password*:<br></td>
      <td valign="top"><form:password path="password" style="width: 98%;" /><span style="color: red;"><form:errors path = "password" /></span><br><br></td>
    </tr>
 <!--    <tr>
      <td valign="top">Retype password*:<br></td>
      <td valign="top"><form:password path="password" style="width: 100%;"></form:password><br></td>
    </tr>
     -->
    <tr>
      <td valign="top">First Name*: <br></td>
      <td valign="top"><form:input style="width: 98%;" path = "fName" type="text" /> <span style="color: red;"><form:errors path = "fName" /></span><br><br></td>
    </tr>
    <tr>
      <td valign="top">Last Name*:<br></td>
      <td valign="top"><form:input style="width: 98%;" path = "lName" /><span style="color: red;"><form:errors path = "lName" /></span><br><br></td>
    </tr>
    <tr>
    <td>Street Address(optional):</td>
    <td><form:textarea cols = '30' rows = '5' path = 'stAddress'></form:textarea></td>
    </tr>
    <tr>
    <td>City*:<form:input path = 'city'/><span style="color: red;"><form:errors path = "city" /></span><br></td>
    <td>State*:<form:input size = '20' path = 'state' /> <span style="color: red;"><form:errors path = "state" /></span><br></td>
    </tr>
    <tr>
    <td>Zip*:</td>
    <td><form:input path = 'zip' value='90032' onFocus="if(value == '90032'){value=''}" /><span style="color: red;"><form:errors path = "zip" /></span><br></td>
    </tr>
    <c:choose>
    <c:when test = "${userType eq 'lawyer'}">
    <tr>
    <td>Areas of Expertise*:</td>
    <td><form:select path = 'areaOfExpertise'>
    <form:option value = "Criminal Law">Criminal Law</form:option>
    <form:option value = "Business Law">Business Law</form:option>
    <form:option value = "Family Law">Family Law</form:option>
    <form:option value = "Immigration Law">Immigration Law</form:option>
    </form:select><span style="color: red;"> <form:errors path = "areaOfExpertise" /></span><br></td>
    </tr>
    <tr>
    <td>Year practice started*:</td>
    <td>(yyyy)<form:input path = "year" /><span style="color: red;"><form:errors path = "year" /></span><br></td> 
   	</tr>
    <tr>
    <td>Upload Image:</td>
    <td><input type="file" name="fileUp" id = "file"></td>
    </tr>
    </c:when></c:choose>
  	<c:if test = "${userType eq 'user'}">
    <form:hidden path="user_type" value="ROLE_USER"></form:hidden>
    </c:if>
    <c:if test = "${userType eq 'lawyer'}">
    <form:hidden path="user_type" value="ROLE_LAWYER"></form:hidden>
    </c:if>
    <c:if test = "${userType eq 'admin'}">
    <form:hidden path="user_type" value="ROLE_ADMIN"></form:hidden>
    </c:if>
  </tbody>
</table>
<input type = "submit" name = "submit" value = "Sign Up" style = "font-size:30px" />
	</form:form>
	</center>
</body>
</html>