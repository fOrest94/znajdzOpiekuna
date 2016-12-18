package info.znOpk.validator;

import info.znOpk.DTO.DTOSearch.SearchForm;
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
        System.out.println("sssssssssssssssssssssssv           " + searchForm.getTypeOfUser());
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "NotEmpty");
        if (searchForm.getAddress().length() < 2 || searchForm.getAddress().length() > 32) {
            System.out.println("1111111");
            errors.rejectValue("address", "Size.searchForm.address");
        } else if (checkAddress(searchForm.getAddress()).equals("error")) {
            System.out.println("222222");
            errors.rejectValue("address", "Data.searchForm.address");
        } else {

            if (searchForm.getTypeOfUser() != null) {
                if (checkAddress(searchForm.getAddress()).equals("zipCode") &&
                        (browseService.browseZipCode(searchForm.getTypeOfUser(), searchForm.getAddress()).size() < 1)) {
                    System.out.println("3333333333");
                    errors.rejectValue("address", "Empty.searchForm.address");
                } else if (checkAddress(searchForm.getAddress()).equals("town") &&
                        (browseService.browseTown(searchForm.getTypeOfUser(), searchForm.getAddress()).size() < 1)) {
                    System.out.println("44444444");
                    errors.rejectValue("address", "Empty.searchForm.address");
                }
            } else if (searchForm.getTypeOfUserL() != null) {
                checkSearchUser(searchForm.getTypeOfUserL());
            } else if (searchForm.getTypeOfUserU() != null) {
                checkSearchUser(searchForm.getTypeOfUserU());
            }

        }

    }

    public String[] checkSearchUser(String user) {

        String[] temp = new String[2];

        if (user.substring(0, 1).equals("1")) {

            temp[0] = "sister";

        } else
            temp[0] = "simple";

        if (user.substring(1, 1).equals("1")) {
            temp[1] = "whoWannCareNanny";

        } else if (user.substring(1, 1).equals("2")) {
            temp[1] = "whoWannCareOld";
        } else {
            temp[1] = "workWithHome";
        }
        System.out.println(temp.toString());
        return temp;

    }

    public String checkAddress(String address) {

        if (address.substring(2, 3).equals("-") && address.length() == 6) {

            String temp = address.substring(0, 2) + address.substring(3, 6);
            System.out.println(temp + "    1111111");
            try {
                Integer.valueOf(temp);
                System.out.println(temp + "    1111111");
                return "zipCode";

            } catch (NumberFormatException e) {
                System.out.println(temp + "    1111111fddddddddddddd");
                return "error";
            }
        } else {
            return "town";
        }
    }
}
