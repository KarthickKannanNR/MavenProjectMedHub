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
        
    </style>
</head>
<body>
    <table>
        <tbody>
            
            <tr>
                <td>
                    image
                </td>
               <td><img src="https://static2.medplusmart.com/products/_923a24_/BOOS0008_S.jpg" alt=""></td>
               <td><p><b>Product category:</b> </p>
                   <p><b>Product Name:</b></p>
                   <p><b>Description:</b></p>
                   <p><b>Price:</b></p>
                   <p><b>Quantity:</b></p>
                   <p><b>Points:</b></p>
                   <p><b>Offer:</b></p>
               </td>
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
                <div id="description">
                    <p><b>Description: </b><br> <p>
                    <p>Quantity:<input type="number" id="quantity" max="" min="0"  name="quantity"></p>
                    <p><button type="button"  onclick="addToCart()" >Add to Cart</button>
                       <button type="button" onclick="buyNow()">Buy Now</button></p>
                    <p name="message" id="message"><p>
                    </div>
              </td>
            </tr>
            </tbody>
            </table>
             
             
             <tr>
</body>
</html>