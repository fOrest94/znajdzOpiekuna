package info.znOpk.service;

import info.znOpk.model.Nanny;
import info.znOpk.model.User;
import info.znOpk.repository.CareRepository;
import info.znOpk.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CareRepository careRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRole("USER");
        userRepository.save(user);
    }

    @Override
    public void save(Nanny nanny) {

        careRepository.save(nanny);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public void setActive(Integer active,Long id){userRepository.updateActive(active,id);
        userRepository.flush();}


}