package info.znOpk.service;

import info.znOpk.model.Nanny;
import info.znOpk.model.User;

/**
 * Created by DuduŚ on 2016-12-13.
 */
public interface SessionService {
    User getUser(String userName);
    Nanny getCareUser(Long id);
}
