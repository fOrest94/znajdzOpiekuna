package info.znOpk.service;

import info.znOpk.model.User;
import info.znOpk.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRole("USER");
        userRepository.save(user);
    }

    @Override
    public void updateSalaryAndBirthDate(String moneyPerHour, String birthDate, Long id) {

        userRepository.updateSalary(moneyPerHour, birthDate, id);
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