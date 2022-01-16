<%@page import="com.medHub.model.*"%>
<%@page import="com.medHub.dao.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel = "icon" type = "" href = "Assets/medhublogo.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>All Users</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
}

body {
	background-color: white;
}
#navigation{
   background: linear-gradient(to right, rgb(200, 47, 58) 0%,rgb(44, 169, 207) 100%);

}

#navigation ul li {
	list-style: none;
	padding: 20px;
	display: inline-block;
	margin-left: 60px;
}

#navigation {
	background-color: rgb(83, 137, 168);
	align-items: center;
}

#navigation ul li a {
	text-decoration: none;
	color: whitesmoke;
	display: inline;
}

#navigation ul li a:hover {
	color: black;
}

#navigation #logout a {
	position: relative;
	right: 10px;
}

#allusers table, th, tr, td {
	border: 2px solid black;
	border-collapse: collapse;
	padding: 10px;
}

#allusers table th {
	border: 2px solid blue;
}

#allusers {
	position: absolute;
	left: 18%;
	top: 100px;
}

</style>
</head>
<body>
	<div id="container">
		<div id="navigation">
			<ul>
				<li><a href="AllUser.jsp">All Users</a></li>
				<li><a href="AdminAllProducts.jsp?deleteProductid=0">All Products</a></li>
				<li><a href="AddProduct.jsp">Add Products</a></li>
				<li id="logout"><a href="Index.jsp">Logout</a></li>
		</div>
		</ul>
	</div>
	<div>
		<% UserDaoImpl userdao = new UserDaoImpl();
			List<User> userList = new ArrayList<User>();
			userList=userdao.ViewAllUser();
		%>
		<div id="allusers">
			<table class="table table-striped">
				<thead class="table table-dark">
					<tr>
						<th >User id</th>
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

	</div>
</body>
</html>