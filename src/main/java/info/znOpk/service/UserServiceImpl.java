package info.znOpk.service;

import info.znOpk.model.OfferCare;
import info.znOpk.model.SearchCare;
import info.znOpk.model.User;
import info.znOpk.repository.OfferCareRepository;
import info.znOpk.repository.SearchCareRepository;
import info.znOpk.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private OfferCareRepository offerCareRepository;

    @Autowired
    private SearchCareRepository searchCareRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRole("USER");
        userRepository.save(user);
    }

    @Override
    public void save(OfferCare nanny) {

        offerCareRepository.save(nanny);
    }

    @Override
    public void save(SearchCare searchCare) {

        searchCareRepository.save(searchCare);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public void setActive(Integer active, Long id) {
        userRepository.updateActive(active, id);
        userRepository.flush();
    }


}