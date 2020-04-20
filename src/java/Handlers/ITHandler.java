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
import static Utils.Helper.convert;
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
@WebServlet(name = "ITHandler", urlPatterns = {"/ITHandler"})
public class ITHandler extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ReceiverAccountNumber = req.getParameter("AccNo");
        int TransferAmount = Integer.parseInt(req.getParameter("TransferAmount"));
        int Balance = Integer.parseInt(Constants.balance);
        UserModel m = new UserModel();
        
        try {
            DBHelper db = new DBHelper();
            
            Intermediate.otp = Integer.toString(Helper.generateOTP());
            
            m = db.readfromDBbyAccNo(ReceiverAccountNumber);
            
            String toCur = countryTocurrency(m.getCountry());
            String fromCur = countryTocurrency(Constants.country);
            int converted_amt;
            converted_amt = (int) Math.round(convert(fromCur,toCur,Double.valueOf(TransferAmount)));
            Intermediate.converted_amt = String.valueOf(converted_amt);
            Intermediate.original_amt = String.valueOf(TransferAmount);
            Intermediate.receiver_country = m.getCountry();
            
            if(!m.getFirstname().equalsIgnoreCase("")){    //Check if receiver exists
                if(Balance>=converted_amt){
                    
                    //Sender
                    String finalBalance = String.valueOf(Balance-TransferAmount);
                    Constants.balance = finalBalance;
                    Intermediate.senderFinalBalance = Balance-TransferAmount;
                    Intermediate.sender_accno = Constants.accno;
                    Intermediate.sender_email = Constants.email;
                    MailHelper mh = new MailHelper(Constants.email);
                    mh.sendOTP(Intermediate.otp);   //Send otp to sender
                    
                    
                    //Receiver
                    m = db.readfromDBbyAccNo(ReceiverAccountNumber);
                    Intermediate.receiver_email = m.getEmail();
                    int currentReceiverBalance = m.getBalance();
                    Intermediate.receiverFinalBalance = currentReceiverBalance+converted_amt;
                    Intermediate.receiver_accno = ReceiverAccountNumber;
                    
                }
               resp.sendRedirect("OTP_page2.jsp");   
            }
            else{
               resp.sendRedirect("http://192.168.0.30:8080/InternetBanking/Success/TransferFail.jsp");  
            }
            
        } catch (Exception ex) {
            Logger.getLogger(TransferMoneyHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
   
}
