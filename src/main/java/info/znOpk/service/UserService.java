package info.znOpk.service;

import info.znOpk.model.User;

import java.util.List;

public interface UserService {

    boolean save(User user);
    User findByUsername(String email);
    User findById(Long id);
    void setActive(Integer active,Long id);
    void updateSalaryAndBirthDate(String moneyPerHour, Long id);
    List<User> findAll();
    void confirmIdentity(Long id);
    void deleteUser(Long id);
    void updateZipAndTown(String moneyPerHour, Long id);
}
