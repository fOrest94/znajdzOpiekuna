package info.znOpk.service;

import info.znOpk.model.OfferCare;
import info.znOpk.model.SearchCare;
import info.znOpk.model.User;
import info.znOpk.repository.OfferCareRepository;
import info.znOpk.repository.SearchCareRepository;
import info.znOpk.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by DuduŚ on 2016-12-13.
 */
@Service
public class SessionServiceImpl implements SessionService{

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private OfferCareRepository offerCareRepository;

    @Autowired
    private SearchCareRepository searchCareRepository;


    @Override
    public User getUser(String userName) {
        return userRepository.findByUsername(userName);
    }

    @Override
    public User getUser(Long id) {
        return userRepository.findOne(id);
    }

    @Override
    public OfferCare getCareUser(Long id) {

        return offerCareRepository.findByUserId(id);
    }

    @Override
    public SearchCare getSearchUser(Long id) {

        return searchCareRepository.findByUserId(id);
    }
}
