package Handlers;
import Database.DBHelper;
import Models.UserModel;
import Utils.Constants;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/LoginClickHandler"})
public class LoginClickHandler extends HttpServlet {

    
    public LoginClickHandler(){
        
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request,HttpServletResponse response )throws ServletException{
        
    }
    
  
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response )throws ServletException, IOException{
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
       
        DBHelper db;
        String accno="";
        UserModel m = new UserModel();
        try {
            db = new DBHelper();
            boolean flag=db.checkAccountExists(request.getParameter("phone"),request.getParameter("password"));
            
            if(flag)
            {
                accno = db.giveAccnoFromPhone(request.getParameter("phone"));
                m = db.readeverythingfromDB(request.getParameter("phone"),accno);
                
                Constants.firstname = m.getFirstname();
                Constants.lastname = m.getLastname();
                Constants.email = m.getEmail();
                Constants.country = m.getCountry();
                Constants.phone = String.valueOf(m.getPhone());
                Constants.accno = String.valueOf(m.getAccno());
                Constants.balance = String.valueOf(m.getBalance());
                Constants.pin = String.valueOf(m.getPin());
                Constants.password = request.getParameter("password");
                response.sendRedirect("MainActivity.jsp");
                pw.close();
            }
            else{
              response.sendRedirect("/InternetBanking/Success/LoginFailed.jsp");
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginClickHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
}
