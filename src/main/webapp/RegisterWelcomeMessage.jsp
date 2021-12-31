<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
    *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
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
    
    background-image:url("Images/homepage_img.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    height: 100vh;
    overflow-x: hidden;
}

.logo img{
    height: 60px;
    width: 60px;
    margin-left: 20px;
}

/* login form */

#loginform{
    position: absolute;
    top: 200px;
    left: 490px;
    background-color: rgb(221, 187, 125);
    height: 400px;
    width: 400px;
    border-radius: 5px;
    visibility: visible;
    box-shadow: 0 0 5px black;
}

.formcontent{
    position: relative;
    top: 110px;
    left: 75px;
    
}
.formcontent h2{
    color: black;
    position: relative;
    top: -50px;
    left: 60px;

}

#loginbtn{
    position: relative;
    left: 90px;
    height: 25px;
    width: 90px;
    outline: none;
    border: 0;
    width: 80px;
    height: 30px;
    border-radius: 3px;
    font-weight: 500;
}

#loginbtn:hover{
    /* color: white; */
    font-weight: 800;
    background-color: grey;
    cursor: pointer;
}

.loginscreen .formcontent input
{
    height: 25px;
    width: 60%;
    outline: none;
    border-radius: 3px;
    outline: none;
    border-top: none;
    border-left: none;
    border-right: none;
    background: transparent;
    font-size: 18px;
    color: white;
}

.loginscreen .formcontent a{
    
    text-decoration: none;
    color: white;
    font-size: larger;
    position: relative;
    left:-20px;    
}

.loginscreen .formcontent a:hover{

    text-decoration: underline;
    color: black;
    cursor: pointer;
}

#loginbtn{
    position: relative;
    left: 90px;
    height: 25px;
    width: 90px;
    outline: none;
    border: 0;
    width: 80px;
    height: 30px;
    border-radius: 3px;
    font-weight: 500;
}

/* register screen */

#registerScreen{
   height: 600px;
   width: 400px; 
   position: absolute;
   top: 120px;
   left: 490px;
   background-color: rgb(221, 187, 125);
   border-radius: 5px;
   visibility: hidden;
     
}

#registerScreenContent{
    position: relative;
    text-align: center;
    top: 30px;
}

#registerScreenContent input{
    border-top: none;
    border-left: none;
    border-right: none;
    background: none;
    outline: none;
    width: 300px;
    color: white;
    font-size: 18px;
    
}

#registerScreenContent button{
    height: 30px;
    width: 120px;
    outline: none;
    border: 0;
    border-radius: 3px;
    font-weight: 500;
    position: relative;
    bottom: 0;
    
}


#regbtn:hover{
    /* color: white; */
    font-weight: 800;
    background-color: grey;
    cursor: pointer;
}

#registerScreen{
    box-shadow: 0 0 5px black;
}

#address{
    font-size: 18px;
}

.forgetpassword{
    position: absolute;
    top: 200px;
    left: 490px;
    background-color: rgb(221, 187, 125);
    height: 400px;
    width: 400px;
    border-radius: 5px;
    visibility: visible;
    box-shadow: 0 0 5px black;
}
#registermsg{
position:absolute;
left:550px;
top:70px;
}
    
    </style>
</head>
<body>
<body id="body">
    <div id="container">
        <!-- <div class="header">
        </div> -->
	
        <!-- Navigation Bar -->
        <div class="nav">

            <nav class="list">
                <ul>
                    <li> <a>Cart</a></li>
                    <!-- <li> <a>SignOut</a></li> -->
                    <li onclick="getRegisterForm()"> <a id="register">Signup</a></li>
                    <li onclick="getLoginForm()"><a id="login">Login</a></li>
                </ul>
            </nav>
            <div class="logo">
                <img src="Images/medhublogo.png"
                    alt="logo">
            </div>
        </div>
		<h2 id="registermsg">Registered Sucessfully</h2>
        
</body>
</html>