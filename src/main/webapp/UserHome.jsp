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
<title>Userhome</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
}

body {
	overflow-x: hidden;
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
	color: orange;
	border-radius: 5px;
	cursor: pointer;
}
.list li:hover{
	transition-duration: 0.3s;

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
	margin-bottom: 0;
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
	top: -250px;
	left: 900px;
}

#product #btn button {
	height: 30px;
	width: 90px;
	border: none;
	border-radius: 5px;
	background-color: none;
}

#product #btn button{
	position: relative;
	background-color: yellowgreen;
	bottom:-150px;
	
}

#btn1 {
	position: relative;
}

#product #btn button:hover {
	box-shadow: 0 0 5px black;
	color: green;
	transition-duration: 0.3s;
	
}

#product #img h3 {
	position: relative;
	left: 40px;
	top:20px;
}

#btn #buynow {
	position: relative;

}

a {
	text-decoration: none;
	color: black;
}
#userName{
position: relative;
left: 1100px;
}
</style>
</head>

<body>
	<%User currentUser = (User)session.getAttribute("user");%>
	<div id="container">

		<div class="nav">

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
						src="Assets/medhublogo.png"
						alt="logo">
			</nav>
		</div>
		<!-- slideshow -->
		<h2 id="userName">welcome <%=currentUser.getName()%></h2>
		</div>


		<% 
		ProductDaoImpl product= new ProductDaoImpl();
		List<Product> allproduct = product.viewProduts();
		 Product searchProducts = new Product(); 
		/* searchProducts.searchProduct(searchProduct);  */
		
	%>
		<% for(Product products : allproduct)
		
	{
	%>
		
			<div id="product">
				<div id="img">
					<img src="<%=products.getProductImg() %>" alt="horlicks">
					<h3><%=products.getProductName() %></h3>
				</div>
				<div id="details">
					<h3>
						Description :
						<%=products.getDescription() %></h3>
					<h3>
						price :<%=products.getUnitPrice()+ "rs"%></h3>
					<h3>
						Offer :
						<%=products.getOffer() %>%
					</h3>
					<h3>
						Points :
						<%=products.getPoints() %></h3>
				</div>
				<div id="btn">
					<button>
						<a id="buynow" href="BuyProduct.jsp?pid=<%=products.getProductId()%>">Buy Now</a>
					</button>
					<%--  <button>
						<a id="btn1" href="AddToCart.jsp?cartpId<%=products.getProductId()%>">Add To Cart</a>
					</button> --%>
					</button>
				</div>
			</div>
		
		<br>
		<br>
		<%} %>
		
		<br><br><br><br><br><br><br><br><br><br><br><br>
		<h2 id="copyrights">© 2021 MedHub.com. All rights reserved.</h2>

	</div>

	</div>
	<div id="footer"></div>


</body>

</html>
