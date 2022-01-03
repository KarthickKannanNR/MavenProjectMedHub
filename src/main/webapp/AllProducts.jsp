<%@page import="java.util.List"%>
<%@page import="com.medHub.model.Product"%>
<%@page import="com.medHub.dao.ProductDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Products</title>
    <style>
         * {
            margin-left: -5px;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        	}
        body{
            background-image: url(Images/homepage_img.jpg);
            background-repeat: no-repeat;
            background-size: cover;

        }
        #product{
            position: relative;
            top: 30px;
            left: 50px;
            
        } 
        #product{
            position: relative;
            background-color: rgba(158, 202, 207,0.5);
            height: 190px;
            border-radius: 5px;
            width: 1200px;
        }
        #product img{
            height: 100px;
            width: 90px;
            position: relative;
            left: 40px;
        }
        #product h3{
            position: relative;
            left: 10px;
        }
         #product #details{
            position: relative;
            left: 220px;
            top: -165px;
        }
        #product #btn{
            position: relative;
            top: -250px;
            left: 900px;
        }
        #product #btn button{
            height: 30px;
            width: 90px;
            background-color: rgb(145, 230, 18);
            border: none;
            border-radius: 5px;
        }
        #product #btn{
            position: relative;
            }
         #btn1{
             position: relative;
             left: 120px;
             top: -40px;
         }  
         #product #btn button:hover{
             background-color: white;
             box-shadow: 0 0 5px black;
         } 
         #product #img h3{
         position: relative;
         left: 30px;
         }
         #btn #buynow{
         position: relative;
         top:-10px;
         }
         a{
         text-decoration: none;
         color: black;
         }
    </style>
</head>
<body>
<% ProductDaoImpl product= new ProductDaoImpl();
List<Product> allproduct = product.viewProduts();
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
            <h3>Description : <%=products.getDescription() %></h3>
            <h3>price :<%=products.getUnitPrice()+ "rs"%></h3>
            <h3>Offer : <%=products.getOffer() %>%</h3>
            <h3>Points : <%=products.getPoints() %></h3>
        </div>
        <div id="btn">
            <a href="BuyProduct.jsp">Buy Now</a><br>
           <a href="">Add To Cart</a></button>
        </div>
	</div>
	</form>
		<br><br>
	<%} %>
</body>
</html>