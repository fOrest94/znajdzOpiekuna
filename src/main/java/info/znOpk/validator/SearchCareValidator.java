package info.znOpk.validator;

import info.znOpk.DTO.SearchCareDAO;
import info.znOpk.model.SearchCare;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by DuduŚ on 2016-12-18.
 */
@Component
public class SearchCareValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }

    @Override
    public void validate(Object o, Errors errors) {

        SearchCareDAO searchCareDAO = (SearchCareDAO)o;

        ValidationUtils.rejectIfEmpty(errors, "writeSthAboutYou", "NotEmpty");
        if(searchCareDAO.getWriteSthAboutYou().length() < 40 || searchCareDAO.getWriteSthAboutYou().length() > 150) {

            errors.rejectValue("writeSthAboutYou", "Size.searchCare.writeSthAboutYou");
        }

        ValidationUtils.rejectIfEmpty(errors, "moneyPerHour", "NotEmpty");
        if (searchCareDAO.getMoneyPerHour().length() > 2 && !isNumeric(searchCareDAO.getMoneyPerHour())) {
            errors.rejectValue("moneyPerHour", "Data.searchCare.moneyPerHour");
        }

        if (searchCareDAO.getWhatWannaCare().size() < 1) {
            errors.rejectValue("whatWannaCare", "Empty.searchCare.whatWannaCare");
        }
    }

    public static boolean isNumeric(String number)
    {
        try
        {
            double d = Integer.parseInt(number);
        }
        catch(NumberFormatException nfe)
        {
            return false;
        }
        return true;
    }

    public SearchCare getSearchValues(SearchCareDAO searchCareDAO){

        SearchCare searchCare = new SearchCare(searchCareDAO.getUserId(),searchCareDAO.getWriteSthAboutYou(),searchCareDAO.getMoneyPerHour());

        for(String x : searchCareDAO.getWhatWannaCare()){
            if(x.equals("nanny"))
                searchCare.setWhoWannCareNanny("1");
            else if(x.equals("old"))
                searchCare.setWhoWannCareOld("1");
            else if(x.equals("home"))
                searchCare.setWorkWithHome("1");
        }
        return  searchCare;
    }
}
