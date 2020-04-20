package Database;

import Models.HistoryModel;
import Models.UserModel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Shivam
 */
public class DBHelper {
    Connection con=null;
    
    public DBHelper() throws Exception{
                                                
                 Class.forName("com.mysql.jdbc.Driver");
                 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashconnect","root","");              
    }
    
    public String giveAccnoFromPhone(String phone) throws SQLException{
        PreparedStatement st = con.prepareStatement("select acc_no from userdata where phone='"+phone+"'");
        ResultSet rs = st.executeQuery();
        
        String accno="";
        while(rs.next()){
            accno = rs.getString(1);
        }
        return accno;
    }
    
    public UserModel readeverythingfromDB(String phone,String accno) throws SQLException{
        UserModel m = new UserModel();
        
        PreparedStatement st = con.prepareStatement("select * from account where acc_no='"+accno+"'");
        ResultSet rs = st.executeQuery();
        PreparedStatement st2 = con.prepareStatement("select * from userdata where phone='"+phone+"'");
        ResultSet rs2 = st2.executeQuery();
        
        while(rs.next()){
        m.setAccno(rs.getLong(1));
        m.setBalance(rs.getInt(2));
        m.setPin(rs.getInt(3));
        m.setCountry(rs.getString(4));
        }
        while(rs2.next()){
        m.setFirstname(rs2.getString(2));
        m.setLastname(rs2.getString(3));
        m.setEmail(rs2.getString(4));
        m.setPhone(rs2.getLong(5));
        m.setPassword(rs2.getString(6));
        }
        
        return m;
    }
    
    public UserModel readfromDBbyAccNo(String accno) throws SQLException{
        UserModel m = new UserModel();
        
        PreparedStatement st = con.prepareStatement("select * from account where acc_no='"+accno+"'");
        ResultSet rs = st.executeQuery();
        PreparedStatement st2 = con.prepareStatement("select * from userdata where acc_no='"+accno+"'");
        ResultSet rs2 = st2.executeQuery();
        
        m.setFirstname("");
        
        while(rs.next()){
        m.setAccno(rs.getLong(1));
        m.setBalance(rs.getInt(2));
        m.setPin(rs.getInt(3));
        m.setCountry(rs.getString(4));
        }
        while(rs2.next()){
        m.setFirstname(rs2.getString(2));
        m.setLastname(rs2.getString(3));
        m.setEmail(rs2.getString(4));
        m.setPhone(rs2.getLong(5));
        }
        
        return m;
    }
    
    public boolean checkAccountExists(String phone,String password) throws SQLException{
        
        PreparedStatement st = con.prepareStatement("select email_id from userdata where phone='"+phone+"' and password='"+password+"'");
        ResultSet rs = st.executeQuery();
        String email = "";
        while(rs.next()){
            email = rs.getString(1);
        }
        if(email.equalsIgnoreCase(""))
            return false;
        return true;
    }
    
    public ArrayList<HistoryModel> getHistoryFromAccno(String accno) {
          ArrayList<HistoryModel> finalList = new ArrayList();
          
          try{
            PreparedStatement st = con.prepareStatement("select * from transaction_history where acc_no='"+accno+"'");
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){        
                HistoryModel hm = new HistoryModel();
                hm.setAccno(Long.parseLong(accno));
                hm.setDate(rs.getString(2));
                hm.setAmount(rs.getInt(3));
                hm.setForeign(rs.getString(4));
                hm.setSenderORreceiver(rs.getString(5));
                hm.setRemark(rs.getString(6));   
                hm.setOTP(rs.getString(7));
                finalList.add(hm);
            }                   
          }
          catch(Exception e){e.printStackTrace();}
                 
