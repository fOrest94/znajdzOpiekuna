package info.znOpk.service;

import info.znOpk.model.SearchCare;
import info.znOpk.repository.SearchCareRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by DuduŚ on 2016-12-22.
 */
@Component
public class SearchCareServiceImpl implements SearchCareService{

    @Autowired
    private SearchCareRepository searchCareRepository;

    @Override
    public void save(SearchCare searchCare) {

        searchCareRepository.save(searchCare);
    }

    @Override
    public void update(SearchCare searchCare) {

        searchCareRepository.setSearchCareById(searchCare.getWhoWannCareNanny(),searchCare.getWhoWannCareOld(),
                searchCare.getWriteSthAboutYou(),searchCare.getMoneyPerHour(),searchCare.getWorkWithHome(),searchCare.getUserId());
    }

}
