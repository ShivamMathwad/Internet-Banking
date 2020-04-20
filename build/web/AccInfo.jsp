<%-- 
    Document   : AccInfo
    Created on : 20 Oct, 2019, 12:26:45 PM
    Author     : Shivam
--%>

<%@page import="Utils.Constants"%>
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
                border: 1px solid lightgrey;
                border-radius: 10px;
                width: 600px;
                background: #ffffff;
                margin-left: auto;         
                margin-right: auto;
                margin-top: 3%;
                margin-bottom: 3%;
                padding-bottom: 36px;            
            }
            
            .general{
                font-family: "Times New Roman";
                color:#1a73e8;
                font-size: 37px;
            }
            
            .delete{
                height: 40px;
                width: 280px;
                text-align: center;
                border:1px solid red;
                background:#ffffff;
                text-decoration: none;
                color: red;          
                border-radius: 7px;
                font-size: 17px; 
                transition: 0.4s;
                cursor: pointer;             
            }
        
            .delete:hover{
                color:#ffffff;
                background: red;  
            }
        </style>
        <script>
            function DeleteCheck()
            {
                var flag=false;
                
                if(flag===false){
                    var result = confirm("Are you sure you want to delete account?");
                    if(result===true)
                    flag=true;
                    else 
                    flag=false;
                }       
                return flag;
            };
        </script>
    </head>
    <body>
        <div align="center">
            
            <% out.print("<p class=\"general\">"+Constants.firstname+" "+Constants.lastname+"</p>");  %><br>
            
            <p class="general" style="font-size: 27px;"><u>Personal Details</u></p>
            
            <% out.print("<p class=\"general\" style=\"font-size: 24px;\">Country : "+Constants.country+"</p>");  %>
            <% out.print("<p class=\"general\" style=\"font-size: 24px;\">Phone no : "+Constants.phone+"</p>");  %>
            <% out.print("<p class=\"general\" style=\"font-size: 24px;\">Email-id : "+Constants.email+"</p>");  %><br><br>
            
            <p class="general" style="font-size: 27px;"><u>Banking Details</u></p>
            
            <% out.print("<p class=\"general\" style=\"font-size: 24px;\">Account no : "+Constants.accno+"</p>");  %>
            <% out.print("<p class=\"general\" style=\"font-size: 24px;\">Balance : "+Constants.balance+"</p>");  %><br><br><br>
            
            <form method="post" action="DeleteAccountHandler" onsubmit="return DeleteCheck();">
                <input class="delete" type="submit" name="Delete" value="Delete Account">
            </form>
            
        </div>
    </body>
</html>
