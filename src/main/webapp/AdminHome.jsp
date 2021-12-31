<%@page import="com.medHub.model.*" %>
<%@page import="com.medHub.dao.*" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }
     #allusers{
       position: absolute;
       top:20px;
       left:200px;
       } 
       
    
        body{
            background-color: rgb(216, 203, 216);

            }
        #navigation ul li {
            
            list-style: none;
            padding: 20px;
        }
        #navigation{
            margin-left: 10px;
            background-color: rgb(83, 137, 168);
            width: 150px;
            height: 800px;
        }
        #navigation ul li a {
            text-decoration: none;
            color: whitesmoke;
            
        }
        #navigation ul li a:hover{
            color: white;
            font-weight: 600;
            transition-delay: 0.1ms;
        }
    </style>
</head>

<body>
    <div class="container">
        <div id="navigation">
        <ul>
            <li ><a href="" onclick="allusers()">All Users</a></li>
            <li><a href="">All Products</a></li>
            <li><a href="">Add Products</a></li>
        </div>
        </ul>
    </div>
<div>
<% UserDaoImpl userdao = new UserDaoImpl();
List<User> userList = new ArrayList<User>();
userList=userdao.ViewAllUser();%>
<div id="allusers">
<table>
<thead>
<tr>
<th>User id</th>
<th>Full Name</th>
<th>Address</th>
<th>Email</th>
<th>mobile</th>
<th>Status</th>
</tr>
</thead>
<tbody>
<%for(User user:userList){ %>
<tr>
<td><%=user.getUserId() %></td>
<td><%=user.getName()%></td>
<td><%=user.getAddress() %></td>
<td><%=user.getUserMail() %></td>
<td><%=user.getUserMobile()%></td>
<td><%=user.getAccountStatus()%></td>
</tr>
<%} %>
</tbody>
</table>
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
<th>available_qty</th>
<th>image</th>
<th>points</th>
<th>status</th>

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
<td><%=product.getProductImg()%></td>
<td><%=product.getPoints()%></td>


</tr>
<%} %>
</tbody>
</table>
</div>

</div>
<script>
function allusers()
{
    document.getElementById("allusers").style.display="visible";
}
</script>
</body>

</html>