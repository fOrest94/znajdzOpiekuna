package info.znOpk.service;


import info.znOpk.model.User;

public interface UserService {

    void save(User user);

    User findByUsername(String email);
}
