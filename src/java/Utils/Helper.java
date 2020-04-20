/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Models.JSONModel;
import static Utils.JsonReader.getJsonModelArrayList;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;
import org.json.JSONException;

/**
 *
 * @author Shivam
 */
public class Helper {
    
    public static int generateOTP(){
        Random random = new Random();
        return random.ints(1000,9999).findFirst().getAsInt();
    }
    
    public static String countryTocurrency(String country){
        String cur="";
        
        switch(country)
        {
            case "India": cur="INR";
                          break;
                          
            case "US": cur="USD";
                          break;
                          
            case "Japan": cur="JPY";
                          break;
                          
            case "Russia": cur="RUB";
                          break;
        }
       return cur;
    }
    
    public static Double convert(String fromCur,String toCur,Double amount) throws IOException, JSONException{
        ArrayList<JSONModel> arr = new ArrayList<>();
        arr = getJsonModelArrayList();
        int i;
        Double converted_amt=0.0,rate = 0.0;
        
        for(i=0;i<arr.size();i++)
        {
           if(arr.get(i).getToCountry().equalsIgnoreCase(toCur) && arr.get(i).getFromCountry().equalsIgnoreCase(fromCur))
           {
               rate = arr.get(i).getRate(); 
               break;
           }
        }
        converted_amt = amount*rate;
        return converted_amt;
    }
}
