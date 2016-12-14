package info.znOpk.repository;

import info.znOpk.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-14.
 */
public interface BrowseRepository extends JpaRepository<User, Long> {

    @Query("select u from User u where u.userType like %?1")
    List<User> findByUserType(String userType);
}