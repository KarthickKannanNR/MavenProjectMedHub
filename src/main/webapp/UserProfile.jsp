<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.medHub.model.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel = "icon" type = "" href = "Assets/medhublogo.png">

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
	color: white;
	font-family: monospace;
	font-size: 25px;
	font-weight: 500;
	/* margin-right: 20px; */
}

.list li:hover, .list a:hover {
	color: orange;
	border-radius: 5px;
	cursor: pointer;
}
.list{
   background: linear-gradient(to right, rgb(200, 47, 58) 0%,rgb(44, 169, 207) 100%);
}
body {
	/* background: linear-gradient(rgba(26,176,156,0.7),rgba(239,78,28,0.5)) ,url(Images/homepage_img.jpg); */
	background-image: url(Assets/homepage_img.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}

.logo img {
	height: 60px;
	width: 60px;
	margin-left: 20px;
}
#userProfile{
position: absolute;
left:90px;
}

#userProfile td,tr{
padding: 20px;
}
#userProfile input{
margin-top: 42.5px;
}
#userProfile label{
margin-top: 50px;
}
#userProfile input{
height: 30px;
width: 200px;
}
#walletMoneyUpdateForm{
position: absolute;
left: 500px;
bottom: 450px;
}

</style>
</head>
<body>
<%User currentUser = (User)session.getAttribute("user");
%>
<div class="nav">

		<nav class="list" class="container-fluid p-0">
			<ul>
					<li><a href="Cart.jsp">Cart</a></li>
					<li><a href="Index.jsp">SignOut</a></li>
					<li><a href="UserProfile.jsp">MyProfile</a></li>
					<li><a href="MyOrders.jsp?orderId=0">MyOrders</a></li>
					<li><a href="MyOrders.jsp?orderId=0">About-Us</a></li>
					<li><a href="UserHome.jsp">Home</a></li>
			</ul>
			<div class="logo">
				<img
					src="https://uxwing.com/wp-content/themes/uxwing/download/21-medical-science-lab/healthcare.png"
					alt="logo">
		</nav>
	</div>
	
	<!-- User Profile -->
	<div id="userProfile">
	<form action="ProfileUpdate">
		<label>Name :</label>
				<input id="" name="updatedName" value="<%=currentUser.getUsername()%>"><br>
		
		<label>Password :</label>
				<input id="" name="updatedPassword"  value="<%=currentUser.getUserPassword()%>"><br>
		
		<label>Mobile No :</label>
				<input id="" name="UpdatedMobNum"  value="<%=currentUser.getUserMobile()%>"><br>
		
		<label>Delivery Address :</label>
	
		<input   id="UpdateDeliveryAddress"   name="UpdateDeliveryAddress"value="<%=currentUser.getAddress()%>"><br>
						<button>Save Changes</button>
		</form>
</div>
	
	<div id="walletMoneyUpdateForm">
	<form action="walletUpdate">
		<input type="number" name="UpdateWallet" "UpdateWallet" min="1" max="5000" value="<%=currentUser.getWallet()%>">
		<button>Add Money</button>
	</form>
	</div>
	
</body>
</html>