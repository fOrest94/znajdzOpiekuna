package info.znOpk.service;


import info.znOpk.model.Nanny;
import info.znOpk.model.User;

public interface UserService {

    void save(User user);
    void save(Nanny nanny);
    User findByUsername(String email);
    void setActive(Integer active,Long id);
}
