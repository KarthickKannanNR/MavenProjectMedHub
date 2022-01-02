<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
</head>
<body>
    <div id="container">
   
        <form action="AddProductController">
            <label for="category">Category</label>
            <input list="category" name="category" id="browser">
            <datalist id="category">
              <option value="medicine">
              <option value="sanitizer">
              <option value="babycare">
              <option value="devices">
              <option value="healthdrink">
            </datalist><br>
            <label for="name">Product Name</label>
            <input type="text" required name="productName"><br>
            <label for="price">Price</label>
            <input type="text"  name="price"><br>
            <label for="Quantity" >Quantity</label>
            <input type="text"  required name="quantity"><br>
            <label for="image">Image Url</label>
            <input type="text" required name="imageUrl"><br>
            <label for="Points">Points</label>
            <input type="text" required name="points"><br>
            <label for="Offer">Offer</label>
            <input type="text"  required name="offer"><br>
            <label for="">Description</label>
            <textarea style="max-height: 150px; min-height: 20px; width: 400px; max-width: 200px; min-width: 10px;" required name="description"></textarea><br>
            <button type="submit">Submit</button>
        </form>

    </div>
</body>
</html>