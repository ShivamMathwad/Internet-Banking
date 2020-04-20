/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Models.JSONModel;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Shivam
 */
public class JsonReader {

  private static String readAll(Reader rd) throws IOException {
    StringBuilder sb = new StringBuilder();
    int cp;
    while ((cp = rd.read()) != -1) {
      sb.append((char) cp);
    }
    return sb.toString();
  }

  public static JSONObject readJsonFromUrl(String url) throws IOException,JSONException {
    try (InputStream is = new URL(url).openStream()) {
      BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
      String jsonText = readAll(rd);
      JSONObject json = new JSONObject(jsonText);
      return json;
    }
  }
  
  
  public static ArrayList<JSONModel> getJsonModelArrayList() throws IOException,JSONException {
    JSONObject json = readJsonFromUrl("https://api.myjson.com/bins/qn0sc");
    JSONArray ja = json.getJSONArray("currencies");
    
    int i;
    ArrayList<JSONModel> arr = new ArrayList<>();
    
    
    for(i=0;i<ja.length();i++){
        JSONObject record = ja.getJSONObject(i);
        JSONModel model = new JSONModel();
        model.setFromCountry(record.getString("from"));
        model.setToCountry(record.getString("to"));
        model.setRate(record.getDouble("rate"));  
        arr.add(model);
    }
    System.out.print(arr.get(0).getRate());
    return arr;
  }
}
