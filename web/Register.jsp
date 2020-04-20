<%-- 
    Document   : Register
    Created on : 11 Jul, 2019, 11:01:34 PM
    Author     : Shivam
--%>

<%@page import="Handlers.RegisterClickHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        
        html{
            background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
        }
        
        #dropdown {
            display: block;
            color: #1a73e8;
            height:45px;
            width: 330px;
            font-size: 17px; 
            border: 1px solid #1a73e8;
        }    
        
        div{
            background: #ffffff;
            border:1px solid lightgrey;
            border-radius: 10px;
            padding-top: 5px;
            padding-bottom: 55px;
            padding-left: 60px;
            padding-right: 60px;
            margin-left: 30%;
            margin-top: 50px;
            width:500px;
            margin-bottom: 50px;
        }
        
         p{
            font-family: "Georgia";
            color: #1a73e8;
            font-size: 38px;
        }
        
        input{
           height:45px;
           width: 330px;
           font-size: 17px; 
        }
        
        .Registerbtn{
            border:1px solid #1a73e8;
            padding-left: 40px;
            padding-right: 40px;
            background:#1a73e8;
            text-decoration: none;
            color:#ffffff;
            transition: 0.4s;
            cursor: pointer;
        }
        
        .Registerbtn:hover{
            color:#1a73e8;
            background:#ffffff;
        }
        
    </style>
    
    <script type="text/javascript">
        function validate()
        {
           var flag = true;
           
           var dd = document.getElementById("dropdown");
           var country = String(dd.options[dd.selectedIndex].value);
           
           if(country==="Select Country")
           {
               flag=false;
               alert("Select a country");
           }    
               
           var FirstName = document.getElementsByName("FirstName")[0].value;
           var LastName = document.getElementsByName("LastName")[0].value;
           var email = document.getElementsByName("email")[0].value;
           var phone = document.getElementsByName("phone")[0].value;
           var accno = document.getElementsByName("accno")[0].value;
           var pin = document.getElementsByName("pin")[0].value;
           var password = document.getElementsByName("password")[0].value;
           var cpassword = document.getElementsByName("cpassword")[0].value;
           
           
           if(FirstName.length<1 || LastName.length<1){
             flag=false;
             alert("Enter valid username");
           }          
           else if(email.length<9 || email.indexOf("@")<=3 || email.indexOf(".")<2){
             flag=false;
             alert("Enter valid Email");
           }             
           else if(phone.length!==10){
             flag=false;
             alert("Enter valid Phone no.");
           }
           else if(accno.length!==15){
             flag=false;
             alert("Enter 15-digit account no."); 
           }
           else if(pin.length!==4){
             flag=false;  
             alert("Enter valid pin");
           }
           else if(cpassword!==password){
             flag=false;
             alert("Password incorrect !");
           }  
           
         return flag;
        };
    </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cash Connect</title>
    </head>
    <body>
        <form action="RegisterClickHandler" method="post" onsubmit="return validate();">
        <div align="center" style="margin-right: 20%;">
             <p>REGISTER</p>
             
             <select id="dropdown" name="dropdown">
                <option disabled selected>Select Country</option>
                <option>India</option>
                <option>US</option>
                <option>Japan</option>
                <option>Russia</option>
            </select><br><br>
             
             <input type="text" name="FirstName" placeholder="First Name"><br><br><br>
             <input type="text" name="LastName" placeholder="Last Name"><br><br><br>
             <input type="text" name="email" placeholder="Email-id"><br><br><br>
             <input type="number" name="phone" placeholder="Phone number"><br><br><br> 
             <input type="number" name="accno" placeholder="Account number"><br><br><br> 
             <input type="number" name="pin" placeholder="ATM Pin"><br><br><br>
             <p style="font-size: 27px;"><i>Create Password</i></p>
             <p style="font-size: 20px;">Create a password for your CashConnect Account</p>
             <input type="password" name="password" placeholder="Password"><br><br><br>
             <input type="password" name="cpassword" placeholder="Confirm Password"><br><br><br><br> 
             <input class="Registerbtn" type="submit" name="submitbtn" value="Submit">
        </div>
    </form>
        
        
    </body>
</html>
