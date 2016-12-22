package info.znOpk.service;

import info.znOpk.model.User;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-14.
 */
public interface BrowseService {

    List<User> browseZipCode(Integer userType, String zipCode);

    List<User> browseTown(Integer userType, String town);

    List<User> browseDetailsResultsZipCode(Integer userType, String typeOfWork, String zipCode);

    List<User> browseDetailsResultsTown(Integer userType, String typeOfWork, String zipCode);

}
