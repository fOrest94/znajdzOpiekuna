package info.znOpk.service;

import info.znOpk.model.OfferCare;
import info.znOpk.model.SearchCare;
import info.znOpk.model.User;

/**
 * Created by DuduŚ on 2016-12-13.
 */
public interface SessionService {
    User getUser(String userName);
    OfferCare getCareUser(Long id);
    User getUser(Long id);
    SearchCare getSearchUser(Long id);
}
