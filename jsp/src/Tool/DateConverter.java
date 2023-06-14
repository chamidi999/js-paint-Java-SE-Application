/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tool;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author user
 */
public class DateConverter {

    public String convert(String date) {
        String formatedDate = null;
        try {
            String dateStr = "Mon Jun 18 00:00:00 IST 2012";
            DateFormat formatter = new SimpleDateFormat("E MMM dd HH:mm:ss Z yyyy");
            Date outDate = (Date) formatter.parse(dateStr);
            Calendar cal = Calendar.getInstance();
            cal.setTime(outDate);
            formatedDate = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DATE);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        return formatedDate;
    }
}
