package info.znOpk.service;

import info.znOpk.model.User;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-14.
 */
public interface BrowseService {

    List<User> browseResults(String userType);
}
