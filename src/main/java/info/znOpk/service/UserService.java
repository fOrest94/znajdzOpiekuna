package info.znOpk.service;


import info.znOpk.model.OfferCare;
import info.znOpk.model.SearchCare;
import info.znOpk.model.User;

public interface UserService {

    void save(User user);
    void save(OfferCare nanny);
    void save(SearchCare searchCare);
    User findByUsername(String email);
    void setActive(Integer active,Long id);
}
