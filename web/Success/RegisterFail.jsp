<%-- 
    Document   : RegisterSuccess
    Created on : 15 Jul, 2019, 11:07:30 PM
    Author     : Shivam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            div{
             position:absolute;
             left: 50%;
             top:50%;
             transform: translate(-50%,-50%);
             text-align: center;
            }
            
            img{
                width:550px;
                height:400px;
            }
            
            
            p{
                color:red;
                font-size: 40px;
            }
            
            a{
                border: 1px solid red;                
                border-radius: 5px;               
                padding-left:50px;    
                padding-right:50px;    
                padding-top: 5px;
                padding-bottom: 5px;
                font-size: 18px;
                color: red;
                background:white;
                text-decoration: none;
                transition: 0.5s ease;
            }
            
            a:hover{
                background: red;
                color:white;
            }
            
            
        </style>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Fail</title>
    </head>
    <body>
        <div>
        <img src="fail.png"/>
        <p>Registration Failed! Check all credentials</p>
        <a href="http://192.168.0.30:8080/InternetBanking/Login.jsp">Back</a>
        </div>
        
    </body>
</html>
