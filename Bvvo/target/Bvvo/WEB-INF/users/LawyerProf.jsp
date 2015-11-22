<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lawyer profile</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<!-- 
<script type="text/javascript">
	$(document).ready(function() {
		$(".star").bind("click", function(event) {
			var el = $(event.currentTarget);
			for(var i = 1; i <= $(".star").length; i++) {
				if (parseInt(el.data("value")) >= i) {
					$("img[data-value='" + i + "']").addClass("active");
				}
				else {
					$("img[data-value='" + i + "']").removeClass("active");
				}
			}
			//el.toggleClass("active");
			
			$.ajax({
				url: window.location.href,
				data: $("#review").serialize(),
				method: "POST",
				datatype: "html",
				success: function(data) {
					//console.log(data);
				},
				error: function(jqXHR, text) {
					alert("");
				}
			});
		});
	});
</script>
 
 <script type="text/javascript">
	$(document).ready(function() {
		$(".rating-input").bind("click", function(event) 
		{
			var know = document.getElementByName("knowledge");
			var serv = document.getElementByName("service");
			var over = document.getElementByName("overall");
			var lawyId = document.getElementByName("lawyId");
			var revId = document.getElementByName("revId");
			$.ajax({
				url: "helloS.html/",
				data: "knowledge="+know+"&service="+serv+"&overall="+over+"&lawyId="+lawyId+"&revId="+revId,
				method: "POST",
				datatype: "html",
				success: function(data) {
					//console.log(data);
				},
				error: function(jqXHR, text) {
					alert("");
				}
			});
		});
	});
	</script>
	
	<script type="text/javascript">
	function display() {
		var know = document.getElementsByName("knowledge")[0].value;
		alert("Hello" +know);
	}
	
	$(document).ready(function() {
		$("#overallRating").bind("change", function(event) {
			console.log(event);
		});
	});
	</script>
	-->
	<script type="text/javascript">
	function newXMLHttpRequest()
{
		
  var xmlreq = false;

  if( window.XMLHttpRequest ) xmlreq = new XMLHttpRequest();
  else if( window.ActiveXObject )
  {
    try
    {
      xmlreq = new ActiveXObject( "Msxml2.XMLHTTP" );
    }
    catch( e1 )
    {
      try
      {
        xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
      }
      catch( e2 ) {}
    }
  }

  return xmlreq;
}


function getReadyStateHandler( req, responseHandler )
{
  return function ()
  {
    if(req.readyState == 4)
    {
      
      if( req.status == 200 ) responseHandler( req.responseText );
      else alert("HTTP error: "+req.status);
    }
  }
}

function updateDocument( respText )
{
    document.getElementById( "hey" ).innerHTML = respText;
}

function display()
{
	var know = document.getElementsByName("knowledge")[0].value;
	var serv = document.getElementsByName("service")[0].value;
	var over = document.getElementsByName("overall")[0].value;
	var lawyId = document.getElementsByName("lawyId")[0].value;
	var revId = document.getElementsByName("revId")[0].value;
  var req = newXMLHttpRequest();
  req.onreadystatechange = getReadyStateHandler( req, updateDocument );
  
  req.open("POST", "/Bvvo/users/helloS.html/", true);
  //req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  req.send(null);
}
</script>
	
<style type="text/css">
 .rating {
          overflow: hidden;
          display: inline-block;
      }
      .rating-input {
          position: absolute;
          left: 0;
          top: -50px;
      }
      .rating:hover .rating-star:hover,
      .rating:hover .rating-star:hover ~ .rating-star,
      .rating-input:checked ~ .rating-star {
          background-position: 0 0;
      }
      .rating-star,
      .rating:hover .rating-star {
          float: right;
          display: block;
          width: 16px;
          height: 16px;
          background: url('http://kubyshkin.ru/samples/star-rating/star.png') 0 -16px;
      }
      body {
    margin: 20px;
   }
   </style>
</head>
<body>
<h2><a href="/Bvvo/home.html">Home</a></h2>

<security:authorize access="isAnonymous()">
<h2 align="right"><a href= "/Bvvo/spring_security_login" >Login</a></h2>
</security:authorize>

<security:authorize access="isAuthenticated()">
<h2 align="left"><a href= "/Bvvo/users/edit.html" >Edit profile</a></h2>
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
<c:if test="${review.enabled}">
<br/>
<li>

<div style = "background-color:red; font-size:30px; font-style:italic">
<security:authorize access="isAuthenticated() and principal.username == '${review.user.username}'">
<a href="editReview.html?lawyerId=${lawyerProf.id}&revId=${review.id}">edit</a>
</security:authorize>
${review.title}
<span style= "font-size: 15px">
by ${review.user.username} at <fmt:formatDate value="${review.date}" pattern="MMM dd, yyyy hh:mm a" />
</span>
<security:authorize access="isAuthenticated() and hasRole('ROLE_ADMIN')">
<a href="deleteRev.html?lid=${lawyerProf.id}&revId=${review.id}">delete</a>
</security:authorize>
</div>

<div style = "background-color:blue; font-size:20px; font-style:italic">

