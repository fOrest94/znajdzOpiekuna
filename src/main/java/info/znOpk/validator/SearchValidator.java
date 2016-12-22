package info.znOpk.validator;

import info.znOpk.DTO.SearchForm;
import info.znOpk.service.BrowseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


/**
 * Created by DuduŚ on 2016-12-17.
 */
@Component
public class SearchValidator implements Validator {

    @Autowired
    private BrowseService browseService;

    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }

    @Override
    public void validate(Object o, Errors errors) {

        SearchForm searchForm = (SearchForm) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "NotEmpty");
        if (searchForm.getAddress().length() < 2 || searchForm.getAddress().length() > 32) {
            System.out.println("1111111");
            errors.rejectValue("address", "Size.searchForm.address");
        } else if (checkAddress(searchForm.getAddress()).equals("error")) {
            System.out.println("222222");
            errors.rejectValue("address", "Data.searchForm.address");
        }
       // else if(searchForm.getTypeOfUser().length() < 7){
            if (checkAddress(searchForm.getAddress()).equals("zipCode") &&
                    (browseService.browseZipCode(searchForm.getTypeOfUser(), searchForm.getAddress()).size() < 1)) {
                System.out.println("3333333333");
                errors.rejectValue("address", "Empty.searchForm.address");
            } else if (checkAddress(searchForm.getAddress()).equals("town") &&
                    (browseService.browseTown(searchForm.getTypeOfUser(), searchForm.getAddress()).size() < 1)) {
                System.out.println("44444444");
                errors.rejectValue("address", "Empty.searchForm.address");
            }
       // }
       // else{

       // }
    }

    public String[] checkDetailsResearchValues(String user) {

        String[] temp = new String[2];

        if (user.substring(0, 6).equals("sister")) {

            temp[0] = "OfferCare";

        } else
            temp[0] = "SearchCare";

        if (user.substring(6, 7).equals("1")) {
            temp[1] = "whoWannCareNanny";

        } else if (user.substring(6, 7).equals("2")) {
            temp[1] = "whoWannCareOld";
        } else {
            temp[1] = "workWithHome";
        }

        return temp;

    }

    public String checkAddress(String address) {

        if (address.substring(2, 3).equals("-") && address.length() == 6) {

            String temp = address.substring(0, 2) + address.substring(3, 6);
            try {
                Integer.valueOf(temp);
                return "zipCode";

            } catch (NumberFormatException e) {
                return "error";
            }
        } else {
            return "town";
        }
    }
}
