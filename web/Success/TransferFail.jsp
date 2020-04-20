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
        <title>Transfer Failed</title>
    </head>
    <body>
        <div>
        <img src="fail.png"/>
        <p>Transfer Failed</p>
        <p style="font-size: 30px;">Check Receiver Credentials</p><br>
        <a href="/ATM_Simulator/CashTransfer.jsp">Back</a>
        </div>
        
    </body>
</html>
