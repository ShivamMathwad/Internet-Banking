<%-- 
    Document   : MainActivity
    Created on : 11 Jul, 2019, 11:03:32 PM
    Author     : Shivam
--%>

<%@page import="Utils.Constants"%>
<%@page import="Models.UserModel"%>
<%@page import="Database.DBHelper"%>
<%@page import="Handlers.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        
        .logo{
            height: 95px; 
            width: 300px; 
            margin-top: 8px;
            margin-left: 28px;
            margin-right: 0px;
        }
        
        .general{
            border:1px solid #1a73e8;
            padding-left: 40px;
            padding-right: 40px;
            background: #ffffff;
            text-decoration: none;
            color:#1a73e8;
            height:43px;
            width: 248px;
            border-radius: 7px;
            font-size: 17px; 
            transition: 0.4s;
            cursor: pointer;  
        }
        
        .general:hover{
            color:#ffffff;
            background:#1a73e8;  
        }
        
        img{
           position: relative;
           margin-top: 25px;
        }
        
        .welcome{
           font-size: 35px;
           color:#1a73e8;
        }
        
        .balance{
           font-size: 26px;
           color:#1a73e8; 
        }
        
        .logout{
           height:40px;
           width:100px;
           margin-top: 2%;
           text-align: center;
           border:1px solid #1a73e8;
           background:#ffffff;
           text-decoration: none;
           color: #1a73e8;
           margin-right: 20px;          
           border-radius: 7px;
           font-size: 17px; 
           transition: 0.4s;
           cursor: pointer;
           float:right;
        }
        
        .logout:hover{
            color:#ffffff;
            background:#1a73e8;  
        }
        
        .grid-container1 {
  display: inline-grid;
  grid-template-columns: 248px 248px 248px;
  grid-column-gap: 60px;
}

.grid-container2 {
  display: inline-grid;
  grid-template-columns: 248px 248px;
  grid-column-gap: 40px;
}

.grid-item {
  align-self: center;
}
        
    </style>
    <script type="text/javascript"> 
            function LogoutCheck()
            {
                var flag=false;
                
                if(flag==false){
                    var result = confirm("Are you sure you want to logout?");
                    if(result==true)
                    flag=true;
                    else 
                    flag=false;
                }        
                return flag;
            };
     </script>
    <head>
           <% UserModel m;
          String phone = Constants.phone;                             
           DBHelper db = new DBHelper();
           m = db.readeverythingfromDB(phone,Constants.accno); 
           String Name = m.getFirstname()+" "+m.getLastname();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cash Connect</title>
    </head>
    <body>
        
        <form method="post" action="Login.jsp" onsubmit="return LogoutCheck();">
            <img src="./Success/Capture.PNG" class="logo">
            <input class="logout" type="submit" name="Logout" value="Logout">
        </form>
            
        <div align="center">
            
         <% out.print("<p class=\"welcome\">Welcome  "+Name+"</p>"); %>
            
         <img src="account.png" height="147px" width="147px"><br><br><br><br><br>
            
            <div class="grid-container1">
                <div class="grid-item">
                    <form action="AccInfo.jsp">  
                        <input class="general" type="submit" name="accountInfo" value="My Account Info">     
                    </form>
                </div>
                <div class="grid-item">
                    <form action="CashTransfer.jsp">  
                        <input class="general" type="submit" name="TransferMoney" value="Transfer Money">
                    </form>
                </div>
                <div class="grid-item">
                    <form action="InternationalTransfer.jsp">  
                        <input class="general" type="submit" name="InternationalTransfer" value="International Transfer">
                    </form>
                </div>
            </div>
         <br><br><br><br>
            <div class="grid-container2">
                <div class="grid-item">
                    <form action="TransactionHistory.jsp">  
                        <input class="general" type="submit" name="TransactionHistory" value="Transaction History">
                    </form>
                </div>
                <div class="grid-item">
                    <form action="CurrencyConverter.jsp">  
                        <input class="general" type="submit" name="CurrencyConversion" value="Currency Converter">
                    </form>
                </div>
            </div>         
        </div>
         
    </body>
</html>
