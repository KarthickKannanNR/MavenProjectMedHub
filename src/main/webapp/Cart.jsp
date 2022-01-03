<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.medHub.dao.*" %>
<%@page import="java.util.*" %>
<%@page import="com.medHub.model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<style>
  *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}
body{
    overflow-x: hidden;
}

.list ul li
{
    list-style: none;
    display: inline-block;
    
}
.list li{
    float: right;
    padding: 20px;
}

.list ul{
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
   .list ul{
       padding-right: 0px;
   }


  
.list ul,.list li,.list a{
    text-decoration: none;
    color: black;
    font-family: monospace;
    font-size: 25px;
    font-weight: 500;
    /* margin-right: 20px; */

    
}
.list li:hover,
.list a:hover{
 
    color: white;
    background-color: orange;
    border-radius: 5px;
    cursor: pointer;
}
body{
    /* background: linear-gradient(rgba(26,176,156,0.7),rgba(239,78,28,0.5)) ,url(Images/homepage_img.jpg); */
    background-image: url(Images/homepage_img.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    
}

.logo img{
    height: 60px;
    width: 60px;
    margin-left: 20px;
}
#allproducts table,th,tr{
border: 1px solid black;
background-color: white;
border-collapse: collapse;
padding: 10px;
}
#allproducts table,th,tr,td{
padding: 5px;
}
#allproducts table a{
background-color: orange;
width: 25px;
height: 25px;
border-radius: 2px;
}
</style>
</head>
<body>
<!-- navigation bar -->
 <div class="nav">

            <nav class="list">
                <ul>
                    <li> <a>Cart</a></li>
                    <li> <a>SignOut</a></li>
                </ul>
                <div class="logo">
                    <img src="https://uxwing.com/wp-content/themes/uxwing/download/21-medical-science-lab/healthcare.png"
                        alt="logo">
            </nav>
        </div>
        
        <%	ProductDaoImpl productDao = new ProductDaoImpl();
List<Product> productList = new ArrayList<Product>();
productList=productDao.viewProduts();%>
<div id="allproducts">
<table>
<thead>
<tr>
<th>Product id</th>
<th>Category</th>
<th>Name</th>
<th>Description</th>
<th>Unit_price</th>
<th>Available_qty</th>
<th>Image</th>
<th>Points</th>
<th>Status</th>
<th>Offer</th>
</tr>
</thead>
<tbody>
<%for(Product product:productList){ %>
<tr>
<td><%=product.getProductId() %></td>
<td><%=product.getProductCategory()%></td>
<td><%=product.getProductName() %></td>
<td><%=product.getDescription() %></td>
<td><%=product.getUnitPrice()%></td>
<td><%=product.getQuantity()%></td>
<td><%=product.getPoints()%></td>
<td><button>Buy Now</button></td>
<td><button>Delete</button></td>

</tr>
<%} %>
</tbody>
</table>
</div>
        
</body>
</html>