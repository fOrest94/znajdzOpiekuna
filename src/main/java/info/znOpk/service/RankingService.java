package info.znOpk.service;

import info.znOpk.model.User;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-30.
 */
public interface RankingService {

    List<User> getTopOffers();
    List<User> getTopCare();
}
