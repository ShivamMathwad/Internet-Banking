<%-- 
    Document   : CurrencyConverter
    Created on : 20 Oct, 2019, 9:37:48 PM
    Author     : Shivam
--%>

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
                border-radius: 10px;
                width: 580px;
                margin-left: auto;         
                margin-right: auto;
                margin-top: 7%;
                padding-left: 40px;
                padding-right: 40px;
                padding-top: 9px;
                padding-bottom: 31px;
                margin-bottom: 240px;            
            }
            
            p{
                font-family: "Georgia";
                color:#1a73e8;
                font-size: 28px;
            }
            
            .hidden{
                font-family: "Times New Roman"; 
                color:red; 
                font-size: 19px;
            }
            
            .dropdown{
                height: 40px;
                width: 133px;
            }
            
            .button{
                border:1px solid #1a73e8;
                font-size: 15px;
                padding-top: 10px;
                padding-bottom: 10px;
                padding-left: 30px;
                padding-right: 30px;
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
        </style>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script>
            
            function calculate(){
                var dd1 = document.getElementById("from");
                var fromCountry = String(dd1.options[dd1.selectedIndex].value);
                var dd2 = document.getElementById("to");
                var toCountry = String(dd2.options[dd2.selectedIndex].value);
                var amount = document.getElementsByName("amount")[0].value;
                
                if(fromCountry==="Select Currency" || toCountry==="Select Currency")
                {
                    alert("Select currency!!");
                    return false;
                }
                if(fromCountry===toCountry)
                {
                    alert("Same currencies are not allowed!!");
                    return false;
                }
                if(amount.length===0)
                {
                    alert("Amount cannot be empty");
                    return false;
                }
                
                $.getJSON('https://api.myjson.com/bins/qn0sc', function(data) {
              
                    for(var i=0;i<data.currencies.length;i++)
                    {
                       if(data.currencies[i].from===fromCountry && data.currencies[i].to===toCountry)
                       {
                           var rate = data.currencies[i].rate;
                           break;
                       }
                    }
                    var converted_amt = amount*rate;
                    document.getElementById("rate_hidden").innerHTML = "1 "+fromCountry+" = "+rate+" "+toCountry;
                    document.getElementById("convert_amt_hidden").innerHTML = amount+" "+fromCountry+" = "+converted_amt+" "+toCountry;
                    console.log(converted_amt);
                    console.log(Constants.country);
                }); 
            }
        </script>
    </head>
    <body>
      
        <div align="center">
            <p>CURRENCY CONVERTER</p><br>
            
            <select class="dropdown" id="from" name="from">
                <option disabled selected>Select Currency</option>
                <option>INR</option>
                <option>USD</option>
                <option>JPY</option>
                <option>RUB</option>
            </select> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="font-size: 19px;">to</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select class="dropdown" id="to" name="to">
                <option disabled selected>Select Currency</option>
                <option>INR</option>
                <option>USD</option>
                <option>JPY</option>
                <option>RUB</option>
            </select><br><br>
            
            <p id="rate_hidden" class="hidden"></p>
            
            <input type="number" name="amount" placeholder="Enter Amount" style="height:33px;width: 190px;font-size: 17px"><br><br><br><br>
            
            <input type="submit" class="button" value="Calculate" onclick="return calculate();"><br><br>
            
            <p id="convert_amt_hidden" class="hidden" style="font-size: 24px;"></p>
        </div>
      
    </body>
</html>
