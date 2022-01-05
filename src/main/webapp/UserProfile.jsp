<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.medHub.model.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
}
.list ul li {
	list-style: none;
	display: inline-block;
}

.list li {
	float: right;
	padding: 20px;
}

.list ul {
	/* background-color: #10847E;*/
	height: 70px;
	position: absolute;
	margin-right: 0%;
	position: absolute;
	top: 0;
	background-color: rgba(255, 255, 255, 0.603);
	box-shadow: 0 5 black;
	/* margin-top: 0%; */
	right: 0px;
	width: 1372px;
}

.list ul {
	padding-right: 0px;
}

.list ul, .list li, .list a {
	text-decoration: none;
	color: black;
	font-family: monospace;
	font-size: 25px;
	font-weight: 500;
	/* margin-right: 20px; */
}

.list li:hover, .list a:hover {
	color: white;
	background-color: orange;
	border-radius: 5px;
	cursor: pointer;
}

body {
	/* background: linear-gradient(rgba(26,176,156,0.7),rgba(239,78,28,0.5)) ,url(Images/homepage_img.jpg); */
	background-image: url(Images/homepage_img.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}

.logo img {
	height: 60px;
	width: 60px;
	margin-left: 20px;
}
#userProfile td,tr{
padding: 10px;
}
</style>
</head>
<body>
<%User currentUser = (User)session.getAttribute("user");
%>
<div class="nav">

		<nav class="list">
			<ul>
				<li><a href="Cart.jsp">Cart</a></li>
				<li><a href="Index.jsp">SignOut</a></li>
				<li><a href="UserProfile.jsp">MyProfile</a></li>
				<li><a>MyOrders</a></li>
			</ul>
			<div class="logo">
				<img
					src="https://uxwing.com/wp-content/themes/uxwing/download/21-medical-science-lab/healthcare.png"
					alt="logo">
		</nav>
	</div>
	<div id="userProfile">
	<table>
	<td>
	<td>
	<h3>Name :</h3>
	<h3>Password :</h3>
	<h3>Email :</h3>
	<h3>Mobile No :</h3>
	</td>
		<td>
		<input name="updatedName" value="<%=currentUser.getUsername()%>"><br>
		<input name="updatedPassword" value="<%=currentUser.getUserPassword()%>"><br>
		<input name="updatedmail" value="<%=currentUser.getUserMail()%>"><br>
		<input name="UpdatedMobNum" value="<%=currentUser.getUserMobile()%>"><br>
		</td>
	
	</td>
	<td></td>
	</table>
	</div>
</body>
</html>