package info.znOpk.service;

import info.znOpk.model.Nanny;
import info.znOpk.model.User;
import info.znOpk.repository.CareRepository;
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
    private CareRepository careRepository;

    @Override
    public User getUser(String userName) {
        return userRepository.findByUsername(userName);
    }

    @Override
    public Nanny getCareUser(Long id) {
        return careRepository.findById(id);
    }
}
