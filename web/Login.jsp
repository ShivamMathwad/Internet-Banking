<%-- 
    Document   : Login
    Created on : 11 Jul, 2019, 9:31:02 PM
    Author     : Shivam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Handlers.LoginClickHandler"%>

<!DOCTYPE html>
<html>
    
    <style>

        html{ 
            overflow-y: hidden; 
            background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
        }

        div{
            background: #ffffff;
            border:1px solid lightgrey;
            border-radius: 10px;
            padding-top: 21px;
            padding-bottom: 22px;
            padding-left: 60px;
            padding-right: 60px;
            position: absolute;
            left: 30%;
            right: 20%;
            top:10%;
            margin-bottom: 36px;
            width:500px;
        }
        
        .Loginbtn{
            border:1px solid #1a73e8;
            padding: 10px;
            padding-left: 40px;
            padding-right: 40px;
            background:#1a73e8;
            text-decoration: none;
            color:#ffffff;
            transition: 0.2s;
        }
        
        .Loginbtn:hover{
            color:#1a73e8;
            background:#ffffff;
        }
        
        p{
            font-family: "Georgia";
            color: #1a73e8;
            font-size: 38px;
        }
        
        .logintxt{
            font-size: 32px;
        }
        
        .submitbtn{
            text-decoration: none;
            border:1px solid #1a73e8;
            padding: 10px;
            padding-left: 40px;
            padding-right: 40px;
            background:#1a73e8;
            cursor: pointer;
            color:#ffffff;
            transition: 0.2s;
        }
        .submitbtn:hover{
            color:#1a73e8;
            background:#ffffff;
        }
        
        a{
            text-decoration: none;
            font-size: 19px;
            color:#1a73e8;
        }
    </style>
       <script type="text/javascript">
            function validate()
            {
                var valid=true;
                
                var phone = document.getElementsByName("phone")[0].value;
                
                if(phone.length!==10)
                {
                    alert("Enter 10-digit phone no.");
                    valid=false;
                }               
                                                   
                return valid;
            };
        </script>
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cash Connect</title>
    </head>
    <body align="center">
        <div>
            <form action="LoginClickHandler" method="post" onsubmit="return validate();">
                <img src="./Success/Capture.PNG" height="160" width="340" style="margin-top: 10px;"> 
                <p class="logintxt">Login</p>
              <input type="number" name="phone" placeholder="Phone number" style="height:45px;width: 330px;font-size: 17px"/><br><br><br>
              <input type="password" name="password" placeholder="Password" style="height:45px;width: 330px;font-size: 17px"/><br><br><br>
              <input type="submit" value="Login" class="submitbtn">              
            </form>          
            
            <br>
            <a href="http://192.168.0.30:8080/InternetBanking/Register.jsp">Don't Have an Account?</a>
              <br><br>
        </div>                    
    </body>
</html>
