<%-- 
    Document   : TransactionHistory
    Created on : 17 Jul, 2019, 2:49:04 PM
    Author     : Shivam
--%>

<%@page import="Utils.Constants"%>
<%@page import="Models.HistoryModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Database.DBHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Cash Connect</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <style>
        
        p{
            font-family: "Georgia";
            color: #1a73e8;
            font-size: 38px;
            text-align: center;
        }
        
        .redtext{
            font-family: "Georgia";
            color: red;
            font-size: 38px;
            margin-top: 15%;
            text-align: center;
        }
        
        table{
            text-align: center;
        }
        
         a{
             border: 1px solid red;
             border-radius: 5px;
             padding-left:50px;    
             padding-right:50px;    
             padding-top: 5px;
             padding-bottom: 5px;
             font-size: 18px;
             color: white;
             background: red;
             transition: 0.5s ease;                     
             text-decoration: none;
          }
            
        a:hover{
             background: white;
             color: red;
         }
            
        </style>

  </head>
  <body>
    <div class="container">
	<div class="row">
	<div class="col-md-6 offset-md-3">
      
            <% 
                DBHelper db = new DBHelper();
                ArrayList<HistoryModel> arr = new ArrayList();
                arr = db.getHistoryFromAccno(Constants.accno);
                
                if(arr.size()>0){   //If transaction history is present
                out.print("<p style=\"font-size:42px; margin-top:15px;\">Transaction History</p>");
                out.print("<p><u>"+db.readeverythingfromDB(Constants.phone,Constants.accno).getFirstname()+" "+db.readeverythingfromDB(Constants.phone,Constants.accno).getLastname()+"</u></p>");
                out.print("<br>");
                out.print("<table class=\"table table-bordered table-hover table-striped\">");
                out.print("<thead class=\"thead-dark\">");
                out.print("<tr>");
                out.print(" <th>Number</th>");
                out.print("<th>Date</th>");
                out.print("<th>Amount</th>");
                out.print(" <th>Remark</th>");
                out.print(" <th>Sender/Receiver</th>");
                out.print(" <th>Foreign Transaction</th>");
                out.print("</tr>");
                out.print("</thead>");
                
                
                for(int i=0;i<arr.size();i++){
                    out.print("<tr>");
                    out.print("<td>"+(i+1)+"</td>");
                    out.print("<td>"+arr.get(i).getDate()+"</td>");
                    if(arr.get(i).getRemark().equalsIgnoreCase("debit"))
                          out.print("<td class=\"text-danger\"> -"+arr.get(i).getAmount()+"</td>");  
                    else
                        out.print("<td class=\"text-success\"> +"+arr.get(i).getAmount()+"</td>");  
                    
                    out.print("<td>"+arr.get(i).getRemark().toUpperCase()+"</td>");
                    out.print("<td>"+arr.get(i).getSenderORreceiver()+"</td>"); 
                    out.print("<td>"+arr.get(i).getForeign()+"</td>"); 
                    out.print("</tr>");
                }
                out.print("</tbody>");
                out.print("</table>");
                }
                else{   //If NO transaction history present
                    out.print("<p class=\"redtext\">No transaction history</p><br><br>");
                    out.print("<div align=\"center\"><img src=\"./Success/NoHistory.png\" height=\"260\" width=\"260\"></div><br><br><br><br><br>");
                    out.print("<div align=\"center\"><a href=\"http://192.168.0.30:8080/InternetBanking/MainActivity.jsp\">Back</a></div>");
                }
                
                %>

	  </div>	 	 
	</div>
    </div>
  </body>
</html>
