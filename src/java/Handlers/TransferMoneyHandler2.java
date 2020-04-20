/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Handlers;

import Database.DBHelper;
import Mail.MailHelper;
import Models.UserModel;
import Utils.Constants;
import Utils.Helper;
import static Utils.Helper.countryTocurrency;
import Utils.Intermediate;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Shivam
 */
@WebServlet(name = "TransferMoneyHandler2", urlPatterns = {"/TransferMoneyHandler2"})
public class TransferMoneyHandler2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserModel m = new UserModel();
        
        try {
            DBHelper db = new DBHelper();
            
            //Sender
            db.updateDB(Constants.accno,Integer.toString(Intermediate.senderFinalBalance),"debit",Intermediate.transferAmount,Intermediate.receiver_accno,"No",Intermediate.otp);  
            MailHelper mh = new MailHelper(Intermediate.sender_email);
            String cur1 = countryTocurrency(Constants.country);
            mh.sendBalanceDebitMail(Intermediate.transferAmount,Integer.toString(Intermediate.senderFinalBalance),Constants.accno,cur1);   //Send mail to sender
                    
            //Receiver          
            db.updateDB(Intermediate.receiver_accno,Integer.toString(Intermediate.receiverFinalBalance),"credit",Intermediate.transferAmount,Intermediate.sender_accno,"No","None");  
            MailHelper mail = new MailHelper(Intermediate.receiver_email);
            String cur2 = countryTocurrency(Intermediate.receiver_country);
            mail.sendBalanceCreditMail(Intermediate.transferAmount,Integer.toString(Intermediate.receiverFinalBalance),Intermediate.receiver_accno,cur2); //Send mail to receiver
            
        } 
        catch (Exception ex) {
            Logger.getLogger(TransferMoneyHandler2.class.getName()).log(Level.SEVERE, null, ex);
        }
        resp.sendRedirect("http://192.168.0.30:8080/InternetBanking/Success/TransferSuccess.jsp");   
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
     
}
