<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Userhome</title>
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

/* banner */
.slide{
    position: absolute;
    top: 120px;

}
/* progress */
.products{
    margin-top: 330px;
    border-spacing:0 200px;
}

.slide img{
    box-shadow: 0 0 10px black;
}

.products tr td{
    padding-left: 220px;
}
img{
    box-shadow: 0 0 10px black;
}

.logo img{
    box-shadow: none;
}
#copyrights{
    text-align: center;
    color: yellow;
}
#allproducts a{
    text-decoration: none;
    color: black;
}
#allproducts a:hover{
    text-decoration: underline;
    color: white;
}
#allproducts{
    text-align: center;
}


    </style>
</head>

<body>
    <div id="container">
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
        <!-- slideshow -->
        <div class="slide" style="max-width:500px">
            <img class="mySlides" src="Images/banner7.jpg" alt="banner" style="width: 1365px;height: 250px;">
        </div>

        <table class="products">
            <tr>
                <td><a href=""><img src="Images/AxePerfume.jpg" alt="axeperfume"></a></td>
                <td><a href=""><img src="Images/baby_dove_shampoo.jpg" alt="babydove"></a></td>
                <td><a href=""><img src="Images/digene_gel.jpg" alt="digene"></a></td>
            <tr>
                <td><a href=""><img src="Images/whisperUltraXl.jpg" alt="whisper"></a></td>
                <td><a href=""><img src="Images/Vaseline_daily_brightning.jpg" alt="vaseline"></a></td>
                <td><a href=""><img src="Images/doveshampoo.jpg" alt="doveshampoo"></a></td>
            </tr>
        </table>

        <h2 id="allproducts"><a href="">See All Products</a></h2><br><br><br><br><br><br><br>
        <h2 id="copyrights">
            © 2021 MedHub.com. All rights reserved.
        </h2>

    </div>






    </div>
    <div id="footer"></div>


</body>

</html>
