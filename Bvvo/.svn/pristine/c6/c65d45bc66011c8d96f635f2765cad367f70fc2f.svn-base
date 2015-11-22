<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lawyer profile</title>
</head>
<body>
<h2><a href="/Bvvo/home.html">Home</a></h2>

<security:authorize access="isAnonymous()">
<h2 align="right"><a href= "/Bvvo/spring_security_login" >Login</a></h2>
</security:authorize>

<security:authorize access="isAuthenticated()">
<h2 align="left"><a href= "/Bvvo/users/edit.html" >Edit profile!</a></h2>
<h2 align="right"><a href="<c:url value='/j_spring_security_logout' />">Logout</a></h2>
</security:authorize>

<c:if test="${not empty lawyerProf.largeImg}">
<img src="/Bvvo/users/getImage.html?type=large&id=${lawyerProf.id}"></img>
</c:if>
<c:if test="${empty lawyerProf.largeImg}">
<img src="http://cs3.calstatela.edu:8080/cs520stu03/imgs/default.jpg" width="112" height="149"></img>
</c:if>

<h2>Hello ${lawyerProf.lName} , ${lawyerProf.fName}</h2>
<center>
<h3>Ratings (after ${fn:length(reviewsById)} reviews):</h3>
<table align="center" border="1" cellpadding="2" cellspacing="2" width="60%">
<tr>
<td>Overall</td>
<td>Knowledge</td>
<td>Service</td>
</tr>
<tr>
<td valign="top" width="50%">${know}</td>
<td valign="top" width="50%">${serv}</td>
<td valign="top" width="50%">${over}</td>
</tr>
</table>
</center>
<c:choose>
<c:when test = "${fn:length(reviewsById) > 0}">
<h2>There are ${fn:length(reviewsById)} review(s) about this Lawyer:</h2>
<ol>
<c:forEach items = "${reviewsById}" var="review">
<li>
<c:choose>
<c:when test="${review.id ne param.revId}">
<span style = "color:red; font-size:50px; font-style:italic">
${review.title}
</span>
by ${review.user.username} at <fmt:formatDate value="${review.date}" pattern="MMM dd, yyyy hh:mm a" />
<div style = "color:green; font-size:30px">
${review.message} </div>
<table><tbody><tr><td>My Ratings ::: </td><td>Knowledge : ${review.knowledge} / 5, </td><td>Service : ${review.service} / 5, </td><td>Overall : ${review.overall} / 5.</td></tr></tbody></table>
</c:when>
<c:otherwise>
<form:form modelAttribute = "review" method="post">

<table border="1" cellpadding="2" cellspacing="2" width="100%">
<tbody>
<tr>
    <td valign="top" style="font-size:20px; font-weight:bold" width="50%">Title*: <br /></td>
    <td valign="top"><form:input style="width: 100%;" path = "title" /><span style="color: red;"> <form:errors path = "title" /></span><br></td>
</tr>
<tr>
    <td valign="top" width="50%"><h3>Message*: </h3><br /></td>
    <td valign="top"><form:textarea style="width: 100%;" rows = "10" cols = "20" path = "message" /><span style="color: red;"> <form:errors path = "message" /></span><br></td>
</tr>
<tr>
	<td valign="top" width="50%"><h3>Ratings*: </h3><br /></td>
    <td><h3>Knowledge*:</h3><form:radiobutton path = "knowledge" value = "1"></form:radiobutton><form:radiobutton path = "knowledge" value = "2"></form:radiobutton><form:radiobutton path = "knowledge" value = "3" ></form:radiobutton><form:radiobutton path = "knowledge" value = "4"></form:radiobutton><form:radiobutton path = "knowledge" value = "5"></form:radiobutton>
    <h3>Service*:</h3><form:radiobutton path = "service" value = "1"></form:radiobutton><form:radiobutton path = "service" value = "2"></form:radiobutton><form:radiobutton path = "service" value = "3" ></form:radiobutton><form:radiobutton path = "service" value = "4"></form:radiobutton><form:radiobutton path = "service" value = "5"></form:radiobutton>
    <h3>Overall*:</h3><form:radiobutton path = "overall" value = "1"></form:radiobutton><form:radiobutton path = "overall" value = "2"></form:radiobutton><form:radiobutton path = "overall" value = "3" ></form:radiobutton><form:radiobutton path = "overall" value = "4"></form:radiobutton><form:radiobutton path = "overall" value = "5"></form:radiobutton>
<br></td>
</tr>
</tbody>
</table>
<form:hidden path="date" value = "${date}"></form:hidden>
<form:hidden path="user.id" value = "${Rev_User}"></form:hidden>
<form:hidden path="lawyer.id" value = "${Rev_Lawyer}"></form:hidden>
<input type = "submit" style = "font-size:30px" value = "Submit this review!" name = "submit">
</form:form>
</c:otherwise>
</c:choose>
</li>
</c:forEach>
</ol>
</c:when>
<c:otherwise>No Reviews yet!</c:otherwise>
</c:choose>

</body>
</html>