package info.znOpk.service;

import info.znOpk.model.User;
import info.znOpk.repository.BrowseRepository;
import info.znOpk.repository.UserRepository;
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
    public List<User> browseZipCode(String userType, String zipCode) {
        return browseRepository.findByUserTypeAndZipCode(userType, zipCode);
    }

    @Override
    public List<User> browseTown(String userType, String town) {
        return browseRepository.findByUserTypeAndTown(userType, town);
    }
}
