package info.znOpk.service;

import info.znOpk.model.User;
import info.znOpk.repository.BrowseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-14.
 */
@Service
public class BrowseServiceImpl implements BrowseService {

    @Autowired
    private BrowseRepository browseRepository;

    @Override
    public List<User> browseZipCode(Integer userType, String zipCode) {
        return browseRepository.findByUserTypeAndZipCode(userType, zipCode);
    }

    @Override
    public List<User> browseTown(Integer userType, String town) {
        return browseRepository.findByUserTypeAndTown(userType, town);
    }

    @Override
    public List<User> browseDetailsResultsZipCode(Integer userType, String typeOfWork, String zipCode) {
        //return browseRepository.findByUserTypeAndTypeOfWorkAndZipCode(userType, typeOfWork, zipCode);
        return null;
    }

    @Override
    public List<User> browseDetailsResultsTown(Integer userType, String typeOfWork, String zipCode) {
       // return browseRepository.findByUserTypeAndTypeOfWorkAndTown(userType, typeOfWork, zipCode);
         return null;
    }
}
