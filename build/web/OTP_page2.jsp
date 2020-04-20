<%-- 
    Document   : OTP_page
    Created on : 17 Oct, 2019, 2:38:11 AM
    Author     : Shivam
--%>

<%@page import="Utils.Intermediate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cash Connect</title>
        <style>
            html{
                background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
            }
            
            div{
                background: #ffffff;
                border: 1px solid lightgrey;
                border-radius: 10px;
                width: 450px;
                margin-left: auto;         
                margin-right: auto;
                margin-top: 7%;
                align-content: center;
                padding-top: 45px;
                padding-bottom: 75px;
                padding-left: 60px;
                padding-right: 60px;
                margin-bottom: 202px;
            }
            
            p{
                font-family: "Georgia";
                color: #1a73e8;
                font-size: 32px;
            }
            
            input{
               height:45px;
               width: 280px;
               font-size: 16px; 
            }
            
            .submitbtn{
                border:1px solid #1a73e8;
                padding-left: 40px;
                padding-right: 40px;
                background:#1a73e8;
                text-decoration: none;
                color:#ffffff;
                transition: 0.4s;
                cursor: pointer;
            }
            
            .submitbtn:hover{
                color:#1a73e8;
                background:#ffffff;
            }
        </style>
        <script>
            function validate()
            {   
                var otp = document.getElementsByName("otp")[0].value;
                var CorrectOTP = document.getElementsByName("CorrectOTP")[0].value;
                
                if(otp!==CorrectOTP)
                {
                    alert("Invalid OTP !!");
                    return false;
                }               
                                                   
                return true;
            };
        </script>
    </head>
    <body>
    <form action="ITHandler2" method="post" onsubmit="return validate();">
        <input type="hidden" name="CorrectOTP" value="<%=Integer.parseInt(Intermediate.otp)%>" >
        
        <div align="center"> 
            <p style="margin-bottom:0px;">Enter OTP</p>
            <input type="number" name="otp" placeholder="OTP"><br><br><br>
             <p style="color: red; font-size: 23px;">*OTP is sent to your registered email account.</p><br>
             <input class="submitbtn" type="submit" name="submitbtn" value="Submit">
        </div>
    </form>
    </body>
</html>
