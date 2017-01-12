package info.znOpk.service;

import info.znOpk.model.User;
import info.znOpk.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public boolean save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRole("USER");
        if(userRepository.save(user).getId() != null){
            return true;
        }
        else
            return false;
    }

    @Override
    public void updateSalaryAndBirthDate(String moneyPerHour, Long id) {

        userRepository.updateSalary(moneyPerHour, id);
    }

    @Override
    public void updateZipAndTown(String moneyPerHour, Long id) {

        userRepository.updateSalary(moneyPerHour, id);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findById(Long id) {
        return userRepository.findById(id);
    }

    @Override
    public void setActive(Integer active, Long id) {
        userRepository.updateActive(active, id);
        userRepository.flush();
    }

    @Override
    public void confirmIdentity(Long id) {
        userRepository.updateIdentity(id);
        userRepository.flush();
    }

    @Override
    public void deleteUser(Long id) {
        userRepository.delete(id);
    }


}