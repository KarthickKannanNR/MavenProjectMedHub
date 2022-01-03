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
    <title>AdminHome</title>
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
            background-color: white;

            }
       #navigation ul li {
            
            list-style: none;
            padding: 20px;
            display: inline-block;
            margin-left: 60px;

        }
        #navigation{
            background-color: rgb(83, 137, 168);
            align-items: center;
        }
        #navigation ul li a {
            text-decoration: none;
            color: whitesmoke;
            display: inline;
            
        }
        #navigation ul li a:hover{
        color: black;        
    	}
        #allusers table,th,tr,td{
        border: 1px solid black;
        border:none;
        padding: 15px;
        }
        #allproducts table img{
        height:80px;
        width: 80px;
        }
    </style>
</head>

<body>
    <div class="container">
    <div id="navigation">
        <ul>
            <li ><a href="AllUser.jsp" >All Users</a></li>
            <li><a href="AdminAllProducts.jsp">All Products</a></li>
            <li><a href="">Add Products</a></li>
        </div>
        </ul>
    </div>
       
<%-- <div>
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
 --%>
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
<td ><img alt="img" src="<%=product.getProductImg()%>"></td>
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