<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lawyer profile</title>
</head>
<body>
<h2><a href="/Bvvo/home.html">Home</a></h2>

<c:choose>
<c:when test="${empty userName}">
<h2 align="right"><a href= "/Bvvo/users/login.html" >Login</a></h2>
</c:when>
<c:otherwise>
<h2 align="left"><a href= "/Bvvo/users/edit.html" >Edit</a></h2>
<h2 align="right"><a href= "/Bvvo/users/logout.html" >Logout</a></h2>
</c:otherwise>
</c:choose>

<c:if test="${not empty user.largeImg}">
<img src="/Bvvo/users/getImage.html?type=large&id=${lawyerProf.id}"></img>
</c:if>
<c:if test="${empty user.largeImg}">
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
<span style = "color:red; font-size:50px; font-style:italic">
${review.title}
</span>
by ${review.user.email} at <fmt:formatDate value="${review.date}" pattern="MMM dd, yyyy hh:mm a" />
<div style = "color:green; font-size:30px">
${review.message} </div>
<table><tbody><tr><td>My Ratings ::: </td><td>Knowledge : ${review.knowledge} / 5, </td><td>Service : ${review.service} / 5, </td><td>Overall : ${review.overall} / 5.</td></tr></tbody></table>
</li>
</c:forEach>
</ol>
</c:when>
<c:otherwise>No Reviews yet!</c:otherwise>
</c:choose>

<c:choose>
<c:when test = "${u_type eq 'lawyer'}">
<h3>Lawyers cannot write reviews.</h3>
</c:when>
<c:otherwise>
<c:choose>
<c:when test="${not empty userName}">
<c:choose>
<c:when test="${bool}">
<a href="WriteReview.html?id=${lawyerProf.id}">Write a review!</a>
</c:when>
<c:otherwise>
<h3>You already wrote a review on this lawyer.</h3>
</c:otherwise>
</c:choose>
</c:when>
<c:otherwise>
<a href="login.html">Write a review!</a>
</c:otherwise>
</c:choose>
</c:otherwise>
</c:choose>
</body>
</html>