          return finalList;
    }
    
    public boolean checkAccountAlreadyExists(String accno){
        
        try{
            PreparedStatement st = con.prepareStatement("select acc_no from account where acc_no='"+accno+"'");
            ResultSet rs = st.executeQuery();
            String accno_test = "";
            while(rs.next()){        
              accno_test=String.valueOf(rs.getLong(1));
            }
            if(accno_test.equalsIgnoreCase(""))
                return true;
          }
          catch(Exception e){e.printStackTrace();}
        
       return false;
    }
    
    public void insertToDB(UserModel um){
        try {
         String sql="Insert into account(acc_no,atm_pin,country) values('"+um.getAccno()+"','"+um.getPin()+"','"+um.getCountry()+"')";
         Statement st;
        
            st = con.createStatement();
            st.executeUpdate(sql);
          

            sql="Insert into userdata(acc_no,first_name,last_name,email_id,phone,password) values('"+um.getAccno()+"','"+um.getFirstname()+"','"+um.getLastname()+"','"+um.getEmail()+"','"+um.getPhone()+"','"+um.getPassword()+"')";
                
            st = con.createStatement();
            st.executeUpdate(sql);
        }
        catch (SQLException ex) {
            Logger.getLogger(DBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateDB(String accno,String balance,String remark,String amount,String senderORreceiver,String foreign,String OTP){
        try {
        String sql="UPDATE account SET balance='"+balance+"' where acc_no='"+accno+"'";
        Statement st;
        
            st = con.createStatement();
            st.executeUpdate(sql);
                  
            updateHistoryTable(accno,amount,remark,senderORreceiver,foreign,OTP);
     
        } catch (Exception ex) {
            Logger.getLogger(DBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateHistoryTable(String accno,String amount,String remark,String senderORreceiver,String foreign,String OTP){ 
        long datelong = System.currentTimeMillis();
        SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy");
        Date date = new Date(datelong);
        String currentDate = sdf.format(date);
        
        try{     
        String sql = "Insert into transaction_history values('"+accno+"','"+currentDate+"','"+amount+"','"+foreign+"','"+senderORreceiver+"','"+remark+"','"+OTP+"')";
        Statement st;
          st = con.createStatement();
            st.executeUpdate(sql);
        }catch(Exception e){e.printStackTrace();}             
    }
    
    public void updateForeignTable(String accno,String toAccno,String toCountry,String original_amt,String converted_amt){ 
        try{     
        String sql = "Insert into foreign_transfer values('"+accno+"','"+toCountry+"','"+toAccno+"','"+original_amt+"','"+converted_amt+"')";
        Statement st;
          st = con.createStatement();
            st.executeUpdate(sql);
        }catch(Exception e){e.printStackTrace();}             
    }
    
    public void deletefromDB(String accno) throws SQLException{
         String sql = "delete from account where acc_no='"+accno+"'";
         Statement st;
         st = con.createStatement(); 
         st.executeUpdate(sql);
    }
    /*
    public String getId(String phone) throws SQLException{
        
        PreparedStatement st = con.prepareStatement("select ID from userdata where Phone='"+phone+"'");
        ResultSet rs = st.executeQuery();
        String id="";
        while(rs.next()){
            id = rs.getString(1);
        }
        
      return id;
    }
    
    
     public String getIdFromCardNumber(String cardnumber) throws SQLException{
        
        PreparedStatement st = con.prepareStatement("select ID from account where cardnumber='"+cardnumber+"'");
        ResultSet rs = st.executeQuery();
        String id="";
        while(rs.next()){
            id = rs.getString(1);
        }
        
      return id;
    }
    
    
    public void insertToDB(UserModel um){
        try {
        String sql="Insert into userdata(FirstName,LastName,Email,Phone) values('"+um.getFirstname()+"','"+um.getLastname()+"','"+um.getEmail()+"','"+um.getPhone()+"')";
        Statement st;
        
            st = con.createStatement();
            st.executeUpdate(sql);
            
            

            sql="Insert into account(id,cardnumber,cardname,cvv,pincode,balance) values('"+getId(um.getPhone())+"','"+um.getCardnumber()+"','"+um.getCardname()+"','"+um.getCvv()+"','"+um.getPincode()+"','0')";
                
            st = con.createStatement();
            st.executeUpdate(sql);
                  
     
        } catch (Exception ex) {
            Logger.getLogger(DBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateDB(String id,String balance,String remark,String amount,String senderORreceiver){
        try {
        String sql="UPDATE account SET balance='"+balance+"' where ID='"+id+"'";
        Statement st;
        
            st = con.createStatement();
            st.executeUpdate(sql);
                  
            updateHistoryTable(id,amount,remark,senderORreceiver);
     
        } catch (Exception ex) {
            Logger.getLogger(DBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public UserModel readeverythingfromDB(String id) throws SQLException{
        UserModel m = new UserModel();
        
        PreparedStatement st = con.prepareStatement("select * from account where ID='"+id+"'");
        ResultSet rs = st.executeQuery();
        PreparedStatement st2 = con.prepareStatement("select email from userdata where ID='"+id+"'");
        ResultSet rs2 = st2.executeQuery();
        
        while(rs.next()){
        m.setCardnumber( rs.getString(2));
        m.setCardname(rs.getString(3));
        m.setCvv(rs.getString(4));
        m.setPincode(rs.getString(5));
        m.setBalance(rs.getString(6));
        }
        while(rs2.next()){
        m.setEmail(rs2.getString(1));  
        }
        
        return m;
    }
    
    public UserModel readeverythingfromDBfromCardnumber(String cardnumber) throws SQLException{
        UserModel m = new UserModel();
        
        PreparedStatement st = con.prepareStatement("select * from account where cardnumber='"+cardnumber+"'");
        ResultSet rs = st.executeQuery();
        
        m.setCardnumber("");
        m.setCardname("");
        m.setCvv("");
        m.setPincode("");
        m.setBalance("");
        m.setId("");
        
        while(rs.next()){           
        m.setId(rs.getString(1));
        m.setCardnumber( rs.getString(2));
        m.setCardname(rs.getString(3));
        m.setCvv(rs.getString(4));
        m.setPincode(rs.getString(5));
        m.setBalance(rs.getString(6));       
        }
        
        return m;
    }
    
   
    
      public void updateHistoryTable(String id,String amount,String remark,String senderORreceiver){
        long datelong = System.currentTimeMillis();
        SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy");
        Date date = new Date(datelong);
        String currentDate = sdf.format(date);
        
        try{     
        String sql = "Insert into history values('"+id+"','"+currentDate+"','"+amount+"','"+remark+"','"+senderORreceiver+"')";
        Statement st;
          st = con.createStatement();
            st.executeUpdate(sql);
        }catch(Exception e){e.printStackTrace();}             
    }
              
     public void deletefromDB(String id) throws SQLException{
         String sql = "delete from userdata where ID='"+id+"'";
         Statement st;
         st = con.createStatement(); 
         st.executeUpdate(sql);
     }
     
     public boolean checkCardNumber(String cardnumber){
        
        try{
            PreparedStatement st = con.prepareStatement("select cardnumber from account where cardnumber='"+cardnumber+"'");
            ResultSet rs = st.executeQuery();
            String ca="";
            while(rs.next()){        
              ca=rs.getString(1);
            }
            if(ca.equalsIgnoreCase(""))
                return true;
          }
          catch(Exception e){e.printStackTrace();}
        
       return false;
     }
     */
}