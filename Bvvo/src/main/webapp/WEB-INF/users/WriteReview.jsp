<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Write a review!</title>
<!-- 
<style type="text/css">
.rating {
	width: 25px;
	height: 25px;
	background-repeat: no-repeat;
	border: none;
}
.star {
	background-image: url("http://cdn1.iconfinder.com/data/icons/freeapplication/png/24x24/Low%20rating.png");
}
.active {
	background-image: url("http://cdn1.iconfinder.com/data/icons/32pxmania/misc_57.png");
}
.star:HOVER {
	background-image: url("http://cdn1.iconfinder.com/data/icons/32pxmania/misc_57.png");
}
</style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>

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
					alert("")
				}
			});
		});
	});
</script>
 -->
 <head>
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
<center>
<form:form modelAttribute = "review" method = "post">

<h2>Write a review on this lawyer:</h2>

<table border="1" cellpadding="2" cellspacing="2" width="60%">
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
	<!-- 
    <td>
    <h3>Service*:</h3><form:radiobutton path = "service" value = "1"></form:radiobutton><form:radiobutton path = "service" value = "2"></form:radiobutton><form:radiobutton path = "service" value = "3" checked='true'></form:radiobutton><form:radiobutton path = "service" value = "4"></form:radiobutton><form:radiobutton path = "service" value = "5"></form:radiobutton>
    <h3>Overall*:</h3><form:radiobutton path = "overall" value = "1"></form:radiobutton><form:radiobutton path = "overall" value = "2"></form:radiobutton><form:radiobutton path = "overall" value = "3" checked='true'></form:radiobutton><form:radiobutton path = "overall" value = "4"></form:radiobutton><form:radiobutton path = "overall" value = "5"></form:radiobutton>
<br></td>

<td>
<span class="rating">
    <input type="radio" class="rating-input"
        id="rating-input-1-5" name="rating-input-1">
    <label for="rating-input-1-5" class="rating-star"></label>
    <input type="radio" class="rating-input"
        id="rating-input-1-4" name="rating-input-1">
    <label for="rating-input-1-4" class="rating-star"></label>
    <input type="radio" class="rating-input"
        id="rating-input-1-3" name="rating-input-1">
    <label for="rating-input-1-3" class="rating-star"></label>
    <input type="radio" class="rating-input"
        id="rating-input-1-2" name="rating-input-1">
    <label for="rating-input-1-2" class="rating-star"></label>
    <input type="radio" class="rating-input"
        id="rating-input-1-1" name="rating-input-1">
    <label for="rating-input-1-1" class="rating-star"></label>
</span>
</td>
-->
<td>
<h3>Knowledge*:</h3>
<span class="rating">
    <form:radiobutton class="rating-input" path="knowledge" id="rating-input-1-5" name="rating-input-1" value="5"></form:radiobutton>
    <label for="rating-input-1-5" class="rating-star"></label>
    <form:radiobutton class="rating-input" path="knowledge" id="rating-input-1-4" name="rating-input-1" value="4"></form:radiobutton>
    <label for="rating-input-1-4" class="rating-star"></label>
    <form:radiobutton class="rating-input" path="knowledge" id="rating-input-1-3" name="rating-input-1" value="3"></form:radiobutton>
    <label for="rating-input-1-3" class="rating-star"></label>
    <form:radiobutton class="rating-input" path="knowledge" id="rating-input-1-2" name="rating-input-1" value="2"></form:radiobutton>
    <label for="rating-input-1-2" class="rating-star"></label>
    <form:radiobutton class="rating-input" path="knowledge" id="rating-input-1-1" name="rating-input-1" value="1"></form:radiobutton>
    <label for="rating-input-1-1" class="rating-star"></label>
</span>
<h3>Service*:</h3>
<span class="rating">
    <form:radiobutton class="rating-input" path="service" id="rating-input-2-5" name="rating-input-1" value="5"></form:radiobutton>
    <label for="rating-input-2-5" class="rating-star"></label>
    <form:radiobutton class="rating-input" path="service" id="rating-input-2-4" name="rating-input-1" value="4"></form:radiobutton>
    <label for="rating-input-2-4" class="rating-star"></label>
    <form:radiobutton class="rating-input" path="service" id="rating-input-2-3" name="rating-input-1" value="3"></form:radiobutton>
    <label for="rating-input-2-3" class="rating-star"></label>
    <form:radiobutton class="rating-input" path="service" id="rating-input-2-2" name="rating-input-1" value="2"></form:radiobutton>
    <label for="rating-input-2-2" class="rating-star"></label>
    <form:radiobutton class="rating-input" path="service" id="rating-input-2-1" name="rating-input-1" value="1"></form:radiobutton>
    <label for="rating-input-2-1" class="rating-star"></label>
</span>
<h3>Overall*:</h3>
<span class="rating">
    <form:radiobutton class="rating-input" path="overall" id="rating-input-3-5" name="rating-input-1" value="5"></form:radiobutton>
    <label for="rating-input-3-5" class="rating-star"></label>
    <form:radiobutton class="rating-input" path="overall" id="rating-input-3-4" name="rating-input-1" value="4"></form:radiobutton>
    <label for="rating-input-3-4" class="rating-star"></label>
    <form:radiobutton class="rating-input" path="overall" id="rating-input-3-3" name="rating-input-1" value="3"></form:radiobutton>
    <label for="rating-input-3-3" class="rating-star"></label>
    <form:radiobutton class="rating-input" path="overall" id="rating-input-3-2" name="rating-input-1" value="2"></form:radiobutton>
    <label for="rating-input-3-2" class="rating-star"></label>
    <form:radiobutton class="rating-input" path="overall" id="rating-input-3-1" name="rating-input-1" value="1"></form:radiobutton>
    <label for="rating-input-3-1" class="rating-star"></label>
</span>
</td>
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