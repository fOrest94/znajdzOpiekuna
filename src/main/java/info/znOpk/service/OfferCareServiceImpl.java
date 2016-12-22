package info.znOpk.service;

import info.znOpk.model.OfferCare;
import info.znOpk.repository.OfferCareRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by DuduŚ on 2016-12-22.
 */
@Component
public class OfferCareServiceImpl implements OfferCareService {


    @Autowired
    private OfferCareRepository offerCareRepository;

    @Override
    public void save(OfferCare nanny) {

        offerCareRepository.save(nanny);
    }

    @Override
    public void update(OfferCare nanny) {

        offerCareRepository.setOfferCareById(nanny.getDataOfBirth(), nanny.getWhoWannCareNanny(), nanny.getWhoWannCareOld(), nanny.getOtherActClean()
                , nanny.getOtherActCook(), nanny.getOtherActShop(), nanny.getOtherActVac(), nanny.getOtherSkills(), nanny.getWriteSthAboutYou(), nanny.getCareExpKids(),
                nanny.getCareExpOld(), nanny.getExperienceKidsTime(), nanny.getExperienceOldTime(), nanny.getTimeJobHalf(), nanny.getTimeJobFull(),
                nanny.getTimeJobCasual(), nanny.getPlaceOfTakeCare(), nanny.getWorkWithHome(), nanny.getMoneyPerHour(), nanny.getEducation(),
                nanny.getForeignLanguages(), nanny.getUserId());
    }
}
