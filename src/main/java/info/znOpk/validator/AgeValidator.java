package info.znOpk.validator;

import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by DuduŚ on 2016-12-13.
 */
@Component
public class AgeValidator {

    public int getAgeOfUser(String birthDate){

        DateFormat dateFormatter = new SimpleDateFormat("dd-MM-yyyy");
        String currentDate = dateFormatter.format(new Date());
        int ages = Integer.parseInt(currentDate.substring(6,10)) - Integer.parseInt(birthDate.substring(6,10));
        int month = Integer.parseInt(currentDate.substring(3,5)) - Integer.parseInt(birthDate.substring(3,5));
        int day = Integer.parseInt(currentDate.substring(0,2)) - Integer.parseInt(birthDate.substring(0,2));

        if(month < 0){
            ages = ages -1;
        }
        else if(month == 0 && day < 0){
            ages = ages -1;
        }

        return ages;
    }

}
