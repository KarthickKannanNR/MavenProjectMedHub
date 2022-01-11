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
	transition: transform 0.4s;
	
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
	transform:translatey(-10px);
	
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
<%
String InsuffiendMoney = (String)session.getAttribute("InsuffientMoney");
User currentUser = (User)session.getAttribute("user");
String AddressNotFound = (String)session.getAttribute("AddressNotFound");
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
	
	<% 
	if(InsuffiendMoney!=null)
	{ %>
		<div class="InsuffiendMoney">
		<h3><%=InsuffiendMoney %></h3>
		</div>
		
	<%} 		session.removeAttribute("InsuffientMoney");%>
	<% 
	if(AddressNotFound!=null)
	{ %>
		<div class="addressNull">
		<h3><%=AddressNotFound %></h3>
		</div>
		
	<%}		session.removeAttribute("AddressNotFound");
	%>
	
	
	<!-- User Profile -->
	<div id="userProfile">
	<form action="ProfileUpdate">
	<table border="1px">
		<tr>
			<td><label>Name :</label>
			<td><input id="" name="updatedName" pattern="[A-Za-z]{3,}" title="name should be minimum 3 letters and maximum 30 letters" required min="3" max="10" value="<%=currentUser.getUsername()%>"><br></td>
		</tr>
		
	<tr>
		<td><label>Password :</label></td>
		<td><input id="" name="updatedPassword"  required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%?&]{8,15}$"
		title="Minimum eight and Minimum 8 and maximum 15 characters, at least one uppercase letter, one lowercase letter, one number and one special character" value="<%=currentUser.getUserPassword()%>"><br></td>
	</tr>
	
	
	<tr>
		<td><label>Mobile No :</label></td>
		<td><input id="" name="UpdatedMobNum"  pattern="[6-9][0-9]{9}"
		title="MObile Number Must Have 10 Digits" required  value="<%=currentUser.getUserMobile()%>"><br><td>
	</tr>	
	
	<tr>
		<td><label>Delivery Address :</label></td>
		<td><textarea   id="UpdateDeliveryAddress"   name="UpdateDeliveryAddress" required rows="5" cols="33" style="max-width: 300px;max-height: 100px;"><%=currentUser.getAddress()%></textarea><br></td>
	</tr>	
			<tr>
			<td > 
			<button>Save Changes</button>
			</td>
			</tr>
				
		</form>
		</table>
</div>
	
	<div id="walletMoneyUpdateForm">
	<form action="walletUpdate">
		<input type="number" name="UpdateWallet" "UpdateWallet" min="1" max="5000" value="<%=currentUser.getWallet()%>">
		<button>Add Money</button>
	</form>
	</div>
	
	<div id="pointMoney">
	<form action="ConvertMoney">
	<input type="number" name="pointsMoney" "UpdateWallet" min="1" max="5000" value="<%=currentUser.getPoints()%>" readonly>
		<button>Convert to Cash</button>
	</form>
	</div>
	
</body>
</html>