<div style = "font-size:30px">
${review.message} </div>
<input type="hidden" value = "${lawyerProf.id}" name="lawyId">
<input type="hidden" value = "${review.id}" name="revId">
<table border="1"><tbody><tr><td>My Ratings ::: </td>
<!-- 
<h3>Knowledge</h3>
<span id="knowledgeRating" class="rating" onclick="display();">
    <input type = "radio" class="rating-input" name="knowledge" id="rating-input-1-5" name="rating-input-1" value="5">
    <label for="rating-input-1-5" class="rating-star"></label>
    <input type = "radio" class="rating-input" name="knowledge" id="rating-input-1-4" name="rating-input-1" value="4">
    <label for="rating-input-1-4" class="rating-star"></label>
    <input type = "radio" class="rating-input" name="knowledge" id="rating-input-1-3" name="rating-input-1" value="3">
    <label for="rating-input-1-3" class="rating-star"></label>
    <input type = "radio" class="rating-input" name="knowledge" id="rating-input-1-2" name="rating-input-1" value="2">
    <label for="rating-input-1-2" class="rating-star"></label>
    <input type = "radio" class="rating-input" name="knowledge" id="rating-input-1-1" name="rating-input-1" value="1">
    <label for="rating-input-1-1" class="rating-star"></label>
</span>
</td>
<td>
<h3>Service</h3>
<span id="serviceRating" class="rating">
    <input type = "radio" class="rating-input" name="service" id="rating-input-1-5" name="rating-input-1" value="5">
    <label for="rating-input-1-5" class="rating-star"></label>
    <input type = "radio" class="rating-input" name="service" id="rating-input-1-4" name="rating-input-1" value="4">
    <label for="rating-input-1-4" class="rating-star"></label>
    <input type = "radio" class="rating-input" name="service" id="rating-input-1-3" name="rating-input-1" value="3">
    <label for="rating-input-1-3" class="rating-star"></label>
    <input type = "radio" class="rating-input" name="service" id="rating-input-1-2" name="rating-input-1" value="2">
    <label for="rating-input-1-2" class="rating-star"></label>
    <input type = "radio" class="rating-input" name="service" id="rating-input-1-1" name="rating-input-1" value="1">
    <label for="rating-input-1-1" class="rating-star"></label>
</span>
</td>
<td>
<h3>Overall</h3>
<span id="overallRating" class="rating">
    <input type = "radio" class="rating-input" name="overall" id="rating-input-1-5" name="rating-input-1" value="5">
    <label for="rating-input-1-5" class="rating-star"></label>
    <input type = "radio" class="rating-input" name="overall" id="rating-input-1-4" name="rating-input-1" value="4">
    <label for="rating-input-1-4" class="rating-star"></label>
    <input type = "radio" class="rating-input" name="overall" id="rating-input-1-3" name="rating-input-1" value="3">
    <label for="rating-input-1-3" class="rating-star"></label>
    <input type = "radio" class="rating-input" name="overall" id="rating-input-1-2" name="rating-input-1" value="2">
    <label for="rating-input-1-2" class="rating-star"></label>
    <input type = "radio" class="rating-input" name="overall" id="rating-input-1-1" name="rating-input-1" value="1">
    <label for="rating-input-1-1" class="rating-star"></label>
</span>
</td>
-->
<td>
<h3>Knowledge</h3>
<span>
<c:forEach begin="1" end ="${review.knowledge}" step="1" var="i" >
<img src = "http://cdn1.iconfinder.com/data/icons/32pxmania/misc_57.png">
</c:forEach>
<c:forEach begin="${review.knowledge}" end ="4" step="1" var="i" >
<img src="http://cdn1.iconfinder.com/data/icons/freeapplication/png/24x24/Low%20rating.png">
</c:forEach>
</span>
</td>
<td>
<h3>Service</h3>
<span>
<c:forEach begin="1" end ="${review.service}" step="1" var="i" >
<img src = "http://cdn1.iconfinder.com/data/icons/32pxmania/misc_57.png">
</c:forEach>
<c:forEach begin="${review.service}" end ="4" step="1" var="i" >
<img src="http://cdn1.iconfinder.com/data/icons/freeapplication/png/24x24/Low%20rating.png">
</c:forEach>
</span>
</td>
<td>
<h3>Overall</h3>
<span>
<c:forEach begin="1" end ="${review.overall}" step="1" var="i" >
<img src = "http://cdn1.iconfinder.com/data/icons/32pxmania/misc_57.png">
</c:forEach>
<c:forEach begin="${review.overall}" end ="4" step="1" var="i" >
<img src="http://cdn1.iconfinder.com/data/icons/freeapplication/png/24x24/Low%20rating.png">
</c:forEach>
</span>
</td>

<!-- 
<td>Knowledge : ${review.knowledge} / 5, </td>
<td>Service : ${review.service} / 5, </td>
<td>Overall : ${review.overall} / 5.</td>
 -->
</tr></tbody></table>
</div>
</li>

</c:if>
<c:if test = "${not review.enabled}">
<h3>*** A review has been disabled by the administrator.</h3>
</c:if>
</c:forEach>
</ol>
</c:when>
<c:otherwise>No Reviews yet! Login as user to write one.</c:otherwise>
</c:choose>
<!-- 
<c:choose>
<c:when test = "${u_type eq 'lawyer' or u_type eq 'admin'}">
<h3>Lawyers and admins cannot write reviews.</h3>
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
</c:choose> -->

<security:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
<a href="WriteReview.html?id=${lawyerProf.id}">Write a review!</a>
</security:authorize>

</body>
</html>