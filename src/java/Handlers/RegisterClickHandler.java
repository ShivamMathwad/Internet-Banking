package Handlers;
import Database.DBHelper;
import Mail.MailHelper;
import Models.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/RegisterClickHandler"})
public class RegisterClickHandler extends HttpServlet {

    
    public RegisterClickHandler(){
        
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request,HttpServletResponse response )throws ServletException{
        
    }
    
  
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response )throws ServletException, IOException{
        PrintWriter pw = response.getWriter();
        
        UserModel usermodel = new UserModel();
        usermodel.setFirstname(request.getParameter("FirstName"));
        usermodel.setLastname(request.getParameter("LastName"));
        usermodel.setEmail(request.getParameter("email"));
        usermodel.setCountry(request.getParameter("dropdown"));
        usermodel.setPhone(Long.parseLong(request.getParameter("phone")));
        usermodel.setPin(Integer.parseInt(request.getParameter("pin")));
        usermodel.setAccno(Long.parseLong(request.getParameter("accno")));
        usermodel.setPassword(request.getParameter("password"));
        
        try {
            DBHelper db = new DBHelper();
            String accno = String.valueOf(usermodel.getAccno());
            if(db.checkAccountAlreadyExists(accno)){
                db.insertToDB(usermodel);
                MailHelper mh = new MailHelper(usermodel.getEmail());
                mh.sendRegistrationMail();
                response.sendRedirect("http://192.168.0.30:8080/InternetBanking/Success/RegisterSuccess.jsp");  
            }
            else
            {
              response.sendRedirect("http://192.168.0.30:8080/InternetBanking/Success/RegisterFail.jsp");  
            }
          
        } catch (Exception ex) {
            Logger.getLogger(RegisterClickHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
}