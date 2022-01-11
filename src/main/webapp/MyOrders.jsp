<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@page import="java.util.List"%>
<%@page import="com.medHub.model.*"%>
<%@page import="com.medHub.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel = "icon" type = "" href = "Assets/medhublogo.png">

<title>My Orders</title>
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
    position: fixed;
   width: 100%;
   z-index: 1;

}
body {
	/* background: linear-gradient(rgba(26,176,156,0.7),rgba(239,78,28,0.5)) ,url(Images/homepage_img.jpg); */
	background-image: url(Assets/homepage_img.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	height:100vh;
	overflow-x:hidden; 
	
}

.logo img {
	height: 60px;
	width: 60px;
	margin-left: 20px;
}

/* banner */
.slide {
	position: absolute;
	top: 120px;
}
/* progress */
.products {
	margin-top: 330px;
	border-spacing: 0 200px;
}

.slide img {
	box-shadow: 0 0 10px black;
}

.products tr td {
	padding-left: 220px;
}

img {
	box-shadow: 0 0 10px black;
}

.logo img {
	box-shadow: none;
}

#copyrights {
	text-align: center;
	color: yellow;
	position: relative;
	top:300px;	
}

#allproducts a {
	text-decoration: none;
	color: black;
}

#allproducts a:hover {
	text-decoration: underline;
	color: white;
}

#allproducts {
	text-align: center;
}

#product {
	position: relative;
	top: 30px;
	left: 50px;
}

#product {
	position: relative;
	background-color: rgba(158, 202, 207, 0.5);
	height: 190px;
	border-radius: 5px;
	width: 1200px;
	top:150px;
}

#product img {
	height: 100px;
	width: 90px;
	position: relative;
	left: 40px;
	top:20px;
}

#product h3 {
	position: relative;
	left: 10px;
}

#product #details {
	position: relative;
	left: 220px;
	top: -90px;
}

#product #btn {
	position: relative;
	left: 900px;
	top:-130px;
}

#product #btn button {
	height: 30px;
	width: 90px;
	background-color: orange;
	border: none;
	border-radius: 5px;
}


#btn1 {
	position: relative;
	left: 120px;
	top: -40px;
}

#product #btn button:hover {
	background-color: red;
	box-shadow: 0 0 5px black;
	color: white;
}

#product #img h3 {
	position: relative;
	left: 40px;
	top:20px;
}

#btn  {
	position: relative;
	top: -40px;
}

a {
	text-decoration: none;
	color: black;
}

#userName{
position: absolute;
top:90px;
left: 55px;
}

</style>
</head>

<body>
	<%User currentUser = (User)session.getAttribute("user");
	OrderDaoImpl currentCancelOrder = new OrderDaoImpl();
	%>
	<div id="container">

		<div class="nav" class="container-fluid p-0">

			<nav class="list">
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
		<!-- slideshow -->

<%-- 		<h2 id="userName">welcome <%=currentUser.getName()%></h2>
 --%>		</div>

		<% OrderItemsDaoImpl myOrder= new OrderItemsDaoImpl();
		List<OrderItems> myOrderList = myOrder.ViewMyOrders(currentUser);
		int orderId=Integer.parseInt(request.getParameter("orderId"));
		OrderDaoImpl orderDao=new OrderDaoImpl();	
		currentCancelOrder.deleteProduct(orderId);

		
		/* orderDao.deleteProduct(myAllOrders.getOrderModel().getOrderId()); */
		boolean flag;
		
		%>
		<% for(OrderItems myAllOrders : myOrderList)
			 {
			flag =orderDao.checkStatus(myAllOrders.getOrderModel().getOrderId());
			 %>
		
			<div id="product">
				<div id="img">
					<img src="<%=myAllOrders.getProduct().getProductImg()%>" alt="horlicks">
					<h3><%=myAllOrders.getProduct().getProductName() %></h3>
				</div>
				<div id="details">
					<h3>
						Description :
						<%=myAllOrders.getProduct().getDescription() %></h3>
					<h3>
						price :<%=myAllOrders.getUnitPrice()+ "rs"%></h3>
					<h3>
						Offer Applied:
						<%=myAllOrders.getProduct().getOffer() %>%
					</h3>
					<h3>
						Points :
						<%=myAllOrders.getProduct().getPoints() %></h3>
						<h3>
						Total Quantity:
						<%=myAllOrders.getQuantity() %></h3>
					<h3>
						Total Amt :
						<%=myAllOrders.getTotalPrice() %></h3>
						
				</div>
				<% if(flag){%>
				<div id="btn">
					<button>
						<a id="cancel" href="MyOrders.jsp?orderId=<%=myAllOrders.getOrderModel().getOrderId()%>">Cancel Order</a>
					</button>
					<br>
					</button>
				</div>
				<% }
				%>
			</div>
		
		<br>
		<br>
		<%}%>
		
		
	
		<h2 id="copyrights">© 2021 MedHub.com. All rights reserved.</h2>

	</div>

	</div>
	<div id="footer"></div>


</body>

</html>
