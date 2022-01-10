<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
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
       padding-right: 45px;
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
 
    color: orange;
    border-radius: 5px;
    cursor: pointer;
}
body{
    
    background-image: url("Assets/homepage_img.jpg");
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
#register{
position: relative;
left:60px;
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
    
#companyname{
    position: absolute;
    text-align: center;
    left: 100px; 
    top: 0px;
    
}
#companyname img{
    width: 120px;
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
                    
                    <!-- <li> <a>SignOut</a></li> -->
                    <li onclick="getRegisterForm()"> <a id="register">SignUp</a></li>
                    <li onclick="getLoginForm()"> <a id="login">Login</a></li>
                </ul>
            </nav>
            <div class="logo">
                <img src="Assets/medhublogo.png" alt="logo">
                    
                      <div id="companyname">
                        <img   src="https://d1hbpr09pwz0sk.cloudfront.net/logo_url/medhub-f6c08b33" alt="logo">
                    </div>
            </div>
        </div>

        <!-- login screen default hidden -->
        <div class="loginscreen" id="loginform">
      <%  String errorMessage= (String)session.getAttribute("userNotFound"); 
      	
      if(errorMessage!=null)
      { %>
    	<h2><%=errorMessage%></h2>  
     <%}
      %>
            <form action="LoginController" class="formcontent" method="post">
                <h2>Login Here</h2>
                <label for="fullName">Email*</label><br>
                <input type="text" name="loginMail" required placeholder="Enter Email"><br><br><br>
                <label for="password" >Password *</label><br>
                <input type="password" name="loginPassword" placeholder="Password" name="" value="" required
                    pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%?&]{8,15}$"
                    title="Minimum eight and Minimum 8 and maximum 15 characters, at least one uppercase letter, one lowercase letter, one number and one special character"><br><br>
                <button id="loginbtn">Login</button><br><br><br>
                <a onclick="getRegisterForm()" id="register" >Not Registered Yet ?</a> 
                <!--  <a id="forgetpassword"
                    href="ForgetPassword.html">Forget Password</a><br> --> 
                    <% String error=(String)session.getAttribute("error");
            if(error!=null) {%>
           <p><%=session.getAttribute("error") %></p>
           
            <%} session.removeAttribute("error"); %>
            </form>
        </div>

        <!-- sign/register form -->
        <div id="registerScreen">
            <div id="registerScreenContent">
                <form action="RegisterController" class="registerform" method="post">
                    <label for="fullName" class="reglab" ">FullName*</label><br><br>
                    <input type="text" name="regfullName" id="fullname" placeholder="Enter fullname" required><br><br>
                    <label for="mail" class="reglab">Mail Id</label><br><br>
                    <input type="email" name="regMail" placeholder="Enter Mail Id" required><br><BR>
                    <label for="phone" class="reglab">Mobile Number*</label><br><br>
                    <input type="text" name="regMobile" required placeholder="Enter Mobile Number" pattern="[0-9]{10}"
                        title="MObile Number Must Have 10 Digits" required min="3" max="3"><br><br>
                    <label for="password" class="reglab">Password*</label><br><br>
                    <input type="password" input="password" placeholder="Password" name="regPassword" value="" required
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%?&]{8,15}$"
                        title="Minimum eight and Minimum 8 and maximum 15 characters, at least one uppercase letter, one lowercase letter, one number and one special character"><br><br>
                    <label for="confirnPassword" class="reglab" name="regConfirmPassword">Confirm Password*</label><br><br>
                    <input type="password" name="confirmPassword" placeholder="Confirm Password" required
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%?&])[A-Za-z\d@$!%?&]{8,15}$"
                        title="Minimum 8 and maximum 15 characters, at least one uppercase letter, one lowercase letter, one number and one special character"><br><br><br>
                    <!-- <label for="address" class="reglab">Address</label></br><br> -->
                    <!-- <textarea name="address" id="address" cols="30" rows="5"
                        style="max-width: 300px;max-height: 100px;border-radius: 3px;outline: none;"></textarea><br><br> -->
                        
                    <button id="regbtn" type="submit">Register</button>
            </div>
            </form>
        </div>

        <div class="footer">

        </div>

    </div>

<script>
function getLoginForm()
{
    document.getElementById("loginform").style.visibility="visible";
    document.getElementById("registerScreen").style.visibility="hidden";
    
}
function getRegisterForm()
{
    document.getElementById("registerScreen").style.visibility="visible";
    document.getElementById("loginform").style.visibility="hidden";
    // document.getElementById("loginform").style.visibility="hidden";
}


</script>

</body>
</html>