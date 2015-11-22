<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Write a review!</title>
</head>
<body>
<h2><a href="/Bvvo/home.html">Home</a></h2>
<center>
<form:form modelAttribute = "WriteRev" method = "post">

<h2>Write a review on this lawyer:</h2>

<table border="1" cellpadding="2" cellspacing="2" width="60%">
<tbody>
<tr>
    <td valign="top" style="font-size:20px; font-weight:bold" width="50%">Title*: <br /></td>
    <td valign="top"><form:input style="width: 100%;" path = "title"></form:input><br></td>
</tr>
<tr>
    <td valign="top" width="50%"><h3>Message*: </h3><br /></td>
    <td valign="top"><form:textarea style="width: 100%;" rows = "10" cols = "20" path = "message" ></form:textarea><br></td>
</tr>
<tr>
	<td valign="top" width="50%"><h3>Ratings*: </h3><br /></td>
    <td><h3>Knowledge*:</h3><form:radiobutton path = "knowledge" value = "1"></form:radiobutton><form:radiobutton path = "knowledge" value = "2"></form:radiobutton><form:radiobutton path = "knowledge" value = "3"></form:radiobutton><form:radiobutton path = "knowledge" value = "4"></form:radiobutton><form:radiobutton path = "knowledge" value = "5"></form:radiobutton>
    <h3>Service*:</h3><form:radiobutton path = "service" value = "1"></form:radiobutton><form:radiobutton path = "service" value = "2"></form:radiobutton><form:radiobutton path = "service" value = "3"></form:radiobutton><form:radiobutton path = "service" value = "4"></form:radiobutton><form:radiobutton path = "service" value = "5"></form:radiobutton>
    <h3>Overall*:</h3><form:radiobutton path = "overall" value = "1"></form:radiobutton><form:radiobutton path = "overall" value = "2"></form:radiobutton><form:radiobutton path = "overall" value = "3"></form:radiobutton><form:radiobutton path = "overall" value = "4"></form:radiobutton><form:radiobutton path = "overall" value = "5"></form:radiobutton>
<br></td>
</tr>
</tbody>
</table>
<form:hidden path="date" value = "${date}"></form:hidden>
<form:hidden path="user.id" value = "${Rev_User}"></form:hidden>
<form:hidden path="lawyer.id" value = "${Rev_Lawyer}"></form:hidden>
<input type = "submit" style = "font-size:30px" value = "Submit this review!" name = "submit">
</form:form>
</center>
<h2>* - Required fields</h2>

</body>
</html>