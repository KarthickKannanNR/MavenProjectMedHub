<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	left: 210px;
}
.buyProduct{
background-color: rgba(158, 202, 207,0.5);
width: 900px;
height: 300px;
border-radius: 5px;
}

.buyProduct img {
	height: 220px;
	width: 220px;
}

#qty {
	position: relative;
	left: 80px;
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
	left: 10px;
}
.buyProduct td p{
padding-top: 20px;
position: relative;
left:-100px;
}
</style>
</head>
<body>
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

				<td><img
					src="https://onemg.gumlet.io/image/upload/l_watermark_346,w_690,h_700/a_ignore,w_690,h_700,c_pad,q_auto,f_auto/v1600102416/cropped/lw1c5w1huy1nwbphashp.png"
					alt=""></td>
				<td><p>
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
						<b>Quantity:</b>
					</p>
					<p>
						<b>Points:</b>
					</p>
					<p>
						<b>Offer:</b>
					</p></td>
				<td>
					<p></p>
					<p></p>
					<p></p>
					<p></p>
					<p></p>
					<p></p>
					<p></p>
					<p></p>
				</td>
				<td>
					<div id="qty">
						<div id="qtyBox">
							<label for="">Quantity</label> <input type="number" id="quantity"
								max="" min="0" name="quantity">
						</div>
						<p>
							<button type="button" onclick="addToCart()">Add to Cart</button>
							<button type="button" onclick="buyNow()">Buy Now</button>
						</p>
						<p name="message" id="message">
						<p>
					</div>
				</td>
			</tr>
		</tbody>
	</table>


	<tr>
</body>
</html>
</html>