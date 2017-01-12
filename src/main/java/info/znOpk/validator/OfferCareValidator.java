package info.znOpk.validator;

import info.znOpk.DTO.OfferCareDAO;
import info.znOpk.model.OfferCare;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by DuduŚ on 2016-12-18.
 */
@Component
public class OfferCareValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }

    @Override
    public void validate(Object o, Errors errors) {

        OfferCareDAO offerCareDAO = (OfferCareDAO) o;

        ValidationUtils.rejectIfEmpty(errors, "writeSthAboutYou", "NotEmpty");
        if (offerCareDAO.getWriteSthAboutYou().length() < 40 || offerCareDAO.getWriteSthAboutYou().length() > 150) {
            errors.rejectValue("writeSthAboutYou", "Size.searchCare.writeSthAboutYou");
        }

        ValidationUtils.rejectIfEmpty(errors, "moneyPerHour", "NotEmpty");
        if (offerCareDAO.getMoneyPerHour().length() > 2 && !isNumeric(offerCareDAO.getMoneyPerHour())) {
            errors.rejectValue("moneyPerHour", "Data.offerCare.moneyPerHour");
        }

        if (offerCareDAO.getWhatWannaCare().size() < 1) {
            errors.rejectValue("whatWannaCare", "Empty.offerCare.pick");
        }

        if (offerCareDAO.getOtherActivities().size() < 1) {
            errors.rejectValue("whatWannaCare", "Empty.offerCare.pick");
        }

        if (offerCareDAO.getCareExperience().size() < 1) {
            errors.rejectValue("whatWannaCare", "Empty.offerCare.pick");
        }
    }

    public static boolean isNumeric(String number) {
        try {
           int d = Integer.parseInt(number);
        } catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }

    public OfferCare getSearchValues(OfferCareDAO searchCareDAO) {

        OfferCare offerCare = new OfferCare(searchCareDAO.getUserId(), searchCareDAO.getOtherSkills(), searchCareDAO.getWriteSthAboutYou(), searchCareDAO.getExperienceKidsTime(), searchCareDAO.getExperienceOldTime(),
                searchCareDAO.getPlaceOfTakeCare(), searchCareDAO.getWorkWithHome(), searchCareDAO.getMoneyPerHour(), searchCareDAO.getEducation(), searchCareDAO.getForeignLanguages());

        for (String x : searchCareDAO.getWhatWannaCare()) {
            if (x.equals("nanny"))
                offerCare.setWhoWannCareNanny("1");
            else if (x.equals("old"))
                offerCare.setWhoWannCareNanny("1");
        }

        for (String x : searchCareDAO.getOtherActivities()) {
            if (x.equals("shop"))
                offerCare.setOtherActShop("1");
            else if (x.equals("clean"))
                offerCare.setOtherActClean("1");
            else if (x.equals("vacum"))
                offerCare.setOtherActVac("1");
            else if (x.equals("cook"))
                offerCare.setOtherActCook("1");
        }

        for (String x : searchCareDAO.getCareExperience()) {
            if (x.equals("kids"))
                offerCare.setCareExpKids("1");
            else if (x.equals("old"))
                offerCare.setCareExpOld("1");
        }

        return offerCare;
    }
}
