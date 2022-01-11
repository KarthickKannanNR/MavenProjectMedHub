<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.medHub.model.Product"%>
<%@page import="com.medHub.dao.ProductDaoImpl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel = "icon" type = "" href = "Assets/medhublogo.png">

<title>All Products</title>
<style>
* {
	margin-left: 0px;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
}

body {
	background-image: url(Images/homepage_img.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	overflow-x:hidden;
	height: 100vh;
	margin-top: 0px;
}

#navigation ul li {
	list-style: none;
	padding: 20px;
	display: inline-block;
}

#navigation {
	background: linear-gradient(to right, rgb(200, 47, 58) 0%,rgb(44, 169, 207) 100%);
	width: 100%;
	margin-top: 0%;
}

#navigation ul li a {
	text-decoration: none;
	color: whitesmoke;
	display: inline;
}

#navigation ul li a:hover {
	color: black;
}

#product {
	position: relative;
	top: 30px;
	left: 50px;
}

#product {
	position: relative;
	background-color: rgb(158, 202, 207);
	height: 250px;
	border-radius: 5px;
}

#product img {
	height: 100px;
	width: 90px;
	position: relative;
	left: 40px;
}

#product h3 {
	position: relative;
	left: 10px;
}

#product #details {
	position: relative;
	left: 220px;
	top: -165px;
}

#product #btn {
	position: relative;
	top: -250px;
	left: 900px;
}

#product #btn button {
	height: 30px;
	width: 90px;
	background-color: rgb(145, 230, 18);
	border: none;
	border-radius: 5px;
}

#btn1 {
	position: relative;
	left: 120px;
	top: 30px;
}

#product #btn button:hover {
	background-color: white;
	box-shadow: 0 0 5px black;
}

#product #img h3 {
	position: relative;
	left: 30px;
}
</style>
</head>
<body>
	<div id="navigation" class="container-fluid">
		<ul>
			<li><a href="AllUser.jsp">All Users</a></li>
			<li><a href="AdminAllProducts.jsp?deleteProductid=0">All Products</a></li>
			<li><a href="AddProduct.jsp">Add Products</a></li>
			<li id="logout"><a href="Index.jsp">Logout</a></li>
	</div>
	</ul>
	</div>
	<%
int deletePId= Integer.parseInt(request.getParameter("deleteProductid"));
ProductDaoImpl product= new ProductDaoImpl();
List<Product> allproduct = product.viewProduts();
int result=product.deleteProduct(deletePId);
if(result>0){
response.sendRedirect("AdminAllProducts.jsp");
}
	%>
	<% for(Product products : allproduct)
		
	{
	%>
	<form action="cart">
		<div id="product">
			<div id="img">
				<img src="<%=products.getProductImg() %>" alt="horlicks">
				<h3><%=products.getProductName() %></h3>
			</div>
			<div id="details">
				<h3>
					Product Id :
					<%=products.getProductId() %></h3>
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
				<h3>
					Available Quantity :
					<%=products.getQuantity() %></h3>
			</div>
			<div id="btn">
				<a href="UpdateProduct.jsp?productId=<%=products.getProductId() %>"
					name="updateProduct">Update</a><br>
				<br> <a
					href="AdminAllProducts.jsp?deleteProductid=<%=products.getProductId() %>"
					name="deleteProduct">Delete</a>
			</div>
		</div>
	</form>
	<br>
	<br>
	<%} %>

</body>
</html>