<%-- 
    Document   : CashTransfer
    Created on : 16 Jul, 2019, 10:23:02 PM
    Author     : Shivam
--%>

<%@page import="Utils.Intermediate"%>
<%@page import="Utils.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        html{
            background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
        }
        
        div{
           background: #ffffff;
           border-radius: 10px;
           width: 570px;
           margin-left: auto;         
           margin-right: auto;
           margin-top: 3%;
           padding-left: 40px;
           padding-right: 40px;
           padding-top: 9px;
           padding-bottom: 50px;
           margin-bottom: 55px;            
        }  
        
        .button{
            border:1px solid #1a73e8;
            padding: 10px;
            padding-left: 40px;
            padding-right: 40px;
            background:#1a73e8;
            text-decoration: none;
            color:#ffffff;
            transition: 0.2s;
            cursor: pointer;
        }
        
        .button:hover{
            color:#1a73e8;
            background:#ffffff;
        }
        
        p{
            font-family: "Georgia";
            color: #1a73e8;
            font-size: 38px;
        }
        
        .general{
            font-size: 24px;
        }
        
        .balance{
           font-family: default;
           font-size: 26px;
        }
    </style>
     <script type="text/javascript">
            function validate()
            {
                var flag=true;
                
                var accno = document.getElementsByName("AccNo")[0].value;
                var accno2 = document.getElementsByName("AccNo2")[0].value;
                var TransferAmount = document.getElementsByName("TransferAmount")[0].value;
                var Balance = Number(document.getElementsByName("Balance")[0].value); 
                
                if(TransferAmount.length===0)
                {
                    alert("Amount cannot be empty");
                    flag=false;
                }  
                if(isNaN(TransferAmount)){
                    flag=false;
                    alert("Amount cannot be alphabets");
                }
                if(TransferAmount<0){
                    flag=false;
                    alert("Amount cannot be negative");
                }
                if(TransferAmount>Balance){
                    flag=false;
                    alert("Check account balance before transferring money");
                }
                if(accno!==accno2){
                    flag=false;
                    alert("Check receiver account number !");
                }
        
                var pin = document.getElementsByName("pin")[0].value;
                var CorrectPin = document.getElementsByName("CorrectPin")[0].value;
                
                if(pin!==CorrectPin){
                    flag=false;
                    alert("Pin Invalid !!");
                }
                
                return flag;
            };
        </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cash Connect</title>
    </head>
    <body>
        <div align="center"> 
            <form action="TransferMoneyHandler" method="post" onsubmit="return validate();">
                <input type="hidden" name="CorrectPin" value="<%=Constants.pin%>" >
                <input type="hidden" name="Balance" value="<%=Constants.balance%>" >
                
                <p><u>Transfer Money</u></p><br>
                
                <p class="balance"><i><u>Receiver credentials: </u></i></p><br>
                
                <input type="text" name="AccNo" placeholder="Enter Account Number" style="height:45px;width: 300px;font-size: 17px"><br><br><br>
                
                <input type="text" name="AccNo2" placeholder="Confirm Account Number" style="height:45px;width: 300px;font-size: 17px"><br><br><br>
            
                <input type="number" name="TransferAmount" placeholder="Enter Amount" style="height:45px;width: 300px;font-size: 17px"><br><br><br><br>
            
            <p class="balance"><i><u>Your credentials: </u></i></p>
            
            <% out.print("<p class=\"balance\">Your Account Balance is: &nbsp;"+Constants.balance+"</p>");  %>
            
            <input type="password" name="pin" placeholder="Enter 4-digit ATM Pin" style="height:45px;width: 300px;font-size: 17px"><br><br><br><br>
            
            <input class="button" type="submit" name="button" value="Transfer" style="height:45px;width: 300px;font-size: 17px">
            </form>
        </div>
    </body>
</html>
