<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
<style>
    * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }
        body{
    
    background-image:url("Images/homepage_img.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    height: 100vh;
    overflow-x: hidden;
	}
    #addProductForm{
    position: absolute;
    top:150px;
    left:500px;
    background-color: rgb(240, 231, 231);
    height: 550px; 
    width: 360px;
    border-radius: 5px;
    
    }
    #addProductForm label{
    position: relative;
    top: 20px;
    padding-top: 20px;
    }
    #addProductForm input{
    position: relative;
    top: 20px;
    left: 30px;
    height: 30px;
    width: 300px;
    }
    #addProductForm textarea{
    margin-left: 30px;
    width: 300px;
    }
    #addProductForm .inputBox{
    position: relative;
    }
    #addProductForm  button{
    position: relative;
    width:60px;
    padding:5px;
    left: 150px;
    top: 50px;
    }
     #addProductForm  button:hover{
    	background: green;
    	border: none;
    	color:white;
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
        text-shadow: 2px 2px black;       
    	}
        #allusers table,th,tr,td{
        border: 1px solid black;
        border:none;
        padding: 15px;
        }
</style>
</head>
<body>
<div id="container">
     <div id="navigation">
        <ul>
            <li ><a href="AllUser.jsp" >All Users</a></li>
            <li><a href="AdminAllProducts.jsp">All Products</a></li>
            <li><a href="AddProduct.jsp">Add Products</a></li>
        </div>
        </ul>
    </div>
   <div id="addProductForm">
        <form action="AddProductController">
<!--             <label for="category">Category</label>
 -->            <input class="inputBox"list="category" name="category" id="browser" placeholder="Category">
            <datalist id="category">
              <option value="medicine">
              <option value="sanitizer">
              <option value="babycare">
              <option value="devices">
              <option value="healthdrink">
            </datalist><br><br>
<!--             <label for="name">Product Name</label>
 -->            <input class="inputBox" type="text" required name="productName" placeholder="Product Name"><br><br>
<!--             <label for="price">Price</label>
 -->            <input class="inputBox" type="text"  name="price" placeholder="Price"><br><br>
<!--             <label for="Quantity" >Quantity</label>
 -->            <input class="inputBox" type="text"  required name="quantity" placeholder="Quantity"><br><br>
<!--             <label for="image">Image Url</label>
 -->            <input class="inputBox" type="text" required name="imageUrl" placeholder="Image Url"><br><br>
<!--             <label for="Points">Points</label>
 -->            <input class="inputBox" type="text" required name="points" placeholder="Points"><br><br>
<!--             <label for="Offer">Offer</label>
 -->            <input class="inputBox" type="text"  required name="offer" placeholder="Offer%"><br><br><br>
<!--             <label for="">Description</label><br><br>
 -->            <textarea class="inputBox" style="max-height: 100px; min-height: 20px; width: 400px; max-width: 200px; min-width: 300px;" required name="description" placeholder="Product Description"></textarea><br>
            <button type="submit">Update</button>
        </form>
			</div>
</div>

</body>
</html>