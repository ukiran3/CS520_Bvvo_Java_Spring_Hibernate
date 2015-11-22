<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<h2><a href="/Bvvo/home.html">Home</a></h2>

<security:authorize access="isAnonymous()">
<h2 align="right"><a href= "/Bvvo/spring_security_login" >Login</a></h2>
</security:authorize>

<security:authorize access="isAuthenticated()">
<h2 align="left"><a href= "/Bvvo/users/edit.html" >edit</a></h2>
<h2 align="right"><a href="<c:url value='/j_spring_security_logout' />">Logout</a></h2>
</security:authorize>

<center>
<c:choose>
<c:when test = "${fn:length(result) > 0}">
<table align="center" border="1" cellpadding="2" cellspacing="2" width="60%">
<tr>
<th>Profile image</th>
<th>Lawyer</th>
<th>Written by</th>
<th>Review Title</th>
<th>Review Message</th>
</tr>
<c:forEach items = "${result}" var = "review">
<c:if test = "${review.enabled}">
<tr>
<c:if test="${not empty reiew.lawyer.smallImg}">
  <td><a href="LawyerProf.html?lawyerId=${review.lawyer.id}"><img src="/Bvvo/users/getImage.html?type=small&id=${review.lawyer.id}"></img></a></td>
</c:if>
<c:if test="${empty review.lawyer.smallImg}">
  <td><a href="LawyerProf.html?lawyerId=${review.lawyer.id}"><img src="http://cs3.calstatela.edu:8080/cs520stu03/imgs/default.jpg" width="66" height ="88"></img></a></td>
</c:if>
  <td valign="top" width="50%"><a href="LawyerProf.html?lawyerId=${review.lawyer.id}">${review.lawyer.lName}, ${review.lawyer.fName}</a></td>
  <td valign="top" width="50%">${review.user.lName} , ${review.user.fName}</td>
  <td valign="top" width="50%">${review.title}</td>
  <td valign="top" width="50%">${review.message}</td>
</tr>
  </c:if>
</c:forEach>
</table>
<a href = "/Bvvo/home.html">Search again!</a>
</c:when>
<c:otherwise>
<h2>No results!</h2>
</c:otherwise>
</c:choose>
</center>
</body>
</html>