<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.medHub.model.Product"%>
<%@page import="com.medHub.dao.ProductDaoImpl"%>
<%@page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BuyProduct</title>
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

.buyProduct {
	position: absolute;
	top: 150px;
	left: 170px;
}
.buyProduct{
background-color: rgba(158, 202, 207,0.5);
width: 900px;
height: 300px;
border-radius: 5px;
}

.buyProduct img {
	position:relative;
	left:-30px;
	height: 220px;
	width: 220px;
}

#qty {
	position: relative;
	left: 20px;
	top: 74px;
}

#qty button {
	position: relative;
	left: 80px;
}

#qty input {
	width: 40px;
	position: relative;
}

#qty #qtyBox {
	position: relative;
	left: -30px;
}

.buyProduct td p{
padding-top: 20px;
position: relative;
left:-100px;
}
#addToCart a{
background-color: green;
text-decoration: none;
}
#buyNow a{
background-color: green;
color: white;
text-decoration: none;
}
#addToCart:hover{
cursor: pointer;
}
#buyNow:hover{
cursor: pointer;
}
#price{
position: relative;
left: -100px;
top:8px;
outline: none;
border: none;
background-color: rgba(158, 202, 207,0.1); 
color: black;
}
#pImg{
position: relative;
height: 200px;
width: 170px;
left:10px;
}
#pDesc{
position: relative;
left: 40px;
}
#totalprice{
position: relative;
top:-190px;
left:90px;
}
#TotalPriceLabel{
position: relative;
top:-170px;
right: 50px;
}

#offer{
position: relative;
left: -100px;
top:8px;
outline: none;
border: none;
background-color: rgba(158, 202, 207,0.1); 
color: black;
}
#totalprice{
position: relative;
top:-190px;
left:100px;
outline: none;
border: none;
background-color: rgba(158, 202, 207,0.1); 
color: black;
font-weight: 700;
font-size: 17px;
}
</style>
</head>
<body>
<%
 
int pId=Integer.parseInt(request.getParameter("pid").toString());
ProductDaoImpl productDao = new ProductDaoImpl();
Product currentProduct = productDao.findProductByProductId(pId);
session.setAttribute("currentproduct", currentProduct);
%>
	<div class="nav">

		<nav class="list">
			<ul>
				<li><a>Cart</a></li>
				<li><a>SignOut</a></li>
				<li><a>MyProfile</a></li>
				<li><a>MyOrders</a></li>
			</ul>
			<div class="logo">
				<img
					src="https://uxwing.com/wp-content/themes/uxwing/download/21-medical-science-lab/healthcare.png"
					alt="logo">
		</nav>
	</div>
	<table class="buyProduct">
		<tbody>

			<tr>

				<td><img id="pImg"
					src="<%currentProduct.getProductImg(); %>"
					alt=""></td>
				<td>
				<div id="pDesc">
				<p>
						<b>Product category:</b>
					</p>
					<p>
						<b>Product Name:</b>
					</p>
					<p>
						<b>Description:</b>
					</p>
					<p>
						<b>Price:</b>
					</p>
					<p>
						<b>Available Quantity:</b>
					</p>
					<p>
						<b>Points:</b>
					</p>
					<p>
						<b>Offer:</b>
					</p></td>
				<td>
					<p name="pCategory"><%=currentProduct.getProductCategory() %></p>
					<p name="pName"><%=currentProduct.getProductName() %></p>
					<p name="pDescription"><%=currentProduct.getDescription() %></p>
					<input name="pUnitPrice" id="price" value="<%=currentProduct.getUnitPrice()%>" disabled>
					<p name="pQuantity"><%=currentProduct.getQuantity() %></p>
					<p name="pgetPoints"><%=currentProduct.getPoints() %></p>
					<input name="pOffer" id="offer" value="<%=currentProduct.getOffer()%>" disabled>%
					</td>
				<td>
					<div id="qty">
						<div id="qtyBox">
						<form action="prod1">
							<label for="">Quantity</label> 
							<input type="number" id="quantity" name="quantity" min="0"  max="<%=currentProduct.getQuantity()%>" onclick="calculateAmt()">
						</div>
						<h3 id="TotalPriceLabel">Total price : Rs </h3>
						<input name="totalPrice" id="totalprice">
						<p name="message" id="message"></p>
						<button type="submit" >Paynow</button>
						</form>
					</div>
				</td>
			</tr>
			</div>
		</tbody>
	</table>
<tr>
<script>
function calculateAmt() {
	var price=document.getElementById("price");

	var amount=price.value;
	console.log(amount);
	var qty=document.getElementById("quantity");
	var quanty=qty.value;
	console.log(quanty);
	var discount=document.getElementById("offer");
	var dis=discount.value;
	var totalAmt;
/* 	price=Math.floor((price.value*offer.value)/100);
 * 
 */
 
 if(discount!=0){
 	 totalAmt=Math.floor(( (amount * quanty)-((amount * quanty) * (dis/100))));
	console.log(totalAmt);
	document.getElementById("totalprice").value=totalAmt;
 }

	document.getElementById("totalprice").value=totalAmt;
	
}



</script>
</body>
</html>
</html>