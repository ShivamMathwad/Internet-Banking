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
                width:400px;
                height:400px;
            }
            
            
            p{
                color:#1a73e8;
                font-size: 40px;
            }
            
            a{
                border: 1px solid #1a73e8;
                border-radius: 5px;
                padding-left:50px;    
                padding-right:50px;    
                padding-top: 5px;
                padding-bottom: 5px;
                font-size: 18px;
                color: white;
                background:#1a73e8;
                text-decoration: none;
                transition: 0.5s ease;
            }
            
            a:hover{
                background: white;
                color:#1a73e8;
            }
            
        </style>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer Successful</title>
    </head>
    <body>
        <div>
        <img src="tick.png"/>
        <p>Transfer Successful</p>
        <a href="http://192.168.0.30:8080/InternetBanking/MainActivity.jsp">Back</a>
        </div>
    </body>
</html>
